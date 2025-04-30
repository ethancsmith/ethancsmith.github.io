---
layout: post
mathjax: true
title:  "An unsolved problem in calc II"
#date:   2025-04-27 
category: calculus 
tags: 
    - series 
    - "Dirichlet's approximation theorem"
---

I noticed the following line in Exercise 10.4.73 of _Thomas' Calculus_ while teaching calc II a few years ago.
>It is not yet known whether the series
\begin{equation}\label{thomas-series}
\sum_{n=1}^\infty\frac{\csc^2 n}{n^3}
\end{equation}
converges or diverges.

I spent about an hour that afternoon trying to work out why the problem was so difficult.
While I failed to determine whether the series converges or diverges, I discovered another fun application of one of my favorite theorems in number theory.
Since I figured that I would probably fail, I decided to replace the isolated series \eqref{thomas-series} by the Dirichlet series
\begin{equation}\nonumber
f(s) = \sum_{n=1}^\infty\frac{\csc^2 n}{n^s}.
\end{equation}
That way I could use the parameter $s$ to "measure" my progress toward understanding \eqref{thomas-series}.

# The trivial comparison.

Since $|\sin\theta| \le 1$ for all $\theta\in\R$, it follows that
\begin{equation}\nonumber
\frac{\csc^2 n}{n^s}\ge\frac{1}{n^s}>0
\end{equation}
for each integer $n\ge 1$.
Therefore, since the series
\begin{equation}\nonumber
\sum_{n=1}^\infty\frac{1}{n^s}
\end{equation}
diverges for $s\le 1$, it follows that $f(s)$ diverges for all $s\le 1$ by [direct comparison](https://en.wikipedia.org/wiki/Direct_comparison_test).

# Exploiting periodicity.

To learn more about $f(s)$ when $s>1$, we are going to need to understand when $\csc^2 n$ is unusually large compared to $n^s$.
Since the square of the cosecant is periodic with period $\pi$, for each integer $n\ge 1$, we have
\begin{equation}\nonumber
\csc^2 n = \csc^2(n - \pi[n/\pi]),
\end{equation}
where $[x]$ denotes the nearest integer to $x$.
This encourages us to consider the inequality $|\sin\theta|\le |\theta|$, which is more accurate than the trivial upper bound for small $\theta$.
Unfortunately, all that we can say in general is that
\begin{equation}\label{best-pi-approx-with-arbitrary-numerator}
\Big|n-\pi[n/\pi]\Big| \le \frac{\pi}{2},
\end{equation}
and that gives us the lower bound
\begin{equation}\label{nth-term-lower-bound}
\frac{\csc^2 n}{n^s} = \frac{\csc^2(n -\pi [n/\pi])}{n^s} 
\ge \frac{1}{(n-\pi [n/\pi])^2 n^s}
\gt \frac{4}{\pi^2n^s}\gt 0
\end{equation}
for every integer $n\ge 1$.
This, of course, leads us to comparison with the series
\begin{equation}\nonumber
\sum_{n=1}^\infty\frac{4}{\pi^2n^s},
\end{equation}
which diverges for the exact same range of $s$ as before, namely $s\le 1$.
However, this failure helps us see what this problem is really all about.
The inequalities \eqref{best-pi-approx-with-arbitrary-numerator} and \eqref{nth-term-lower-bound} show us that the $n$th term of $f(s)$ is large precisely when the rational number $\frac{n}{[n/\pi]}$ is an "unusually good" approximation to $\pi$ relative to the size of $n^s$.
In particular, if we could replace the $\pi/2$ on the right-hand side of \eqref{best-pi-approx-with-arbitrary-numerator} with some function of $n$ that tends to zero as $n\to\infty$, then we could squeeze a bit more out of this argument.
Unfortunately, the constant $\pi/2$ is the best that we can do in general.
Fortunately, we don't need to do better than a \eqref{best-pi-approx-with-arbitrary-numerator} for every single $n$.
We just need to do better infinitely many times.


# Approximating $\pi$ by rationals.

To extend the reach of our arguments a little closer to $s=3$, we need to use a little number theory, which is why this is a blog post rather than a page in my calc II notes.
Since $\pi$ is irrational, it follows from [Dirichlet's approximation theorem](https://en.wikipedia.org/wiki/Dirichlet's_approximation_theorem) that there is an infinite sequence of rational numbers $(p_k/q_k)$ so that
\begin{equation}\nonumber
\left|\pi - \frac{p_k}{q_k}\right| \lt \frac{1}{q_k^2}
\end{equation}
and $q_{k+1}\gt q_k$ for every integer $k\ge 1$.
In other words, $\pi$ is well-approximated by rational numbers with relatively small denominators (which is equivalent to having relatively small numerators).
Therefore, instead of concerning ourselves with obtaining lower bounds on $(\csc^2 n)/n^s$ for all integers $n\ge 1$, we just worry about the value taken on the subsequence of numerators $p_k$.
In particular, we have that
\begin{equation}
\frac{\csc^2 p_k}{p_k^s} = \frac{\csc^2(p_k-\pi q_k)}{p_k^s}
\ge \frac{1}{(p_k-\pi q_k)^2p_k^s}
\gt \frac{q_k^2}{p_k^s}
\gt \frac{q_k^2}{\left(q_k\pi-\frac{1}{q_k}\right)^s}
\gt \frac{q_k^2}{\left(q_k\pi\right)^s}.
\end{equation}
Thus, we see that for $s\le 2$,
\begin{equation}\nonumber
\limsup_{n\to\infty}\frac{\csc^2 n}{n^s}\ge \frac{1}{\pi^2}>0,
\end{equation}
and hence
\begin{equation}\nonumber
\lim_{n\to\infty}\frac{\csc^2 n}{n^s}\ne 0.
\end{equation}
Therefore, $f(s)$ diverges by the [test for divergence](https://en.wikipedia.org/wiki/Nth-term_test) for all $s\le 2$.
This certainly improves upon the trivial comparison, but unfortunately still falls short of our goal of understanding $f(s)$ at $s=3$.

# One more idea that is probably doomed to fail.

To show that $f(s)$ diverges for $s\le 2$, we fell back on the test for divergence rather than a proper comparison test.
If we knew something about the growth rate of the sequence of denominators $q_k$, we might hope for a comparison with a sequence of terms that passes the test for divergence and yet yields a divergent series.
Consider for example the sequence
\begin{equation}\nonumber
a_n = \begin{cases}
\displaystyle\frac{\csc^2 n}{n^3} & \text{if } n = p_k\text{ for some } k\ge 1,\newline
0 & \text{otherwise}.
\end{cases}
\end{equation}
Clearly then $(\csc^2 n)/n^3\ge a_n\ge 0$ for all integers $n\ge 1$.
Thus, if we could show that
\begin{equation}\nonumber
\sum_{n=1}^\infty a_n = \sum_{k=1}^\infty \frac{\csc^2 p_k}{p_k^3}
\end{equation}
diverges, then it would follow that $f(3)$ diverges, too.
Now
\begin{equation}\nonumber
\frac{\csc^2 p_k}{p_k^3} \gt \frac{1}{\pi^3q_k}\gt 0
\end{equation}
for all $k\ge 1$, and so it follows that if we can show that
\begin{equation}\label{denominator-series}
\sum_{k=1}^\infty\frac{1}{q_k}
\end{equation}
diverges then $f(3)$ would also diverge.
Unfortunately, it seems likely that \eqref{denominator-series} is comparable to a convergent geometric series.
See [Lévy's constant](https://mathworld.wolfram.com/LevyConstant.html).
Perhaps it is possible that $f(3)$ converges after all.