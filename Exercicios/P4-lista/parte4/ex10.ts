import { onCall, HttpsError } from "firebase-functions/v2/https";
import { getFirestore } from "firebase-admin/firestore";
import { initializeApp } from "firebase-admin/app";

initializeApp();
const db = getFirestore();
const productsColl = db.collection("pedidos");

interface Pedido {
  produto: Produto;
  quantidade: number;
  valorTotal: number | null;
}

function calcularValorTotal(pedido: Pedido): void {
  pedido.valorTotal = pedido.produto.preco * pedido.quantidade;
}

interface Produto {
  nome: string;
  preco: number;
}

export const criarPedido = onCall(
  {
    region: "southamerica-east1",
  },
  async (request, response) => {
    if (!request.auth) {
      throw new HttpsError("unauthenticated", "Usuário não autenticado");
    }

    const pedido: Pedido = request.data;
    calcularValorTotal(pedido);

    const docRef = await productsColl.doc();
    await docRef.set({
      pedido,
    });
    return {
      message: `Pedido adicionado com sucesso: ${docRef.id}`,
    };
  },
);
