import { onRequest } from "firebase-functions/v2/https";
import { inicializeApp } from "firebase-admin/app";
import { setGlobalOptions } from "firebase-functions";

setGlobalOptions({ region: "southamerica-east1" });

inicializeApp();

export const helloWorld = onRequest(async (request, response) => {
  try {
    response.send("Hello World");
  } catch (e) {
    console.error("Erro: ", e);
    response.status(500);
  }
});

export const helloName = onRequest(async (request, response) => {
  try {
    const userName = await request.body.JSON();
    if (userName.trim() == "") {
      throw Error("Nenhum nome foi enviado");
    }
    response.send(`Hello, ${userName}!`);
  } catch (e) {
    console.error(e);
    response.status(500);
  }
});
