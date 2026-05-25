import { onCall, HttpsError } from "firebase-functions/v2/https";
import { getFirestore } from "firebase-admin/firestore";
import { initializeApp } from "firebase-admin/app";

initializeApp();
const db = getFirestore();

export const registrarFeedback = onCall(async (request, response) => {
  const { nome, email, mensagem } = request.data;
  if (!nome || !email || !mensagem) {
    throw new HttpsError(
      "Invalid-argument",
      "É necessário que todos os campos obrigatórios sejam preenchidos",
    );
  }

  const docRef = db.collection("feedbacks").doc();
  await docRef.set({
    nome,
    email,
    mensagem,
  });
  return {
    message: `Feedback adicionado com sucesso: ${docRef.id}`,
  };
});
