#!/bin/bash
# Autor: David Dorante Lucas

function ruta_web_local(){
  local ruta='/home/david/david_web'
  cd $ruta
}

function copiar_fichero_site(){
  local ruta1='/home/david/david_web/_site/*'
  local ruta2='/home/david/david_web_estatica/'
  
  cp -R $ruta1 $ruta2

}

function acciones_git(){
  git init
  
  git add *

  git commit -m 'Cambios realizados con scripts'

  git push -u origin main
}

function proceso_automatizado(){
  sudo bundle exec jekyll build

  copiar_fichero_site

  acciones_git

  cd /home/david/david_web_estatica

  acciones_git
}


function automatizacion_generacion_web(){
  local ruta=$(pwd)
  if [[ $ruta != '/home/david/david_web' ]]; then
    ruta_web_local
  else
    proceso_automatizado
  fi
}

# Ejecución de la función que se encarga de automatizar la generación de la web en caso de modificación
automatizacion_generacion_web
