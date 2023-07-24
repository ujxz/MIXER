#!/bin/bash

# Escreva ./AI.sh para começar
clear
# Função que responde às perguntas
responder_pergunta() {
  pergunta=$1
  resposta=""

  case $pergunta in
    "Qual é o seu nome?")
      resposta="Meu nome é IASH!"
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
