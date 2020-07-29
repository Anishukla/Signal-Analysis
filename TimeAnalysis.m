clear all
clc

pkg load symbolic
pkg load control

syms s

req = input("Enter 0 for open loop and 1 for closed loop: ")

Gnum = input("Enter numerator of open loop transfer system (i.e. numerator of G(s)): ")
if (Gnum == 1)
  Gnum = Gnum
  
else
  Gnum = sym2poly(Gnum)
  
endif


Gden = input("Enter denominator of open loop transfer system (i.e. denominator of G(s): ")
if (Gden == 1)
  Gden = Gden
  
else
  Gden = sym2poly(Gden)
  
endif


G = tf(Gnum, Gden)

if (req == 0)
  step(G)
  
else
  Hnum = input("Enter numerator of feedback system (i.e. numerator of H(s)): ")
  if (Hnum == 1)
    Hnum = Hnum
  
  else
    Hnum = sym2poly(Hnum)
  
  endif


  Hden = input("Enter denominator of feedback system (i.e. denominator of H(s): ")
  if (Hden == 1)
    Hden = Hden
  
  else
    Hden = sym2poly(Hden)
  
  endif

  H = tf(Hnum, Hden)

  A = input("Enter 1 if feedback is positive and 0 for negative: ")

  if (A == 1)
    T = feedback(G, H, +1)
  
  else
    T = feedback(G, H)
  
  endif

  step(T)
endif