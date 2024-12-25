document.addEventListener("DOMContentLoaded", () => {
    const form = document.getElementById('category-filter-form');
  
    form.addEventListener('change', (event) => {
      event.preventDefault();
  
      fetch(form.action + '?category=' + form.category.value, {
        method: 'GET',
        headers: {
          'X-Requested-With': 'XMLHttpRequest',
          'Content-Type': 'application/json',
        },
      })
      .then(response => response.text())
      .then(html => {
        document.getElementById('products-table').innerHTML = html;
      })
      .catch(error => console.error('Error:', error));
    });
  });