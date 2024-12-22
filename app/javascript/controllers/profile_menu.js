document.addEventListener('DOMContentLoaded', function() {
    const profileIcon = document.getElementById('profileIcon');
    const dropdownMenu = document.getElementById('dropdownMenu');
  
    profileIcon.addEventListener('mouseenter', function() {
      dropdownMenu.style.display = 'block'; // Показываем меню
      console.log('robit');
    });
  
    profileIcon.addEventListener('mouseleave', function() {
      dropdownMenu.style.display = 'none'; // Скрываем меню
    });
  
    dropdownMenu.addEventListener('mouseenter', function() {
      dropdownMenu.style.display = 'block'; // Показываем меню при наведении
    });
  
    dropdownMenu.addEventListener('mouseleave', function() {
      dropdownMenu.style.display = 'none'; // Скрываем меню при уходе
    });
  });