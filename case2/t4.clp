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
	(percept_pobj accelerationlane)
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
	(percept_pobj accelerationlane)
	(percept_pname partof)
	(percept_pval ev1)
)

(ag_percept
	(percept_pobj lane1)
	(percept_pname number)
	(percept_pval one)
)

(ag_percept
	(percept_pobj lane2)
	(percept_pname number)
	(percept_pval two)
)

(ag_percept
	(percept_pobj lane1)
	(percept_pname state)
	(percept_pval empty)
)

(ag_percept
	(percept_pobj lane2)
	(percept_pname state)
	(percept_pval busy)
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
	(percept_pval lane2)
)

(ag_percept
	(percept_pobj secondcar)
	(percept_pname ison)
	(percept_pval accelerationlane)
)

(ag_percept
	(percept_pobj secondcar)
	(percept_pname proximity)
	(percept_pval 0)
)

(ag_percept
	(percept_pobj yourcar)
	(percept_pname intention)
	(percept_pval right)
)

(ag_percept
	(percept_pobj secondcar)
	(percept_pname intention)
	(percept_pval left)
)
