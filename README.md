# Hecho en #CDMX

Campaña para identificar proyectos creados en la Ciudad de México.

## Inicio rápido

### Requerimientos

* [Compass](http://compass-style.org)
* [Ruby](http://ruby-lang.org)
* [node.js](http://nodejs.org)
* [grunt](http://gruntjs.com)
* [Bower](http://bower.io)

_([Guía para usuarios de Windows](https://gist.github.com/jaromero/9964937))_

### Dependencias

Ya teniendo los paquetes mencionados, se deben instalar las dependencias para grunt y para la maqueta misma de este modo:

    $ cd <DIRECTORIO DE MAQUETA>
    $ npm install
    $ bower install

### Compilar la maqueta

En la raíz del repositorio:

    $ grunt build

NOTA: Esto no conserva comentarios en coffeescript al compilarlos. Chequen la fuente en coffeescript para éstos.

## Servidor de prueba

Simplemente se ejecuta `grunt serve` dentro de este directorio, y el servidor está disponible en http://localhost:9000/. Compila SCSS y coffeescript, pero no minifica ni concatena.
