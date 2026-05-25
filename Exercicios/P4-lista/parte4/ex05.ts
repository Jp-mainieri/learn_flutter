import { onRequest } from "firebase-functions/v2/https";
import { Timestamp } from "firebase-admin/firestore";

export const statusServidor = onRequest({}, (request, response) => {
  const utilizedMethod = request.method;
  const timeCalled: Timestamp = Timestamp.now();
  response.send({
    message: "O servidor está ativo.",
    metodo: utilizedMethod,
    horarioDaChamada: timeCalled,
  });
});
