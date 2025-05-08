/*document.addEventListener('DOMContentLoaded', function () {
    const passwordInput = document.getElementById('password');
    const togglePasswordSpan = document.querySelector('.toggle-password');
    const eyeIcon = togglePasswordSpan.querySelector('.eye-icon');

    // Inicialmente, el icono no se muestra
    togglePasswordSpan.style.display = 'none';

    // Función para mostrar/ocultar el icono del ojo
    function toggleEyeIcon() {
        if (passwordInput.value) {
            togglePasswordSpan.style.display = 'inline-block'; // Muestra el icono
        } else {
            togglePasswordSpan.style.display = 'none'; // Oculta el icono
        }
    }

    // Event listener para el campo de contraseña
    passwordInput.addEventListener('input', toggleEyeIcon);

    // Event listener para alternar la visibilidad de la contraseña
    togglePasswordSpan.addEventListener('click', function () {
        const isPassword = passwordInput.type === 'password';
        passwordInput.type = isPassword ? 'text' : 'password';

        // Alterna las clases del ojo
        eyeIcon.classList.toggle('closed', isPassword);
        eyeIcon.classList.toggle('open', !isPassword);
    });
}); */
