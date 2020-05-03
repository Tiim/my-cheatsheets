# LaTex

## Symbols

```latex
\lor %Logical OR ∨
\land %Logical AND ∧
\lnot %Logical NOT ¬

%Brackets
\langle \rangle % Angled Brackets 〈〉

\ddots % Diagonal dots
\vdots % Vertical dots
\hdots % Horizontal dots

\overset{!}{=} % Gives a equal with a exclamation point above
```

## Fonts

```latex
% Caligraphic font in math
\mathcal{text}
```

## Include Graphic

```latex
\begin{center}
  \includegraphics[width = 0.85\textwidth]{graphic.png}
\end{center}
```

## Include Code

```latex
{\tt file\_name.m }
\lstinputlisting[language=MatLab]{file_name.m}
```

### Inline code 
```latex
\begin{lstlisting}[escapeinside={(*}{*)},language=MatLab]
  if foo
  list= { (*$S_1,S_2,S_3$*) }
\end{lstlisting}
```

## Multi colum formulas

```latex
\usepackage{multicol}

\begin{multicols}{2}
  \begin{align*}
    1 + 1 &= 2
  \end{align*}
  \columnbreak
  \begin{align*}
    2 + 1 &= 3
  \end{align*}
\end{multicols}
```

## Tables

```latex
\begin{center}
  \begin{tabular}{|l|c|r|}
    \hline
    Title1 & Tile2 & Tile3 \\
    \hline
    1      & test  & 51989 \\
    2      & test  & 62782 \\
    \hline
  \end{tabular}
\end{center}
```

## Matrix / Vector

```latex
\begin{align*}
  \begin{bmatrix}
  0 & 1 \\
  2 & 3 \\
  \end{bmatrix}
\end{align*}
```

## QED, black square after proof
```latex
\newcommand{\QED}{\tag*{$\blacksquare$}}
\begin{align*}
  x + 0 &= x
  \QED
\end{align*}
```
