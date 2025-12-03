const togglePassword = document.querySelector('.toggle-password');
const passwordInput = document.getElementById('Password');
const toggleIcon = document.getElementById('toggleIcon');

togglePassword.addEventListener('click', function() {
    const type = passwordInput.getAttribute('type') === 'password' ? 'text' : 'password';
    passwordInput.setAttribute('type', type);
    
    if (type === 'password') {
        toggleIcon.classList.remove('bi-eye');
        toggleIcon.classList.add('bi-eye-slash');
    } else {
        toggleIcon.classList.remove('bi-eye-slash');
        toggleIcon.classList.add('bi-eye');
    }
});



const Login = document.getElementById('InicioSesion');
Login.addEventListener('click', async(e) =>{
    e.preventDefault();

    const username = document.getElementById('Usuario').value;
    const password = document.getElementById('Password').value;

    const body = {
        username,
        password
    };

    try{
        const res = await fetch('/login', {
            method: 'POST',
            headers: {
                "Content-Type": "application/json"
            },
            body: JSON.stringify(body)
        });

        const data = await res.json();
        alert(data.message);

        if(res.ok){
            window.location.href = "/Cards.html";
        }

    }catch(error){
        console.error("Error:", error);
    }
});