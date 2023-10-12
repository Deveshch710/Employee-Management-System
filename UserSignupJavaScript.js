var pass = document.getElementById('TextBox11');
var flag = 1;
function check(ele) {
    if (ele.value.length > 0) {
        document.getElementById('alert').innerText = "";
        flag = 1;
        if (ele.value != pass.value) {
            document.getElementById('alert').innerText = "Please Enter Correct Password";
            flag = 0;
        }
        else {
            document.getElementById('alert').innerText = "";
            flag = 1;
        }
    }
    else {
        document.getElementById('alert').innerText = "Please Enter Password";
        flag = 0;
    }
}

function validate() {
    if (flag == 1) {
        return true;
    }
    else {
        return false;
    }
}