import { onCall, HttpsError } from "firebase-functions/v2/https";

export const somarNumeros = onCall(
  {
    region: "southamerica-east1",
  },
  (request, response) => {
    const { a, b } = request.data; // No onCall não precisa do parse para JSON, os dados ja chegam prontos em request.data;
    if (typeof a !== "number" || typeof b !== "number") {
      throw new HttpsError(
        "Invalid-argument",
        "A e B precisam ser válidos e não podem ser null",
      );
    }
    const soma = a + b;
    return {
      // Em onCall functions apenas retornamos o valor com return, Sem response,send...;
      soma: soma,
    };
  },
);
