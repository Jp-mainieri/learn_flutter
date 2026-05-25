import { onCall, HttpsError } from "firebase-functions/v2/https";

export const validarCupom = onCall(
  { region: "southamerica-east1" },
  (request, response) => {
    const cuponsValidos = ["TPDM10", "FLUTTER15", "PUC20"];
    const data = request.data;
    const cupom = data["cupom"];
    if (typeof cupom !== "string") {
      throw new HttpsError(
        "Invalid-argument",
        "Cupom inserido é de um tipo inválido",
      );
    }
    const isValido: boolean = cuponsValidos.includes(cupom.toUpperCase());
    return {
      valido: isValido,
      mensagem: `Cupom ${cupom} ${isValido ? "" : "não"} é valido.`,
    };
  },
);
