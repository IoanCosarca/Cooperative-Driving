(ag_percept
	(percept_pobj ev1)
	(percept_pname isa)
	(percept_pval eveniment)
)

(ag_percept
	(percept_pobj lane1)
	(percept_pname isa)
	(percept_pval lane)
)

(ag_percept
	(percept_pobj lane2)
	(percept_pname isa)
	(percept_pval lane)
)

(ag_percept
	(percept_pobj lane1)
	(percept_pname partof)
	(percept_pval ev1)
)

(ag_percept
	(percept_pobj lane2)
	(percept_pname partof)
	(percept_pval ev1)
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
	(percept_pobj secondcar)
	(percept_pname isa)
	(percept_pval car)
)

(ag_percept
	(percept_pobj yourcar)
	(percept_pname partof)
	(percept_pval ev1)
)

(ag_percept
	(percept_pobj secondcar)
	(percept_pname partof)
	(percept_pval ev1)
)

(ag_percept
	(percept_pobj yourcar)
	(percept_pname ison)
	(percept_pval lane1)
)

(ag_percept
	(percept_pobj secondcar)
	(percept_pname ison)
	(percept_pval lane2)
)

(ag_percept
	(percept_pobj yourcar)
	(percept_pname intention)
	(percept_pval ahead)
)

(ag_percept
	(percept_pobj secondcar)
	(percept_pname intention)
	(percept_pval left)
)

(ag_percept
	(percept_pobj parking1)
	(percept_pname isa)
	(percept_pval parking)
)

(ag_percept
	(percept_pobj parking1)
	(percept_pname partof)
	(percept_pval ev1)
)

(ag_percept
	(percept_pobj parking1)
	(percept_pname direction)
	(percept_pval right)
)

(ag_percept
	(percept_pobj parking1)
	(percept_pname proximity)
	(percept_pval 1)
)

(ag_percept
	(percept_pobj secondcar)
	(percept_pname proximity)
	(percept_pval 1)
)

(ag_percept
	(percept_pobj sem1)
	(percept_pname proximity)
	(percept_pval 2)
)
