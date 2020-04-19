# LaTex

## Symbols

```latex
\lor %Logical OR ∨
\land %Logical AND ∧
\lnot %Logical NOT ¬

%Brackets
\langle \rangle % Angled Brackets 〈〉

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
