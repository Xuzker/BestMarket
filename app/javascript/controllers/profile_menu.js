document.addEventListener('DOMContentLoaded', function() {
  const profileIcon = document.getElementById('profileIcon');
  const dropdownMenu = document.getElementById('dropdownMenu');
  let hideTimeout; // Переменная для хранения таймера

  profileIcon.addEventListener('mouseenter', function() {
      clearTimeout(hideTimeout); // Очищаем таймер, если курсор снова над иконкой
      dropdownMenu.style.display = 'block'; // Показываем меню
  });

  profileIcon.addEventListener('mouseleave', function() {
      hideTimeout = setTimeout(function() {
          dropdownMenu.style.display = 'none'; // Скрываем меню с задержкой
      }, 300); // Задержка в 300 миллисекунд (можно изменить по желанию)
  });

  dropdownMenu.addEventListener('mouseenter', function() {
      clearTimeout(hideTimeout); // Очищаем таймер, если курсор над меню
      dropdownMenu.style.display = 'block'; // Показываем меню
  });

  dropdownMenu.addEventListener('mouseleave', function() {
      hideTimeout = setTimeout(function() {
          dropdownMenu.style.display = 'none'; // Скрываем меню с задержкой
      }, 300); // Задержка в 300 миллисекунд
  });
});