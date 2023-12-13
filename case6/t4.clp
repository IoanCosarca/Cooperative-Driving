(ag_percept
	(percept_pobj ev1)
	(percept_pname isa)
	(percept_pval eveniment)
)

(ag_percept
	(percept_pobj road)
	(percept_pname partof)
	(percept_pval ev1)
)

(ag_percept
	(percept_pobj road)
	(percept_pname direction)
	(percept_pval ahead)
)

(ag_percept
	(percept_pobj lane1)
	(percept_pname partof)
	(percept_pval road)
)

(ag_percept
	(percept_pobj lane2)
	(percept_pname partof)
	(percept_pval road)
)

(ag_percept
	(percept_pobj yourcar)
	(percept_pname isa)
	(percept_pval car)
)

(ag_percept
	(percept_pobj yourcar)
	(percept_pname partof)
	(percept_pval ev1)
)

(ag_percept
	(percept_pobj yourcar)
	(percept_pname ison)
	(percept_pval lane2)
)

(ag_percept
    (percept_pobj roundabout)
	(percept_pname partof)
	(percept_pval ev1)
)

(ag_percept
    (percept_pobj exitright)
	(percept_pname partof)
	(percept_pval roundabout)
)

(ag_percept
    (percept_pobj exitahead)
	(percept_pname partof)
	(percept_pval roundabout)
)

(ag_percept
    (percept_pobj exitleft)
	(percept_pname partof)
	(percept_pval roundabout)
)

(ag_percept
    (percept_pobj exitbehind)
	(percept_pname partof)
	(percept_pval roundabout)
)

(ag_percept
	(percept_pobj yourcar)
	(percept_pname intention)
	(percept_pval exitahead)
)
