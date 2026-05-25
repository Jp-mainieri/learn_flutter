import { onRequest, HttpsError } from "firebase-functions/v2/https";

export const calcularFrete = onRequest(
  {
    region: "southamerica-east1",
  },
  (request, response) => {
    const distanciaKm: number = +request.query.distanciaKm;
    const pesoKg: number = +request.query.pesoKg;

    if (Number.isNaN(pesoKg) || Number.isNaN(distanciaKm)) {
      response.status(400).send({
        error: "Invalid-argument",
        message: "Distancia e peso tem que ser números.",
      });
      return;
    }

    const frete = 0.1 * (distanciaKm * pesoKg);

    response.send({
      frete,
    });
  },
);
