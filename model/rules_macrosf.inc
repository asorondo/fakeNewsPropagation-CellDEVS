%[id fake,attacked_party, emitiendo, creencia, afinidad pol, edad, est univ, invol polit, est lab, nivel econ]

%%%%%%%%%%%%%%%%%%%%%%%%%% creencia a la fake de vecinos %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

#BeginMacro(shared_traits_proportion_arriba)
 1 - (abs((0,-1)!4-(0,0)!4) + abs((0,-1)!5-(0,0)!5)+abs((0,-1)!6-(0,0)!6) + abs((0,-1)!7-(0,0)!7) +abs((0,-1)!8-(0,0)!8))/5
#EndMacro

#BeginMacro(belief_arriba)
((0,-1)!2 * 0.225 + #macro(shared_traits_proportion_arriba)*0.225+ (1- abs( (0,0)!3- (0,-1)!3))*0.5)*0.55
#EndMacro

#BeginMacro(political_affinity_arriba)
(0,0)!4+ (-1*(1-(0,-1)!1) + 1*(0,-1)!1)* #macro(belief_arriba)*0.0175
#EndMacro



#BeginMacro(shared_traits_proportion_abajo)
 1 - (abs((0,1)!4-(0,0)!4) + abs((0,1)!5-(0,0)!5)+abs((0,1)!6-(0,0)!6) + abs((0,1)!7-(0,0)!7) +abs((0,1)!8-(0,0)!8))/5
#EndMacro

#BeginMacro(belief_abajo)
((0,1)!2 * 0.225 + #macro(shared_traits_proportion_abajo)*0.225+ (1- abs( (0,0)!3- (0,1)!3))*0.5)*0.55
#EndMacro

#BeginMacro(political_affinity_abajo)
(0,0)!4+ (-1*(1-(0,1)!1) + 1*(0,1)!1)* #macro(belief_abajo)*0.0175
#EndMacro



#BeginMacro(shared_traits_proportion_izq)
 1 - (abs((-1,0)!4-(0,0)!4) + abs((-1,0)!5-(0,0)!5)+abs((-1,0)!6-(0,0)!6) + abs((-1,0)!7-(0,0)!7) +abs((-1,0)!8-(0,0)!8))/5
#EndMacro

#BeginMacro(belief_izq)
((-1,0)!2 * 0.225 + #macro(shared_traits_proportion_izq)*0.225+ (1- abs( (0,0)!3- (-1,0)!3))*0.5)*0.55
#EndMacro

#BeginMacro(political_affinity_izq)
(0,0)!4+ (-1*(1-(-1,0)!1) + 1*(-1,0)!1)* #macro(belief_izq)*0.0175
#EndMacro



#BeginMacro(shared_traits_proportion_der)
 1 - (abs((1,0)!4-(0,0)!4) + abs((1,0)!5-(0,0)!5)+abs((1,0)!6-(0,0)!6) + abs((1,0)!7-(0,0)!7) +abs((1,0)!8-(0,0)!8))/5
#EndMacro

#BeginMacro(belief_der)
((1,0)!2 * 0.225 + #macro(shared_traits_proportion_der)*0.225+ (1- abs( (0,0)!3- (1,0)!3))*0.5)*0.55
#EndMacro

#BeginMacro(political_affinity_der)
(0,0)!4+ (-1*(1-(1,0)!1) + 1*(1,0)!1)* #macro(belief_der)*0.0175
#EndMacro


%%%%%%%%%%%%%%%%%%%%%%%%%% creencia a la fake del genrador %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

#BeginMacro(media_belief)
(abs((0,0)!4 - portValue(in)!1))*0.35 + (1 - (0,0)!6)*0.125 + (1 - abs((0,0)!9 - 0.5))*0.125 + (1 - (0,0)!8)*0.125 + (1 - (0,0)!7)*0.125 
+ portValue(in)!2*0.1 + portValue(in)!3*0.05 
#EndMacro

#BeginMacro(media_political_affinity)
(0,0)!4+ (-1*(1-portValue(in)!1) + 1*portValue(in)!1)* #macro(media_belief)*0.0175
#EndMacro




