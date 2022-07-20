import "./Register.css"
import { useState } from "react";
import Axios from 'axios';


function Register() {
    const [lastName, setLastName] = useState("")
    const [firstName, setFirstName] = useState("")
    const [email, setEmail] = useState("")

    const addUser = () => {
        Axios.post('http://localhost:3001/create', {
            lastname: lastName, 
            firstname: firstName,
            email: email,
        }).then(() => {
            console.log("success");
        });
    };

    return (
        <div className="register">
            <div className="informationRegister">
            <label>LastName:</label>
            <input type="text"
            onChange={(event) => {
                setLastName(event.target.value);
            }}/>
            <label>FirstName:</label>
            <input type="text"
            onChange={(event) => {
                setFirstName(event.target.value);
            }}/>
            <label>Email:</label>
            <input type="text"
            onChange={(event) => {
                setEmail(event.target.value);
            }}/>
            <button onClick={addUser}>Register</button>
            <button className="registerButton">Show members</button>
            </div>
        </div>
        
    )
}

export default Register;