#!/bin/bash
clear

# Respoder as Perguntas
responder_pergunta() {
  pergunta=$1
  resposta=""

  case $pergunta in
    "Qual é o seu nome?")
      resposta="Meu nome é IASH!"
      ;;
    "Vamos jogar impar e par")
      resposta=$(impar_par)
      ;;
    "Qual é a sua função?")
      resposta="Minha função é ajudar a responder perguntas."
      ;;
    "Como você está?")
      resposta="Como sou um programa, não tenho sentimentos, mas obrigado por perguntar!"
      ;;
    "Quantos anos você tem?")
      resposta="Ainda sou muito Jovem para respoder"
      ;;
    *)
      resposta="Desculpe, não consigo responder a essa pergunta."
      ;;
  esac

  echo $resposta
}

# Jogo de impar e par
impar_par() {

clear
echo "Bem-vindo ao jogo de ímpar e par!"
echo "Você está jogando contra o computador."

jogador_pontos=0
computador_pontos=0

while true; do
    echo ""
    echo "Escolha ímpar (i) ou par (p):"
    read escolha

    if [[ "$escolha" == "i" ]]; then
        jogador_escolha="ímpar"
        computador_escolha="par"
    elif [[ "$escolha" == "p" ]]; then
        jogador_escolha="par"
        computador_escolha="ímpar"
    else
        echo "Escolha inválida. Por favor, tente novamente."
        continue
    fi

    echo "Digite um número de 1 a 10:"
    read jogador_numero

    if ! [[ "$jogador_numero" =~ ^[1-9]$|^10$ ]]; then
        echo "Número inválido. Por favor, tente novamente."
        continue
    fi

    computador_numero=$((RANDOM % 10 + 1))
    echo "O computador escolheu o número $computador_numero."

    soma=$((jogador_numero + computador_numero))
    resto=$((soma % 2))

    echo "A soma dos números é $soma."

    if [[ "$resto" -eq 0 && "$jogador_escolha" == "par" ]]; then
        echo "Você venceu esta rodada!"
        jogador_pontos=$((jogador_pontos + 1))
    elif [[ "$resto" -eq 1 && "$jogador_escolha" == "ímpar" ]]; then
        echo "Você venceu esta rodada!"
        jogador_pontos=$((jogador_pontos + 1))
    else
        echo "O computador venceu esta rodada!"
        computador_pontos=$((computador_pontos + 1))
    fi

    echo "Placar atual:"
    echo "Você: $jogador_pontos pontos"
    echo "Computador: $computador_pontos pontos"

    echo ""
    echo "Deseja jogar novamente? (s/n)"
    read novamente

    if [[ "$novamente" != "s" ]]; then
        break
    fi
done

echo ""
echo "O jogo acabou. O placar final é:"
echo "Você: $jogador_pontos pontos"
echo "Computador: $computador_pontos pontos"

if [[ "$jogador_pontos" -gt "$computador_pontos" ]]; then
    echo "Parabéns! Você venceu o jogo!"
elif [[ "$jogador_pontos" -lt "$computador_pontos" ]]; then
    echo "O computador venceu o jogo. Melhor sorte da próxima vez!"
else
    echo "O jogo terminou em empate. Bom jogo!"
fi

}

# Loop principal
while true; do
  echo "Faça uma pergunta (ou digite 'sair' para sair):"
  read pergunta

  if [ "$pergunta" == "sair" ]; then
    break
  fi

  resposta=$(responder_pergunta "$pergunta")
  echo "Resposta: $resposta"
done

echo "Obrigado por usar a AI em Shell Script!"