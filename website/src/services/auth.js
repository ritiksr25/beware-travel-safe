import axios from "axios";
import * as ROUTES from "../utils/routes";

export async function login(email, password) {
  const payload = {
    email: email,
    password: password
  };
  const { data } = await axios.post(ROUTES.loginUrl, payload);
  console.log(data);
}

export default {
  login
};
