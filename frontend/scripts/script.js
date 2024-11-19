<<<<<<< HEAD
$(document).ready(function(){
    $('.sub-button').click(function(){
=======
$(document).ready(function () {
    $('.sub-button').click(function () {
>>>>>>> main
        $(this).next('.sub-menu').slideToggle();
        $(this).find('.dropdown').toggleClass('rotate');
    });

<<<<<<< HEAD
    $('.menu-btn').click(function(){
=======
    $('.menu-btn').click(function () {
>>>>>>> main
        $('.side-bar').addClass('active');
        $('.menu-btn').css("visibility", "hidden");
    });

<<<<<<< HEAD
    $('.close-btn').click(function(){
        $('.side-bar').removeClass('active');
        $('.menu-btn').css("visibility", "visible");
    });
=======
    $('.close-btn').click(function () {
        $('.side-bar').removeClass('active');
        $('.menu-btn').css("visibility", "visible");
    });

    const searchInput = document.getElementById('search');
    searchInput.addEventListener('input', (event) => {
        let value = formatString(event.target.value);
        const items = document.querySelectorAll('.products .product');
        const noResults = document.getElementById('no_results');

        let hasResults = false;

        items.forEach(product => {
            if (formatString(product.textContent).includes(value)) {
                product.style.display = 'flex';
                hasResults = true;
            } else {
                product.style.display = 'none';
            }
        });

        noResults.style.display = hasResults ? 'none' : 'flex';
    });

    function formatString(value) {
        return value
            .toLowerCase()
            .trim()
            .normalize("NFD")
            .replace(/[\u0300-\u036f]/g, "");
    }
>>>>>>> main
});