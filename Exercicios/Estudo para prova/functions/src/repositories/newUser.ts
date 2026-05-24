import { getFirestore } from "firebase-admin/firestore";
import { User } from "../types/user";

const db = getFirestore();

const newUser = new User(
  "João Pedro Panza Mainieri",
  "joaopedro.mainieri@gmail.com",
  "Jppm2006$",
);

export async function addUserFirestore(user: User) {
  try {
    const docRef = await db.collection("users").add(user);
  } catch (e) {
    console.error("Erro ao inserir usuário: ", e);
  }
}
