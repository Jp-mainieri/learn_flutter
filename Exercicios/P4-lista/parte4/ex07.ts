import { onRequest } from "firebase-functions/v2/https";

export const converterTemperatura = onRequest(
  {
    region: "southamerica-east1",
  },
  (request, response) => {
    const celcius = +request.query.temperaturaCelcius;
    if (Number.isNaN(celcius)) {
      response.status(400).send({
        error: "Invalid-argument",
        message: "A temperatura em graus celcius tem que ser um numero valido",
      });
      return;
    }
    const fahrenheit = celcius * 1.8 + 32;
    const kelvin = 273 + celcius;
    response.send({
      celcius,
      fahrenheit,
      kelvin,
    });
  },
);
