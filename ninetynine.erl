- module(ninetynine).
- export([last/1]).
- export([second_last/1]).
- export([nth_element/2]).
- export([list_length/1]).
- export([reverse_list/1]).
- export([is_palindrome/1]).
- export([flatten/1]).
- export([remove_duplicates/1]).
- export([pack/1]).

%% Get last element of list
last([_,H|T]) ->
  last([H|T]);
  
last([H|[]]) ->
  H.

%% Get second last element of a list
second_last([H, _|[]]) ->
  H;

second_last([_, H|T]) ->
  second_last([H|T]).

%% Get n'th element of list
nth_element(0, [H|_]) ->
  H;

nth_element(N, [_|T]) when N > 0 ->
  nth_element(N-1, T).

%% List Length
list_length(L) ->
  list_length(0, L).

list_length(C, []) ->
  C;

list_length(C, [_|T]) ->
  list_length(C+1, T).

%% Reverse list
reverse_list(L) ->
  reverse_list(L, []).

reverse_list([], Acc) ->
  Acc;

reverse_list([H|T], Acc) ->
  reverse_list(T, [H|Acc]).

%% Is palindrome: is reversed list equal to list?
is_palindrome(L) ->
  is_palindrome(L, reverse_list(L)).

is_palindrome(L, L)
  -> true;

is_palindrome(_, _)
  -> false.

%% Flatten list
flatten(X) ->
  flatten(X, []).

flatten([], L) ->
  L;

flatten([[]|T], L) ->
  flatten(T, L);

flatten([[_|_]=H|T], L) ->
  flatten(T, flatten(H, L));

flatten([H|T], L) ->
  flatten(T, L ++ [H]).

%% Remove consecutive duplicate list elements
remove_duplicates([]) ->
  [];

remove_duplicates([H|[]]) ->
  [H];

remove_duplicates([H, H|T]) ->
  remove_duplicates([H|T]);

remove_duplicates([F, H|T]) ->
  [F] ++ remove_duplicates([H|T]).

%% Pack consecutive duplicate list elements into separate sublists
pack([]) ->
  [];

pack([H|[]]) when is_list(H) ->
  [H];

pack([H|[]]) ->
  [[H]];

pack([H, H|T]) ->
  pack([[H,H]|T]);

pack([[H|T], H|R]) ->
  pack([[H|[H|T]]|R]);

pack([[H|T], R|S]) ->
  [[H|T]|pack([R|S])];

pack([H, R|T]) ->
  [[H]|pack([R|T])].
