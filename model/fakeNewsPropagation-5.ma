#include(rules_macrosf.inc)

[Top]
components :  fakenewsgenerator@fakenewsgenerator population
out : out_port
in : stop
link : stop stop@fakenewsgenerator
link: out@fakenewsgenerator in@population
link : out_port@population out_port


[fakenewsgenerator]
frequency : 00:15:00:000
dist: 0.6


[population]
type : cell
dim : (4,4)
delay : transport
defaultDelayTime  : 0
border : nowrapped
neighbors :                   population(-1,0) 
neighbors : population(0,-1)  population(0,0)  population(0,1)
neighbors :                   population(1,0)  
initialvalue : [0,0,0,0,0,0,0,0,0,0,0]
initialCellsValue : popul2.val
in : in 
out: out_port

link : in in@population(0,0)
link : in in@population(0,1)
link : in in@population(0,2)
link : in in@population(0,3)
link : in in@population(1,0)
link : in in@population(1,1)
link : in in@population(1,2)
link : in in@population(1,3)
link : in in@population(2,0)
link : in in@population(2,1)
link : in in@population(2,2)
link : in in@population(2,3)
link : in in@population(3,0)
link : in in@population(3,1)
link : in in@population(3,2)
link : in in@population(3,3)

link : out@population(0,0) out_port
link : out@population(0,1) out_port
link : out@population(0,2) out_port
link : out@population(0,3) out_port
link : out@population(1,0) out_port
link : out@population(1,1) out_port
link : out@population(1,2) out_port
link : out@population(1,3) out_port
link : out@population(2,0) out_port
link : out@population(2,1) out_port
link : out@population(2,2) out_port
link : out@population(2,3) out_port
link : out@population(3,0) out_port
link : out@population(3,1) out_port
link : out@population(3,2) out_port
link : out@population(3,3) out_port

localtransition : Propagation

portInTransition : in@population(1,1) news
portInTransition : in@population(1,2) news
portInTransition : in@population(1,3) news
portInTransition : in@population(1,0) news
portInTransition : in@population(2,1) news
portInTransition : in@population(2,2) news
portInTransition : in@population(2,3) news
portInTransition : in@population(2,0) news
portInTransition : in@population(0,0) news
portInTransition : in@population(0,1) news
portInTransition : in@population(0,2) news
portInTransition : in@population(0,3) news
portInTransition : in@population(3,1) news
portInTransition : in@population(3,2) news
portInTransition : in@population(3,3) news
portInTransition : in@population(3,0) news

