document.addEventListener("DOMContentLoaded", function() {
    const editButton = document.getElementById("edit-button");
    const saveButton = document.getElementById("save-button");
    const cancelButton = document.getElementById("cancel-button");
    const usernameInput = document.getElementById("username");
    const passwordInput = document.getElementById("password");

    // Inicialmente, los campos de texto están deshabilitados
    usernameInput.disabled = true;
    passwordInput.disabled = true;

    // Cuando se haga clic en el botón "Editar"
    editButton.addEventListener("click", function() {
        usernameInput.disabled = false;
        passwordInput.disabled = false;
        saveButton.style.display = "inline"; // Mostrar el botón de guardar
        cancelButton.style.display = "inline"; // Mostrar el botón de cancelar
        editButton.style.display = "none"; // Ocultar el botón de editar
    });

    // Cuando se haga clic en el botón "Cancelar"
    cancelButton.addEventListener("click", function() {
        usernameInput.disabled = true;
        passwordInput.disabled = true;
        saveButton.style.display = "none"; // Ocultar el botón de guardar
        cancelButton.style.display = "none"; // Ocultar el botón de cancelar
        editButton.style.display = "inline"; // Mostrar el botón de editar
    });
});
