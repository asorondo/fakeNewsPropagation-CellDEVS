[top]
components : fakenewsgenerator@fakenewsgenerator mediaOfficial@media mediaOpposition@media populations


out : out_port
in : stop
link : stop stop@fakenewsgenerator
link : out@fakenewsgenerator in@mediaOfficial
link : out@fakenewsgenerator in@mediaOpposition

link : out@mediaOpposition in@populations
link : out@mediaOfficial in@populations
link : out@populations out_port


[fakenewsgenerator]
frequency : 00:15:00:00
dist: 0.2

[mediaOfficial]
party : 1

[mediaOpposition]
party : 0

[population]
type : cell
dim : (4,4)
delay : transport
defaultDelayTime  : 0
border : nowrapped
neighbors :                   population(-1,0) 
neighbors : population(0,-1)  population(0,0)  population(0,1)
neighbors :                   population(1,0)  
initialvalue : 0
initialCellsValue : Popul.val
in : in 
out: out_port
link : in in@populations(0,0)
link : in in@populations(0,1)
link : in in@populations(0,2)
link : in in@populations(0,3)
link : in in@populations(1,0)
link : in in@populations(1,1)
link : in in@populations(1,2)
link : in in@populations(1,3)
link : in in@populations(2,0)
link : in in@populations(2,1)
link : in in@populations(2,2)
link : in in@populations(2,3)
link : in in@populations(3,0)
link : in in@populations(3,1)
link : in in@populations(3,2)
link : in in@populations(3,3)

link : out@populations(0,0) out_port
link : out@populations(0,1) out_port
link : out@populations(0,2) out_port
link : out@populations(0,3) out_port
link : out@populations(1,0) out_port
link : out@populations(1,1) out_port
link : out@populations(1,2) out_port
link : out@populations(1,3) out_port
link : out@populations(2,0) out_port
link : out@populations(2,1) out_port
link : out@populations(2,2) out_port
link : out@populations(2,3) out_port
link : out@populations(3,0) out_port
link : out@populations(3,1) out_port
link : out@populations(3,2) out_port
link : out@populations(3,3) out_port

localtransition : Propagation
portInTransition : in@population(0,0) news

[news]
rule: {} {} {} 

[Propagation]
% Comportamiento de las poblaciones
rule : {[1,cuenta,cuenta,]} {0.1} {(0,0)!0=0 and (1,-1)!=? and 0<(1,-1)} VER EJEMPLO DE 2dheat_difusion para entradas! 

%mi vecino está emitiendo : cambio mi afinidad y creencia y me pongo en emitir
rule : {[(0,-1)!0,(0,-1)!1 , 1, #macro(belief) ,#macro(political_affinity),(0,0)!5,(0,0)!6,(0,0)!7],(0,0)!8,(0,0)!9} {0.2} {(0,-1)!0>(0,0)!0 and (0,-1)=1 and (0,0)!1=0} 
rule : {[(0,1)!0,(0,1)!1, 1,c,c,(0,0)!5,(0,0)!6,(0,0)!7,(0,0)!8,(0,0)!9]} {0.2} {(0,1)!0>(0,0)!0 and (0,1)=1 and (0,0)!1=0} 
rule : {[(1,0)!0,(1,0)!1, 1,c,c,(0,0)!5,(0,0)!6,(0,0)!7,(0,0)!8,(0,0)!9]} {0.2} {(1,0)!0>(0,0)!0 and (1,0)=1 and (0,0)!1=0} 
rule : {[(-1,0)!0,(-1,0)!1, 1,c,c,(0,0)!5,(0,0)!6,(0,0)!7,(0,0)!8,(0,0)!9]} {0.2} {(-1,0)!0>(0,0)!0 and (-1,0)=1 and (0,0)!1=0}

% passivate
rule : {[(-1,0)!0, 0, 0,(0,0)!3,(0,0)!4,(0,0)!5,(0,0)!6,(0,0)!7,(0,0)!8,(0,0)!9]} {0.2} {(-1,0)!0=(0,0)!0 and (1,0)!0=(0,0)!0 and (0,1)!0=(0,0)!0 and (0,-1)!0=(0,0)!0 and (0,0)!1=1}



rule : {(0,0)} 0 { t }


