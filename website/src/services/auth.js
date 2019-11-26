import axios from "axios";
import * as ROUTES from "../utils/routes";

export async function login(email, password) {
  const payload = {
    email: email,
    password: password
  };
  const response = await axios.post(ROUTES.loginUrl, payload);
  if (response.status === 200) 
  
}

export default {
  login
};
