# Celdas de código en látex

Con el siguiente código podemos crear celdas de código en látex de diversos lenguajes de programación.

```latex
\documentclass{article}

% ---- Paquetes necesarios ----
\usepackage[spanish]{babel}
\usepackage[utf8]{inputenc}
\usepackage{minted}
\usepackage{vmargin}

%---- Margen ------------
\setpapersize{A4}
\setmargins{2cm}% margen izquierdo
{1.5cm}% margen superior
{16.5cm}% anchura del texto
{23.42cm}% altura del texto
{10pt}% altura de los encabezados
{1cm}% espacio entre el texto y los encabezados
{0pt}% altura del pie de pagina
{2cm}% espacio entre el texto y el pie de pagina

\begin{document}
Lo siguiente es una celda de codigo:

\begin{minted}[frame=lines,linenos=true,breaklines]{plpgsql}
-- Esto es un comentario en SQL

SELECT * FROM prueba;
\end{minted}
```

Así, dentro del cuerpo del documento (una vez ejecutado el código anterior) podemos escribir 

```latex
\begin{minted}[frame=lines,linenos=true,breaklines]{plpgsql}
-- Esto es un comentario en SQL

SELECT * FROM prueba;
\end{minted}
\end{document}
```

lo cual nos arrojará algo como:

```sql
-- Esto es un comentario en SQL

SELECT * FROM prueba;
```

