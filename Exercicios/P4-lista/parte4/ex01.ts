import { onRequest } from "firebase-functions/v2/https";
import { Timestamp } from "firebase-admin/firestore";

export const helloApi = onRequest(
  {
    region: "southamerica-east1",
  },
  (request, response) => {
    response.send({
      mensagem: "Olá Firebase Functions!",
      timestamp: Timestamp.now(),
    });
  },
);
