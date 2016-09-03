## 99 Prolog Problems + Project Euler Answers in Erlang
Last night was Friday night, so here are some more advanced and flexible answers to some of the 99 Prolog Problems and Project Euler challenges. I noticed that most answers on the Internet used hardcoded numbers instead of input variables, which would be quite useless in the real programming world. Additionally, most Erlang answers online contain a huge amount of ifs, cases and other procedural-style expressions. So I figured it would be nice to share my more functional approach. Feel free to reach out.

Main differences with other answers that I've seen (aside from the fact that this is Erlang) are:
- Flatten function (#7 of 99 Prolog Problems) is entirely recursive.
- Packing of consecutive numbers (#9 of 99 Prolog Problems) is done entirely recursively.
- All Project Euler answers are actually functional in the sense that it works with input variables instead of hardcoded numbers.
- Finding the largest divisible prime number (#3 of Project Euler) is based on math instead of a brute force loop.
