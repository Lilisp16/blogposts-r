// Obtener los elementos de la contraseña y el mensaje
const passwordField = document.getElementById('password');
const passwordInfo = document.getElementById('password-info');
const lengthMessage = document.getElementById('length');
const letterMessage = document.getElementById('letter');
const numberMessage = document.getElementById('number');

// Inicialmente ocultar los mensajes de validación
passwordInfo.style.display = 'none';

// Función para validar la contraseña
function validatePassword() {
    const password = passwordField.value;

    // Mostrar los mensajes de validación solo después de que el usuario empiece a escribir
    if (password.length > 0) {
        passwordInfo.style.display = 'block';
    } else {
        passwordInfo.style.display = 'none';
    }

    // Comprobar la longitud de la contraseña (al menos 8 caracteres)
    const lengthValid = password.length >= 8;
    lengthMessage.classList.toggle('invalid', !lengthValid);
    lengthMessage.classList.toggle('valid', lengthValid);

    // Comprobar que tenga al menos una letra (mayúscula o minúscula)
    const letterValid = /[a-zA-Z]/.test(password);
    letterMessage.classList.toggle('invalid', !letterValid);
    letterMessage.classList.toggle('valid', letterValid);

    // Comprobar que tenga al menos un número
    const numberValid = /[0-9]/.test(password);
    numberMessage.classList.toggle('invalid', !numberValid);
    numberMessage.classList.toggle('valid', numberValid);

    // Si la contraseña cumple con todos los requisitos, habilitar el botón de enviar
    if (lengthValid && letterValid && numberValid) {
        document.querySelector('button[type="submit"]').disabled = false;
    } else {
        document.querySelector('button[type="submit"]').disabled = true;
    }
}

// Agregar el evento de input al campo de contraseña
passwordField.addEventListener('input', validatePassword);
