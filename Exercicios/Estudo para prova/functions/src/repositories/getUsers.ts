import { getFirestore } from "firebase-admin/firestore";
import { User } from "../types/user";

const db = getFirestore();

async function getUsers() {
  const snapshot = await db.collection("users").get();
  const users: FirebaseFirestore.DocumentData[] = [];
  snapshot.forEach((user) => {
    users.push(user.data());
  });
}
