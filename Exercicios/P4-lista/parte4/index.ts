//  ex11.ts (Já tinha feito todos os outros arquivos em .ts)

export { helloApi } from "./ex01";
export { somarNumeros } from "./ex02";
export { calcularFrete } from "./ex03";
export { validarCupom } from "./ex04";
export { statusServidor } from "./ex05";
export { calculatMediaAluno } from "./ex06";
export { converterTemperatura } from "./ex07";
export { registrarFeedback } from "./ex08";
export { listarProdutosPublicos } from "./ex09";
export { criarPedido } from "./ex10";

// A diferença entre onRequest e onCall é que a onRequest é uma requisição HTTP padrão, podem ser usados varios métodos.
// Já a onCall é chamada dentro do app, e usa return, request.auth e request.data;
