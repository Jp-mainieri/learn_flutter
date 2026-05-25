import { onRequest } from "firebase-functions/v2/https";
import { getFirestore } from "firebase-admin/firestore";
import { initializeApp } from "firebase-admin/app";

initializeApp();
const db = getFirestore();
const productsColl = db.collection("produtos");

export const listarProdutosPublicos = onRequest(
  { region: "southamerica-east1" },
  async (request, response) => {
    const snap = await productsColl.where("ativo", "==", true).get();
    const docs = snap.docs;
    const data = docs.map((doc) => doc.data());
    response.send({
      data,
    });
  },
);
