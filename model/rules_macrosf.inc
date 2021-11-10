%[id fake,attacked_party, emitiendo, creencia, afinidad pol, edad, est univ, invol polit, est lab, nivel econ]

#BeginMacro(shared_traits_proportion)
 1 - (abs((0,-1)!4-(0,0)!4) + abs((0,-1)!5-(0,0)!5)+abs((0,-1)!6-(0,0)!6) + abs((0,-1)!7-(0,0)!7) +abs((0,-1)!8-(0,0)!8))/5 ;
#EndMacro

#BeginMacro(belief)
((0,-1)!2 * 0.225 + #macro(shared_traits_proportion)*0.225+ (1- abs( (0,0)!3- (0,-1)!3))*0.5)*0.55
#EndMacro

#BeginMacro(political_affinity)
(0,0)!4+ (-1*(1-(0,-1)!1) + 1*(0,-1)!1)* #macro(belief)*0.0175
#EndMacro

