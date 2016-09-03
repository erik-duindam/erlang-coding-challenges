- module(euler).
- export([p01/2]).
- export([p01_static/1]).
- export([p02/1]).
- export([p03/1]).

%% Euler exercise 1: get the sum of all natural numbers 0 < N < 1000 that are a multiple of any of Numbers [A, B, ..]
%%
%% Example:
%% 1> euler:p01(1000, [3,5]).
%% 233168
p01(Limit, Numbers) ->
  p01_sum(Limit-1, Numbers, 0).

p01_sum(0, _, Acc) ->
  Acc;
p01_sum(Limit, List, Acc) ->
  p01_sum(Limit-1, List, Acc + p01_sum(Limit, List)).

p01_sum(0, _) ->
  0;
p01_sum(Limit, [H|T]) ->
  p01_and(p01_sum(Limit, H), p01_sum(Limit, T));
p01_sum(Limit, I) when Limit rem I =:= 0 ->
  Limit;
p01_sum(_, _) ->
  0.

p01_and(A, A) ->
  A;
p01_and(A, B) when A > B ->
  A;
p01_and(A, B) when B > A ->
  B;
p01_and(A, _) ->
  A.

p01_static(N) ->
  lists:sum([X || X <- lists:seq(1, N-1), (X rem 3 =:= 0) or (X rem 5 =:= 0)]).

%% Euler exercise 2: Get the sum of all even fibonacci numbers <= Max
%%
%% Example:
%% 1> euler:p02(4000000).
%% 4613732
p02(Max) ->
  p02(0, 0, 0, Max).
p02(_, Val, Sum, Max) when Val > Max ->
  Sum;
p02(N, Val, Sum, Max) when Val rem 2 =:= 0 ->
  p02(N+1, fib(N), Sum+Val, Max);
p02(N, _, Sum, Max) ->
  p02(N+1, fib(N), Sum, Max).

fib(0) ->
  0;
fib(1) ->
  1;
fib(N) ->
  fib(N-1) + fib(N-2).

%% Euler exercise 3: What's the largest prime you can divide Number by?
%%
%% Example:
%% 1> euler:p03(600851475143).
%% 6857
p03(Num) ->
  p03(Num, 2, 0).
p03(Num, Num, _) ->
  Num;
p03(Num, Div, Acc) when Num rem Div =:= 0, Div >= Acc ->
  p03(Num div Div, 2, Div);
p03(Num, Div, Acc) ->
  p03(Num, Div + 1, Acc).
