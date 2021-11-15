[top]
components : fakenewsgenerator@fakenewsgenerator population
out : out_port
in : stop
link : stop stop@fakenewsgenerator
link : out@population out_port
link: out@fakenewsgenerator in@population


[fakenewsgenerator]
frequency : 00:15:00:00
dist: 0.2

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
%modificar los links de in
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
portInTransition : in@population(0,0) news

[news]
rule: {[portValue(in)!0, portValue(in)!1, 1, #macro(media_belief), #macro(media_political_affinity),(0,0)!5,(0,0)!6,(0,0)!7,(0,0)!8,(0,0)!9]} {0} {portValue(in)!0 > (0,0)!0} 

[Propagation]
% Comportamiento de las poblaciones
rule : {[1,cuenta,cuenta,]} {0.1} {(0,0)!0=0 and (1,-1)!=? and 0<(1,-1)} VER EJEMPLO DE 2dheat_difusion para entradas! 

%mi vecino está emitiendo : cambio mi afinidad y creencia y me pongo en emitir
rule : {[(0,-1)!0,(0,-1)!1 , 1, #macro(belief_arriba) ,#macro(political_affinity_arriba),(0,0)!5,(0,0)!6,(0,0)!7,(0,0)!8,(0,0)!9]} {0.2} {(0,-1)!0>(0,0)!0 and (0,-1)=1 and (0,0)!1=0} 
rule : {[(0,1)!0,(0,1)!1, 1,#macro(belief_abajo) ,#macro(political_affinity_abajo),(0,0)!5,(0,0)!6,(0,0)!7,(0,0)!8,(0,0)!9]} {0.3} {(0,1)!0>(0,0)!0 and (0,1)=1 and (0,0)!1=0} 
rule : {[(1,0)!0,(1,0)!1, 1,#macro(belief_der) ,#macro(political_affinity_der),(0,0)!5,(0,0)!6,(0,0)!7,(0,0)!8,(0,0)!9]} {0.4} {(1,0)!0>(0,0)!0 and (1,0)=1 and (0,0)!1=0} 
rule : {[(-1,0)!0,(-1,0)!1, 1,#macro(belief_izq) ,#macro(political_affinity_izq),(0,0)!5,(0,0)!6,(0,0)!7,(0,0)!8,(0,0)!9]} {0.5} {(-1,0)!0>(0,0)!0 and (-1,0)=1 and (0,0)!1=0}

% passivate
rule : {[(-1,0)!0, 0, 0,(0,0)!3,(0,0)!4,(0,0)!5,(0,0)!6,(0,0)!7,(0,0)!8,(0,0)!9]} {0.2} {(-1,0)!0=(0,0)!0 and (1,0)!0=(0,0)!0 and (0,1)!0=(0,0)!0 and (0,-1)!0=(0,0)!0 and (0,0)!1=1}

rule : {(0,0)} 0 { t }