[news]
rule: {[portValue(in)!0, portValue(in)!1, 1, #macro(media_belief),0,(0,0)!5,(0,0)!6,(0,0)!7,(0,0)!8,(0,0)!9,(0,0)!10]} 1 {portValue(in)!0 > (0,0)!0 and ((0,0)!4+ ((1+(-1)*portValue(in)!1) +(-1)* portValue(in)!1)* #macro(media_belief)*0.1)<0} 

rule: {[portValue(in)!0, portValue(in)!1, 1, #macro(media_belief),1,(0,0)!5,(0,0)!6,(0,0)!7,(0,0)!8,(0,0)!9,(0,0)!10]} 1 {portValue(in)!0 > (0,0)!0 and ((0,0)!4+ ((1+(-1)*portValue(in)!1) + (-1)*portValue(in)!1)* #macro(media_belief)*0.1)>1} 

rule: {[portValue(in)!0, portValue(in)!1, 1, #macro(media_belief),(0,0)!4+ ((1+(-1)*portValue(in)!1) + (-1)* portValue(in)!1)* #macro(media_belief)*0.1,(0,0)!5,(0,0)!6,(0,0)!7,(0,0)!8,(0,0)!9,(0,0)!10]} 1 { portValue(in)!0 > (0,0)!0 and ((0,0)!4+ ((1+(-1)*portValue(in)!1) +(-1)* portValue(in)!1)* #macro(media_belief)*0.1)>=0 and ((0,0)!4+ ((1+(-1)*portValue(in)!1) + (-1)* portValue(in)!1)* #macro(media_belief)*0.1) <=1 }

rule : {(0,0)} 0 {t}

[Propagation]

%[id fake,attacked_party, emitiendo, creencia, afinidad pol, edad, est univ, invol polit, est lab, nivel econ,pop_num]

% Comportamiento de las poblaciones

%mi vecino est?? emitiendo : cambio mi afinidad y creencia y me pongo en emitir
%vecino de arriba me emite fake
rule : {[(0,-1)!0,(0,-1)!1,1.0,abs((0,-1)!3*0.2+(#macro(shared_traits_proportion_arriba))*0.25+(1+(-1)*(abs((0,0)!4 +(-1)* (0,-1)!4)))*0.55),0,(0,0)!5,(0,0)!6,(0,0)!7,(0,0)!8,(0,0)!9,(0,0)!10]} 2 {((0,-1)!0) >((0,0)!0) and ((0,-1)!2)=1 and ((0,0)!2)=0 and (((0,0)!4)+(1+(-1)*(0,-1)!1 + (-1)* (0,-1)!1)*abs((0,-1)!3*0.2+(#macro(shared_traits_proportion_arriba))*0.25+(1+(-1)*(abs((0,0)!4 +(-1)* (0,-1)!4)))*0.55)*0.175) <0} 

rule : {[(0,-1)!0,(0,-1)!1,1.0,abs((0,-1)!3*0.2+(#macro(shared_traits_proportion_arriba))*0.25+(1+(-1)*(abs((0,0)!4 +(-1)* (0,-1)!4)))*0.55),1,(0,0)!5,(0,0)!6,(0,0)!7,(0,0)!8,(0,0)!9,(0,0)!10]} 2 {((0,-1)!0) >((0,0)!0) and ((0,-1)!2)=1 and ((0,0)!2)=0 and (((0,0)!4)+(1+(-1)*(0,-1)!1 + (-1)*(0,-1)!1)*abs((0,-1)!3*0.2+(#macro(shared_traits_proportion_arriba))*0.25+(1+(-1)*(abs((0,0)!4 +(-1)* (0,-1)!4)))*0.55)*0.175) >1}

rule : {[(0,-1)!0,(0,-1)!1,1.0,abs((0,-1)!3*0.2+(#macro(shared_traits_proportion_arriba))*0.25+(1+(-1)*(abs((0,0)!4 +(-1)* (0,-1)!4)))*0.55),(((0,0)!4)+(1+(-1)*(0,-1)!1 +(-1)* (0,-1)!1)*abs((0,-1)!3*0.2+(#macro(shared_traits_proportion_arriba))*0.25+(1+(-1)*(abs((0,0)!4 +(-1)* (0,-1)!4)))*0.55)*0.175),(0,0)!5,(0,0)!6,(0,0)!7,(0,0)!8,(0,0)!9,(0,0)!10]} 2 {((0,-1)!0) >((0,0)!0) and ((0,-1)!2)=1 and ((0,0)!2)=0 and (((0,0)!4)+(1+(-1)*(0,-1)!1 + (-1)*(0,-1)!1)*abs((0,-1)!3*0.2+(#macro(shared_traits_proportion_arriba))*0.25+(1+(-1)*(abs((0,0)!4 +(-1)* (0,-1)!4)))*0.55)*0.175)>=0 and (((0,0)!4)+(1+(-1)*(0,-1)!1 +(-1)* (0,-1)!1)*abs((0,-1)!3*0.2+(#macro(shared_traits_proportion_arriba))*0.25+(1+(-1)*(abs((0,0)!4 +(-1)* (0,-1)!4)))*0.55)*0.175)<=1} 

%vecino de abajo me emite fake
rule : {[(0,1)!0,(0,1)!1, 1,abs((0,1)!3*0.2+(#macro(shared_traits_proportion_abajo))*0.25+(1+(-1)*(abs((0,0)!4 +(-1)* (0,1)!4)))*0.55),0,(0,0)!5,(0,0)!6,(0,0)!7,(0,0)!8,(0,0)!9,(0,0)!10]} 2 {((0,1)!0) >((0,0)!0) and ((0,1)!2)=1 and ((0,0)!2)=0 and (((0,0)!4)+(1+(-1)*(0,1)!1 + (-1)*(0,1)!1)*abs((0,1)!3*0.2+(#macro(shared_traits_proportion_abajo))*0.25+(1+(-1)*(abs((0,0)!4 +(-1)* (0,1)!4)))*0.55)*0.175) <0} 

rule : {[(0,1)!0,(0,1)!1,1.0,abs((0,1)!3*0.2+(#macro(shared_traits_proportion_abajo))*0.25+(1+(-1)*(abs((0,0)!4 +(-1)* (0,1)!4)))*0.55),1,(0,0)!5,(0,0)!6,(0,0)!7,(0,0)!8,(0,0)!9,(0,0)!10]} 2 {((0,1)!0) >((0,0)!0) and ((0,1)!2)=1 and ((0,0)!2)=0 and (((0,0)!4)+(1+(-1)*(0,1)!1 + (-1)*(0,1)!1)*abs((0,1)!3*0.2+(#macro(shared_traits_proportion_abajo))*0.25+(1+(-1)*(abs((0,0)!4 +(-1)* (0,1)!4)))*0.55)*0.175) >1}

rule : {[(0,1)!0,(0,1)!1,1.0,abs((0,1)!3*0.2+(#macro(shared_traits_proportion_abajo))*0.25+(1+(-1)*(abs((0,0)!4 +(-1)* (0,1)!4)))*0.55),(((0,0)!4)+(1+(-1)*(0,1)!1 + (-1)*(0,1)!1)*abs((0,1)!3*0.2+(#macro(shared_traits_proportion_abajo))*0.25+(1+(-1)*(abs((0,0)!4 +(-1)* (0,1)!4)))*0.55)*0.175),(0,0)!5,(0,0)!6,(0,0)!7,(0,0)!8,(0,0)!9,(0,0)!10]} 2 {((0,1)!0) >((0,0)!0) and ((0,1)!2)=1 and ((0,0)!2)=0 and (((0,0)!4)+(1+(-1)*(0,1)!1 + (-1)*(0,1)!1)*abs((0,1)!3*0.2+(#macro(shared_traits_proportion_abajo))*0.25+(1+(-1)*(abs((0,0)!4 +(-1)* (0,1)!4)))*0.55)*0.175)>=0 and (((0,0)!4)+(1+(-1)*(0,1)!1 + (-1)*(0,1)!1)*abs((0,1)!3*0.2+(#macro(shared_traits_proportion_abajo))*0.25+(1+(-1)*(abs((0,0)!4 +(-1)* (0,1)!4)))*0.55)*0.175)<=1} 

%vecino de la derecha me emite fake
rule : {[(1,0)!0,(1,0)!1, 1,abs((1,0)!3*0.2+(#macro(shared_traits_proportion_der))*0.25+(1+(-1)*(abs((0,0)!4 +(-1)* (1,0)!4)))*0.55),0,(0,0)!5,(0,0)!6,(0,0)!7,(0,0)!8,(0,0)!9,(0,0)!10]} 2 {((1,0)!0) >((0,0)!0) and ((1,0)!2)=1 and ((0,0)!2)=0 and (((0,0)!4)+(1+(-1)*(1,0)!1 + (-1)*(1,0)!1)*abs((1,0)!3*0.2+(#macro(shared_traits_proportion_der))*0.25+(1+(-1)*(abs((0,0)!4 +(-1)* (1,0)!4)))*0.55)*0.175) <0} 

rule : {[(1,0)!0,(1,0)!1,1.0,abs((1,0)!3*0.2+(#macro(shared_traits_proportion_der))*0.25+(1+(-1)*(abs((0,0)!4 +(-1)* (1,0)!4)))*0.55),1,(0,0)!5,(0,0)!6,(0,0)!7,(0,0)!8,(0,0)!9,(0,0)!10]} 2 {((1,0)!0) >((0,0)!0) and ((1,0)!2)=1 and ((0,0)!2)=0 and (((0,0)!4)+(1+(-1)*(1,0)!1 + (-1)*(1,0)!1)*abs((1,0)!3*0.2+(#macro(shared_traits_proportion_der))*0.25+(1+(-1)*(abs((0,0)!4 +(-1)* (1,0)!4)))*0.55)*0.175) >1}

rule : {[(1,0)!0,(1,0)!1,1.0,abs((1,0)!3*0.2+(#macro(shared_traits_proportion_der))*0.25+(1+(-1)*(abs((0,0)!4 +(-1)* (1,0)!4)))*0.55),(((0,0)!4)+(1+(-1)*(1,0)!1 + (-1)*(1,0)!1)*abs((1,0)!3*0.2+(#macro(shared_traits_proportion_der))*0.25+(1+(-1)*(abs((0,0)!4 +(-1)* (1,0)!4)))*0.55)*0.175),(0,0)!5,(0,0)!6,(0,0)!7,(0,0)!8,(0,0)!9,(0,0)!10]} 2 {((1,0)!0) >((0,0)!0) and ((1,0)!2)=1 and ((0,0)!2)=0 and (((0,0)!4)+(1+(-1)*(1,0)!1 + (-1)*(1,0)!1)*abs((1,0)!3*0.2+(#macro(shared_traits_proportion_der))*0.25+(1+(-1)*(abs((0,0)!4 +(-1)* (1,0)!4)))*0.55)*0.175)>=0 and (((0,0)!4)+(1+(-1)*(1,0)!1 + (-1)*(1,0)!1)*abs((1,0)!3*0.2+(#macro(shared_traits_proportion_der))*0.25+(1+(-1)*(abs((0,0)!4 +(-1)* (1,0)!4)))*0.55)*0.175)<=1} 

%vecino de la izquierda me emite fake
rule : {[(-1,0)!0,(-1,0)!1, 1,abs((-1,0)!3*0.2+(#macro(shared_traits_proportion_izq))*0.25+(1+(-1)*(abs((0,0)!4 +(-1)* (-1,0)!4)))*0.55),0,(0,0)!5,(0,0)!6,(0,0)!7,(0,0)!8,(0,0)!9,(0,0)!10]} 2 {((-1,0)!0) >((0,0)!0) and ((-1,0)!2)=1 and ((0,0)!2)=0 and (((0,0)!4)+(1+(-1)*(-1,0)!1 +(-1)* (-1,0)!1)*abs((-1,0)!3*0.2+(#macro(shared_traits_proportion_izq))*0.25+(1+(-1)*(abs((0,0)!4 +(-1)* (-1,0)!4)))*0.55)*0.175) <0} 

rule : {[(-1,0)!0,(-1,0)!1,1.0,abs((-1,0)!3*0.2+(#macro(shared_traits_proportion_izq))*0.25+(1+(-1)*(abs((0,0)!4 +(-1)* (-1,0)!4)))*0.55),1,(0,0)!5,(0,0)!6,(0,0)!7,(0,0)!8,(0,0)!9,(0,0)!10]} 2 {((-1,0)!0) >((0,0)!0) and ((-1,0)!2)=1 and ((0,0)!2)=0 and (((0,0)!4)+(1+(-1)*(-1,0)!1 +(-1)* (-1,0)!1)*abs((-1,0)!3*0.2+(#macro(shared_traits_proportion_izq))*0.25+(1+(-1)*(abs((0,0)!4 +(-1)* (-1,0)!4)))*0.55)*0.175) >1}

rule : {[(-1,0)!0,(-1,0)!1,1.0,abs((-1,0)!3*0.2+(#macro(shared_traits_proportion_izq))*0.25+(1+(-1)*(abs((0,0)!4 +(-1)* (-1,0)!4)))*0.55),(((0,0)!4)+(1+(-1)*(-1,0)!1 +(-1)* (-1,0)!1)*abs((-1,0)!3*0.2+(#macro(shared_traits_proportion_izq))*0.25+(1+(-1)*(abs((0,0)!4 +(-1)* (-1,0)!4)))*0.55)*0.175),(0,0)!5,(0,0)!6,(0,0)!7,(0,0)!8,(0,0)!9,(0,0)!10]} 2 {((-1,0)!0) >((0,0)!0) and ((-1,0)!2)=1 and ((0,0)!2)=0 and (((0,0)!4)+(1+(-1)*(-1,0)!1 +(-1)* (-1,0)!1)*abs((-1,0)!3*0.2+(#macro(shared_traits_proportion_izq))*0.25+(1+(-1)*(abs((0,0)!4 +(-1)* (-1,0)!4)))*0.55)*0.175)>=0 and (((0,0)!4)+(1+(-1)*(-1,0)!1 +(-1)* (-1,0)!1)*abs((-1,0)!3*0.2+(#macro(shared_traits_proportion_izq))*0.25+(1+(-1)*(abs((0,0)!4 +(-1)* (-1,0)!4)))*0.55)*0.175)<=1} 



% passivate celdas centrales
rule : {[(0,0)!0, 0, 0, 0,(0,0)!4,(0,0)!5,(0,0)!6,(0,0)!7,(0,0)!8,(0,0)!9,(0,0)!10]} 10 {(-1,0)!0>=(0,0)!0 and (1,0)!0>=(0,0)!0 and (0,1)!0>=(0,0)!0 and (0,-1)!0>=(0,0)!0 and (0,0)!2=1}

% passivate celdas con 3 vecinos
rule : {[(0,0)!0, 0, 0, 0,(0,0)!4,(0,0)!5,(0,0)!6,(0,0)!7,(0,0)!8,(0,0)!9,(0,0)!10]} 8 {(-1,0)=? and (1,0)!0>=(0,0)!0 and (0,1)!0>=(0,0)!0 and (0,-1)!0>=(0,0)!0 and (0,0)!2=1}
rule : {[(0,0)!0, 0, 0, 0,(0,0)!4,(0,0)!5,(0,0)!6,(0,0)!7,(0,0)!8,(0,0)!9,(0,0)!10]} 8 {(1,0)=? and (-1,0)!0>=(0,0)!0 and (0,1)!0>=(0,0)!0 and (0,-1)!0>=(0,0)!0 and (0,0)!2=1}
rule : {[(0,0)!0, 0, 0, 0,(0,0)!4,(0,0)!5,(0,0)!6,(0,0)!7,(0,0)!8,(0,0)!9,(0,0)!10]} 8 {(0,1)=? and (1,0)!0>=(0,0)!0 and (-1,0)!0>=(0,0)!0 and (0,-1)!0>=(0,0)!0 and (0,0)!2=1}
rule : {[(0,0)!0, 0, 0, 0,(0,0)!4,(0,0)!5,(0,0)!6,(0,0)!7,(0,0)!8,(0,0)!9,(0,0)!10]} 8 {(0,-1)=? and (1,0)!0>=(0,0)!0 and (-1,0)!0>=(0,0)!0 and (0,1)!0>=(0,0)!0 and (0,0)!2=1}

% passivate celdas esquinas
rule : {[(0,0)!0, 0, 0, 0,(0,0)!4,(0,0)!5,(0,0)!6,(0,0)!7,(0,0)!8,(0,0)!9,(0,0)!10]} 8 {(-1,0)=? and (0,-1)=? and (0,1)!0>=(0,0)!0 and (1,0)!0>=(0,0)!0 and (0,0)!2=1}
rule : {[(0,0)!0, 0, 0, 0,(0,0)!4,(0,0)!5,(0,0)!6,(0,0)!7,(0,0)!8,(0,0)!9,(0,0)!10]} 8 {(1,0)=? and (0,-1)=? and (0,1)!0>=(0,0)!0 and (-1,0)!0>=(0,0)!0 and (0,0)!2=1}
rule : {[(0,0)!0, 0, 0, 0,(0,0)!4,(0,0)!5,(0,0)!6,(0,0)!7,(0,0)!8,(0,0)!9,(0,0)!10]} 8 {(1,0)=? and (0,1)= ? and (0,-1)!0>=(0,0)!0 and (-1,0)!0>=(0,0)!0 and (0,0)!2=1}
rule : {[(0,0)!0, 0, 0, 0,(0,0)!4,(0,0)!5,(0,0)!6,(0,0)!7,(0,0)!8,(0,0)!9,(0,0)!10]} 8 {(-1,0)=? and (0,1)=? and (0,-1)!0>=(0,0)!0 and (1,0)!0>=(0,0)!0 and (0,0)!2=1}


rule : {(0,0)} 0 { t }


