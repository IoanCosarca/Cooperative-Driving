(ag_percept
	(percept_pobj ev1)
	(percept_pname isa)
	(percept_pval eveniment)
)

(ag_percept
    (percept_pobj intersection)
    (percept_pname partof)
    (percept_pval ev1)
)

(ag_percept
	(percept_pobj road1)
	(percept_pname partof)
	(percept_pval intersection)
)

(ag_percept
	(percept_pobj road2)
	(percept_pname partof)
	(percept_pval intersection)
)

(ag_percept
    (percept_pobj road1)
    (percept_pname direction)
    (percept_pval ahead)
)

(ag_percept
    (percept_pobj road2)
    (percept_pname direction)
    (percept_pval right)
)

(ag_percept
    (percept_pobj road1)
    (percept_pname priority)
    (percept_pval high)
)

(ag_percept
    (percept_pobj road2)
    (percept_pname priority)
    (percept_pval low)
)

(ag_percept
    (percept_pobj crossing)
    (percept_pname partof)
    (percept_pval ev1)
)

(ag_percept
    (percept_pobj crossing)
    (percept_pname direction)
    (percept_pval ahead)
)

(ag_percept
	(percept_pobj yourcar)
	(percept_pname isa)
	(percept_pval car)
)

(ag_percept
	(percept_pobj secondcar)
	(percept_pname ias)
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
	(percept_pval road1)
)

(ag_percept
	(percept_pobj secondcar)
	(percept_pname ison)
	(percept_pval road2)
)

(ag_percept
	(percept_pobj yourcar)
	(percept_pname intention)
	(percept_pval ahead)
)

(ag_percept
	(percept_pobj secondcar)
	(percept_pname intention)
	(percept_pval right)
)

(ag_percept
	(percept_pobj crossing)
	(percept_pname state)
	(percept_pval empty)
)
