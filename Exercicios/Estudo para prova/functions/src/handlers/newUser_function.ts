import { onRequest } from "firebase-functions/v2/https";
import { setGlobalOptions } from "firebase-functions";
import { initializeApp } from "firebase-admin/app";
import { addUserFirestore } from "../repositories/newUser";
import { User } from "../types/user";

initializeApp();
setGlobalOptions({ region: "southamerica-east1" });

export const newUser = onRequest(async (request, response) => {
  try {
    const user = request.body as User;
    if (!user || typeof user !== "object") {
      // user é do tipo User
      throw new Error("Bad request");
    }

    await addUserFirestore(user);
    response.status(201).send({ message: "User created" });
  } catch {
    response.status(400).send({ error: "Bad request" });
  }
});
