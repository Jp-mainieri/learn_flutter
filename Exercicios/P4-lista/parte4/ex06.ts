import { onCall, HttpsError } from "firebase-functions/v2/https";

export const calculatMediaAluno = onCall({}, (request, response) => {
  const listaNotas: number[] = request.data;
  if (listaNotas == undefined || listaNotas.length == 0) {
    throw new HttpsError("Invalid-argument", "Lista de notas inválida");
  }
  let mediaAluno: number = 0;
  for (const n of listaNotas) {
    mediaAluno += n;
  }
  mediaAluno = mediaAluno / listaNotas.length;
  const situacao =
    mediaAluno >= 6
      ? "Aprovado"
      : mediaAluno >= 4
        ? "Recuperação"
        : "Reprovado";
  return {
    mediaAluno,
    situacao,
  };
});
