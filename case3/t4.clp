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
	(percept_pobj lane1)
	(percept_pname direction)
	(percept_pval ahead)
)

(ag_percept
	(percept_pobj lane2)
	(percept_pname direction)
	(percept_pval behind)
)

(ag_percept
    (percept_pobj sem1)
    (percept_pname isa)
    (percept_pval semafor)
)

(ag_percept
    (percept_pobj sem1)
    (percept_pname partof)
    (percept_pval ev1)
)

(ag_percept
    (percept_pobj sem1)
    (percept_pname direction)
    (percept_pval ahead)
)

(ag_percept
    (percept_pobj sem1)
    (percept_pname color)
    (percept_pval red)
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
	(percept_pval lane1)
)

(ag_percept
	(percept_pobj yourcar)
	(percept_pname intention)
	(percept_pval ahead)
)

(ag_percept
	(percept_pobj parking)
	(percept_pname partof)
	(percept_pval ev1)
)

(ag_percept
	(percept_pobj parking)
	(percept_pname direction)
	(percept_pval right)
)