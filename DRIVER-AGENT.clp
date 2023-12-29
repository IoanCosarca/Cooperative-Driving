;
;-------Auxiliary facts ---------------------------------------
;

(defrule AGENT::initCycle-stop-car-immediately
    (declare (salience 89))
    (timp (valoare ?)) ;make sure it fires each cycle
=>
    (if (eq ?*ag-in-debug* TRUE) then (printout t "    <D>initCycle-stop-car-immediately prohibited by default " crlf))
    (assert (ag_bel (bel_type moment) (bel_pname stop-car-immediately-maneuver) (bel_pval prohibited))) ;by default, we assume stop car immediately NOT valid
    ;(facts AGENT)
)

(defrule AGENT::initCycle-keep-going
    (declare (salience 89))
    (timp (valoare ?)) ;make sure it fires each cycle
=>
    (if (eq ?*ag-in-debug* TRUE) then (printout t "    <D>initCycle-keep-going prohibited by default " crlf))
    (assert (ag_bel (bel_type moment) (bel_pname keep-going-maneuver) (bel_pval prohibited))) ;by default, we assume keep going NOT valid
    ;(facts AGENT)
)

(defrule AGENT::initCycle-go-further-before-stopping
    (declare (salience 89))
    (timp (valoare ?)) ;make sure it fires each cycle
=>
    (if (eq ?*ag-in-debug* TRUE) then (printout t "    <D>initCycle-go-further-before-stopping prohibited by default " crlf))
    (assert (ag_bel (bel_type moment) (bel_pname go-further-before-stopping-maneuver) (bel_pval prohibited))) ;by default, we assume go further before stopping NOT valid
    ;(facts AGENT)
)

(defrule AGENT::initCycle-change-lane
    (declare (salience 89))
    (timp (valoare ?)) ;make sure it fires each cycle
=>
    (if (eq ?*ag-in-debug* TRUE) then (printout t "    <D>initCycle-change-lane prohibited by default " crlf))
    (assert (ag_bel (bel_type moment) (bel_pname change-lane-maneuver) (bel_pval prohibited))) ;by default, we assume change lane NOT valid
    ;(facts AGENT)
)

(defrule AGENT::initCycle-reduce-speed
    (declare (salience 89))
    (timp (valoare ?)) ;make sure it fires each cycle
=>
    (if (eq ?*ag-in-debug* TRUE) then (printout t "    <D>initCycle-reduce-speed prohibited by default " crlf))
    (assert (ag_bel (bel_type moment) (bel_pname reduce-speed-maneuver) (bel_pval prohibited))) ;by default, we assume reduce speed NOT valid
    ;(facts AGENT)
)

(defrule AGENT::initCycle-allow-first-car-through
    (declare (salience 89))
    (timp (valoare ?)) ;make sure it fires each cycle
=>
    (if (eq ?*ag-in-debug* TRUE) then (printout t "    <D>initCycle-allow-first-car-through prohibited by default " crlf))
    (assert (ag_bel (bel_type moment) (bel_pname allow-first-car-through-maneuver) (bel_pval prohibited))) ;by default, we assume allow first car through NOT valid
    ;(facts AGENT)
)

(defrule AGENT::initCycle-pull-right
    (declare (salience 89))
    (timp (valoare ?)) ;make sure it fires each cycle
=>
    (if (eq ?*ag-in-debug* TRUE) then (printout t "    <D>initCycle-pull-right prohibited by default " crlf))
    (assert (ag_bel (bel_type moment) (bel_pname pull-right-maneuver) (bel_pval prohibited))) ;by default, we assume pull right NOT valid
    ;(facts AGENT)
)

;;----------------------------------
;;
;;    Case 1: Intersectie cu un drum neprioritar, o masina vine de pe acel drum si trecere de pietoni in fata, dupa intersectie
;;
;;----------------------------------

;--- Test 1: A doua masina vrea sa faca stanga, iar trecerea este ocupata
(defrule AGENT::rsclcb
    (timp (valoare ?t))
    ?f <- (ag_bel (bel_type moment) (bel_pname stop-car-immediately-maneuver) (bel_pval prohibited))
    (ag_bel (bel_type moment) (bel_pobj ?inter) (bel_pname isa) (bel_pval intersection))
    (ag_bel (bel_type moment) (bel_pobj ?road1) (bel_pname partof) (bel_pval ?inter))
    (ag_bel (bel_type moment) (bel_pobj ?road2) (bel_pname partof) (bel_pval ?inter))
    (ag_bel (bel_type moment) (bel_pobj ?crossing1) (bel_pname isa) (bel_pval crossing))
    (ag_bel (bel_type moment) (bel_pobj ?yourcar) (bel_pname isa) (bel_pval car))
    (ag_bel (bel_type moment) (bel_pobj ?secondcar) (bel_pname isa) (bel_pval car))
    (ag_bel (bel_type moment) (bel_pobj ?yourcar) (bel_pname intention) (bel_pval ahead))
    (ag_bel (bel_type moment) (bel_pobj ?secondcar) (bel_pname intention) (bel_pval left))
    (ag_bel (bel_type moment) (bel_pobj ?crossing1) (bel_pname state) (bel_pval busy))
    (ag_bel (bel_type moment) (bel_pobj ?secondcar) (bel_pname proximity) (bel_pval 1))
    (ag_bel (bel_type moment) (bel_pobj ?crossing1) (bel_pname proximity) (bel_pval 2))
=>
    (if (eq ?*ag-in-debug* TRUE) then (printout t "    <D>rsclcb vad a doua masina vrea " left " si trecerea " busy crlf))
    (retract ?f)
    (assert (ag_bel (bel_type moment) (bel_pname stop-car-immediately-maneuver) (bel_pval allowed)))
)

;--- Test 2: A doua masina vrea sa faca stanga, iar trecerea este libera
(defrule AGENT::rsclce
    (timp (valoare ?t))
    ?f <- (ag_bel (bel_type moment) (bel_pname keep-going-maneuver) (bel_pval prohibited))
    (ag_bel (bel_type moment) (bel_pobj ?inter) (bel_pname isa) (bel_pval intersection))
    (ag_bel (bel_type moment) (bel_pobj ?road1) (bel_pname partof) (bel_pval ?inter))
    (ag_bel (bel_type moment) (bel_pobj ?road2) (bel_pname partof) (bel_pval ?inter))
    (ag_bel (bel_type moment) (bel_pobj ?crossing1) (bel_pname isa) (bel_pval crossing))
    (ag_bel (bel_type moment) (bel_pobj ?yourcar) (bel_pname isa) (bel_pval car))
    (ag_bel (bel_type moment) (bel_pobj ?secondcar) (bel_pname isa) (bel_pval car))
    (ag_bel (bel_type moment) (bel_pobj ?yourcar) (bel_pname intention) (bel_pval ahead))
    (ag_bel (bel_type moment) (bel_pobj ?secondcar) (bel_pname intention) (bel_pval left))
    (ag_bel (bel_type moment) (bel_pobj ?crossing1) (bel_pname state) (bel_pval empty))
    (ag_bel (bel_type moment) (bel_pobj ?secondcar) (bel_pname proximity) (bel_pval 1))
    (ag_bel (bel_type moment) (bel_pobj ?crossing1) (bel_pname proximity) (bel_pval 2))
=>
    (if (eq ?*ag-in-debug* TRUE) then (printout t "    <D>rsclce vad a doua masina vrea " left " si trecerea " empty crlf))
    (retract ?f)
    (assert (ag_bel (bel_type moment) (bel_pname keep-going-maneuver) (bel_pval allowed)))
)

;--- Test 3: A doua masina vrea sa faca dreapta, iar trecerea este ocupata
(defrule AGENT::rscrcb
    (timp (valoare ?t))
    ?f <- (ag_bel (bel_type moment) (bel_pname stop-car-immediately-maneuver) (bel_pval prohibited))
    (ag_bel (bel_type moment) (bel_pobj ?inter) (bel_pname isa) (bel_pval intersection))
    (ag_bel (bel_type moment) (bel_pobj ?road1) (bel_pname partof) (bel_pval ?inter))
    (ag_bel (bel_type moment) (bel_pobj ?road2) (bel_pname partof) (bel_pval ?inter))
    (ag_bel (bel_type moment) (bel_pobj ?crossing1) (bel_pname isa) (bel_pval crossing))
    (ag_bel (bel_type moment) (bel_pobj ?yourcar) (bel_pname isa) (bel_pval car))
    (ag_bel (bel_type moment) (bel_pobj ?secondcar) (bel_pname isa) (bel_pval car))
    (ag_bel (bel_type moment) (bel_pobj ?yourcar) (bel_pname intention) (bel_pval ahead))
    (ag_bel (bel_type moment) (bel_pobj ?secondcar) (bel_pname intention) (bel_pval right))
    (ag_bel (bel_type moment) (bel_pobj ?crossing1) (bel_pname state) (bel_pval busy))
    (ag_bel (bel_type moment) (bel_pobj ?secondcar) (bel_pname proximity) (bel_pval 1))
    (ag_bel (bel_type moment) (bel_pobj ?crossing1) (bel_pname proximity) (bel_pval 2))
=>
    (if (eq ?*ag-in-debug* TRUE) then (printout t "    <D>rscrcb vad a doua masina vrea " right " si trecerea " busy crlf))
    (retract ?f)
    (assert (ag_bel (bel_type moment) (bel_pname stop-car-immediately-maneuver) (bel_pval allowed)))
)

;--- Test 4: A doua masina vrea sa faca dreapta, iar trecerea este libera
(defrule AGENT::rscrce
    (timp (valoare ?t))
    ?f <- (ag_bel (bel_type moment) (bel_pname stop-car-immediately-maneuver) (bel_pval prohibited))
    (ag_bel (bel_type moment) (bel_pobj ?inter) (bel_pname isa) (bel_pval intersection))
    (ag_bel (bel_type moment) (bel_pobj ?road1) (bel_pname partof) (bel_pval ?inter))
    (ag_bel (bel_type moment) (bel_pobj ?road2) (bel_pname partof) (bel_pval ?inter))
    (ag_bel (bel_type moment) (bel_pobj ?crossing1) (bel_pname isa) (bel_pval crossing))
    (ag_bel (bel_type moment) (bel_pobj ?yourcar) (bel_pname isa) (bel_pval car))
    (ag_bel (bel_type moment) (bel_pobj ?secondcar) (bel_pname isa) (bel_pval car))
    (ag_bel (bel_type moment) (bel_pobj ?yourcar) (bel_pname intention) (bel_pval ahead))
    (ag_bel (bel_type moment) (bel_pobj ?secondcar) (bel_pname intention) (bel_pval right))
    (ag_bel (bel_type moment) (bel_pobj ?crossing1) (bel_pname state) (bel_pval empty))
    (ag_bel (bel_type moment) (bel_pobj ?secondcar) (bel_pname proximity) (bel_pval 1))
    (ag_bel (bel_type moment) (bel_pobj ?crossing1) (bel_pname proximity) (bel_pval 2))
=>
    (if (eq ?*ag-in-debug* TRUE) then (printout t "    <D>rscrce vad a doua masina vrea " right " si trecerea " empty crlf))
    (retract ?f)
    (assert (ag_bel (bel_type moment) (bel_pname stop-car-immediately-maneuver) (bel_pval allowed)))
)

;--- Test 5: Nu exista a doua masina, iar trecerea este ocupata
(defrule AGENT::rnsccb
    (timp (valoare ?t))
    ?f <- (ag_bel (bel_type moment) (bel_pname go-further-before-stopping-maneuver) (bel_pval prohibited))
    (ag_bel (bel_type moment) (bel_pobj ?inter) (bel_pname isa) (bel_pval intersection))
    (ag_bel (bel_type moment) (bel_pobj ?road1) (bel_pname partof) (bel_pval ?inter))
    (ag_bel (bel_type moment) (bel_pobj ?road2) (bel_pname partof) (bel_pval ?inter))
    (ag_bel (bel_type moment) (bel_pobj ?crossing1) (bel_pname isa) (bel_pval crossing))
    (ag_bel (bel_type moment) (bel_pobj ?yourcar) (bel_pname isa) (bel_pval car))
    (ag_bel (bel_type moment) (bel_pobj ?yourcar) (bel_pname intention) (bel_pval ahead))
    (ag_bel (bel_type moment) (bel_pobj ?crossing1) (bel_pname state) (bel_pval busy))
    (ag_bel (bel_type moment) (bel_pobj ?crossing1) (bel_pname proximity) (bel_pval 2))
=>
    (if (eq ?*ag-in-debug* TRUE) then (printout t "    <D>rnsccb vad trecerea " busy crlf))
    (retract ?f)
    (assert (ag_bel (bel_type moment) (bel_pname go-further-before-stopping-maneuver) (bel_pval allowed)))
)

;--- Test 6: Nu exista a doua masina, iar trecerea este libera
(defrule AGENT::rsclce
    (timp (valoare ?t))
    ?f <- (ag_bel (bel_type moment) (bel_pname keep-going-maneuver) (bel_pval prohibited))
    (ag_bel (bel_type moment) (bel_pobj ?inter) (bel_pname isa) (bel_pval intersection))
    (ag_bel (bel_type moment) (bel_pobj ?road1) (bel_pname partof) (bel_pval ?inter))
    (ag_bel (bel_type moment) (bel_pobj ?road2) (bel_pname partof) (bel_pval ?inter))
    (ag_bel (bel_type moment) (bel_pobj ?crossing1) (bel_pname isa) (bel_pval crossing))
    (ag_bel (bel_type moment) (bel_pobj ?yourcar) (bel_pname isa) (bel_pval car))
    (ag_bel (bel_type moment) (bel_pobj ?yourcar) (bel_pname intention) (bel_pval ahead))
    (ag_bel (bel_type moment) (bel_pobj ?crossing1) (bel_pname state) (bel_pval empty))
    (ag_bel (bel_type moment) (bel_pobj ?crossing1) (bel_pname proximity) (bel_pval 2))
=>
    (if (eq ?*ag-in-debug* TRUE) then (printout t "    <D>rnsccb vad trecerea " empty crlf))
    (retract ?f)
    (assert (ag_bel (bel_type moment) (bel_pname keep-going-maneuver) (bel_pval allowed)))
)

;;----------------------------------
;;
;;    Case 2: Schimbare banda pe autostrada pentru a permite intrarea unei masini de pe banda de accelerare
;;
;;----------------------------------

;--- Test 1: Sunt doar doua masini pe autostrada, masina ta e pe banda 1, cealalta e paralela cu a ta
(defrule AGENT::rcciscn
    (timp (valoare ?t))
    ?f <- (ag_bel (bel_type moment) (bel_pname change-lane-maneuver) (bel_pval prohibited))
    (ag_bel (bel_type moment) (bel_pobj ?lane1) (bel_pname isa) (bel_pval lane))
    (ag_bel (bel_type moment) (bel_pobj ?lane2) (bel_pname isa) (bel_pval lane))
    (ag_bel (bel_type moment) (bel_pobj ?accelerationlane) (bel_pname isa) (bel_pval lane))
    (ag_bel (bel_type moment) (bel_pobj ?yourcar) (bel_pname isa) (bel_pval car))
    (ag_bel (bel_type moment) (bel_pobj ?secondcar) (bel_pname isa) (bel_pval car))
    (ag_bel (bel_type moment) (bel_pobj ?yourcar) (bel_pname ison) (bel_pval ?lane1))
    (ag_bel (bel_type moment) (bel_pobj ?secondcar) (bel_pname ison) (bel_pval ?accelerationlane))
    (ag_bel (bel_type moment) (bel_pobj ?secondcar) (bel_pname proximity) (bel_pval 0))
=>
    (if (eq ?*ag-in-debug* TRUE) then (printout t "    <D>rcciscn sunt pe " ?lane1 " si vad a doua masina aproape" crlf))
    (retract ?f)
    (assert (ag_bel (bel_type moment) (bel_pname change-lane-maneuver) (bel_pval allowed)))
)

;--- Test 2: Sunt doar doua masini pe autostrada, masina ta e pe banda 1, cealalta e mai in spate
(defrule AGENT::rcciscf
    (timp (valoare ?t))
    ?f <- (ag_bel (bel_type moment) (bel_pname keep-going-maneuver) (bel_pval prohibited))
    (ag_bel (bel_type moment) (bel_pobj ?lane1) (bel_pname isa) (bel_pval lane))
    (ag_bel (bel_type moment) (bel_pobj ?lane2) (bel_pname isa) (bel_pval lane))
    (ag_bel (bel_type moment) (bel_pobj ?accelerationlane) (bel_pname isa) (bel_pval lane))
    (ag_bel (bel_type moment) (bel_pobj ?yourcar) (bel_pname isa) (bel_pval car))
    (ag_bel (bel_type moment) (bel_pobj ?secondcar) (bel_pname isa) (bel_pval car))
    (ag_bel (bel_type moment) (bel_pobj ?yourcar) (bel_pname ison) (bel_pval ?lane1))
    (ag_bel (bel_type moment) (bel_pobj ?secondcar) (bel_pname ison) (bel_pval ?accelerationlane))
    (ag_bel (bel_type moment) (bel_pobj ?secondcar) (bel_pname proximity) (bel_pval 1))
=>
    (if (eq ?*ag-in-debug* TRUE) then (printout t "    <D>rcciscf sunt pe " ?lane1 " si vad a doua masina departe" crlf))
    (retract ?f)
    (assert (ag_bel (bel_type moment) (bel_pname keep-going-maneuver) (bel_pval allowed)))
)

;--- Test 3: Sunt trei masini pe autostrada, masina ta e pe banda 1, celelalte merg in paralel cu a ta
(defrule AGENT::rccci
    (timp (valoare ?t))
    ?f <- (ag_bel (bel_type moment) (bel_pname keep-going-maneuver) (bel_pval prohibited))
    (ag_bel (bel_type moment) (bel_pobj ?lane1) (bel_pname isa) (bel_pval lane))
    (ag_bel (bel_type moment) (bel_pobj ?lane2) (bel_pname isa) (bel_pval lane))
    (ag_bel (bel_type moment) (bel_pobj ?accelerationlane) (bel_pname isa) (bel_pval lane))
    (ag_bel (bel_type moment) (bel_pobj ?yourcar) (bel_pname isa) (bel_pval car))
    (ag_bel (bel_type moment) (bel_pobj ?secondcar) (bel_pname isa) (bel_pval car))
    (ag_bel (bel_type moment) (bel_pobj ?thirdcar) (bel_pname isa) (bel_pval car))
    (ag_bel (bel_type moment) (bel_pobj ?yourcar) (bel_pname ison) (bel_pval ?lane1))
    (ag_bel (bel_type moment) (bel_pobj ?secondcar) (bel_pname ison) (bel_pval ?accelerationlane))
    (ag_bel (bel_type moment) (bel_pobj ?secondcar) (bel_pname ison) (bel_pval ?lane2))
    (ag_bel (bel_type moment) (bel_pobj ?secondcar) (bel_pname proximity) (bel_pval 0))
    (ag_bel (bel_type moment) (bel_pobj ?thirdcar) (bel_pname proximity) (bel_pval 0))
=>
    (if (eq ?*ag-in-debug* TRUE) then (printout t "    <D>rccci sunt pe " ?lane1 " si vad doua masini" crlf))
    (retract ?f)
    (assert (ag_bel (bel_type moment) (bel_pname keep-going-maneuver) (bel_pval allowed)))
)

;--- Test 4: Sunt doar doua masini pe autostrada, masina ta e pe banda 2, cealalta e paralela cu a ta
(defrule AGENT::rcciiscn
    (timp (valoare ?t))
    ?f <- (ag_bel (bel_type moment) (bel_pname keep-going-maneuver) (bel_pval prohibited))
    (ag_bel (bel_type moment) (bel_pobj ?lane1) (bel_pname isa) (bel_pval lane))
    (ag_bel (bel_type moment) (bel_pobj ?lane2) (bel_pname isa) (bel_pval lane))
    (ag_bel (bel_type moment) (bel_pobj ?accelerationlane) (bel_pname isa) (bel_pval lane))
    (ag_bel (bel_type moment) (bel_pobj ?yourcar) (bel_pname isa) (bel_pval car))
    (ag_bel (bel_type moment) (bel_pobj ?secondcar) (bel_pname isa) (bel_pval car))
    (ag_bel (bel_type moment) (bel_pobj ?yourcar) (bel_pname ison) (bel_pval ?lane2))
    (ag_bel (bel_type moment) (bel_pobj ?secondcar) (bel_pname ison) (bel_pval ?accelerationlane))
    (ag_bel (bel_type moment) (bel_pobj ?secondcar) (bel_pname proximity) (bel_pval 0))
=>
    (if (eq ?*ag-in-debug* TRUE) then (printout t "    <D>rcciiscn sunt pe " ?lane2 " si vad a doua masina aproape" crlf))
    (retract ?f)
    (assert (ag_bel (bel_type moment) (bel_pname keep-going-maneuver) (bel_pval allowed)))
)

;;----------------------------------
;;
;;    Case 3: Avem in fata semafor rosu si de pe banda opusa vine o masina care doreste sa ocupe un loc de parcare in dreapta noastra
;;
;;----------------------------------

;--- Test 1: Semafor rosu, masina semnalizeaza stanga, locul detectat
(defrule AGENT::rsrclp
    (timp (valoare ?t))
    ?f <- (ag_bel (bel_type moment) (bel_pname stop-car-immediately-maneuver) (bel_pval prohibited))
    (ag_bel (bel_type moment) (bel_pobj ?sem1) (bel_pname isa) (bel_pval semafor))
    (ag_bel (bel_type moment) (bel_pobj ?sem1) (bel_pname color) (bel_pval red))
    (ag_bel (bel_type moment) (bel_pobj ?yourcar) (bel_pname isa) (bel_pval car))
    (ag_bel (bel_type moment) (bel_pobj ?secondcar) (bel_pname isa) (bel_pval car))
    (ag_bel (bel_type moment) (bel_pobj ?secondcar) (bel_pname intention) (bel_pval left))
    (ag_bel (bel_type moment) (bel_pobj ?parking1) (bel_pname isa) (bel_pval parking))
    (ag_bel (bel_type moment) (bel_pobj ?parking1) (bel_pname direction) (bel_pval right))
    (ag_bel (bel_type moment) (bel_pobj ?parking1) (bel_pname proximity) (bel_pval 1))
    (ag_bel (bel_type moment) (bel_pobj ?secondcar) (bel_pname proximity) (bel_pval 1))
    (ag_bel (bel_type moment) (bel_pobj ?sem1) (bel_pname proximity) (bel_pval 2))
=>
    (if (eq ?*ag-in-debug* TRUE) then (printout t "    <D>rsrclp vad a doua masina vrea " left " si semafor " red " si parcare " parking crlf))
    (retract ?f)
    (assert (ag_bel (bel_type moment) (bel_pname stop-car-immediately-maneuver) (bel_pval allowed)))
)

;--- Test 2: Semafor verde, masina semnalizeaza stanga, locul detectat
(defrule AGENT::rsgclp
    (timp (valoare ?t))
    ?f <- (ag_bel (bel_type moment) (bel_pname keep-going-maneuver) (bel_pval prohibited))
    (ag_bel (bel_type moment) (bel_pobj ?sem1) (bel_pname isa) (bel_pval semafor))
    (ag_bel (bel_type moment) (bel_pobj ?sem1) (bel_pname color) (bel_pval green))
    (ag_bel (bel_type moment) (bel_pobj ?yourcar) (bel_pname isa) (bel_pval car))
    (ag_bel (bel_type moment) (bel_pobj ?secondcar) (bel_pname isa) (bel_pval car))
    (ag_bel (bel_type moment) (bel_pobj ?secondcar) (bel_pname intention) (bel_pval left))
    (ag_bel (bel_type moment) (bel_pobj ?parking1) (bel_pname isa) (bel_pval parking))
    (ag_bel (bel_type moment) (bel_pobj ?parking1) (bel_pname direction) (bel_pval right))
    (ag_bel (bel_type moment) (bel_pobj ?parking1) (bel_pname proximity) (bel_pval 1))
    (ag_bel (bel_type moment) (bel_pobj ?secondcar) (bel_pname proximity) (bel_pval 1))
    (ag_bel (bel_type moment) (bel_pobj ?sem1) (bel_pname proximity) (bel_pval 2))
=>
    (if (eq ?*ag-in-debug* TRUE) then (printout t "    <D>rsgclp vad a doua masina vrea " left " si semafor " green " si parcare " parking crlf))
    (retract ?f)
    (assert (ag_bel (bel_type moment) (bel_pname keep-going-maneuver) (bel_pval allowed)))
)

;--- Test 3: Semafor red, masina nu semnalizeaza, locul detectat
(defrule AGENT::rsrcap
    (timp (valoare ?t))
    ?f <- (ag_bel (bel_type moment) (bel_pname go-further-before-stopping-maneuver) (bel_pval prohibited))
    (ag_bel (bel_type moment) (bel_pobj ?sem1) (bel_pname isa) (bel_pval semafor))
    (ag_bel (bel_type moment) (bel_pobj ?sem1) (bel_pname color) (bel_pval red))
    (ag_bel (bel_type moment) (bel_pobj ?yourcar) (bel_pname isa) (bel_pval car))
    (ag_bel (bel_type moment) (bel_pobj ?secondcar) (bel_pname isa) (bel_pval car))
    (ag_bel (bel_type moment) (bel_pobj ?secondcar) (bel_pname intention) (bel_pval ahead))
    (ag_bel (bel_type moment) (bel_pobj ?parking1) (bel_pname isa) (bel_pval parking))
    (ag_bel (bel_type moment) (bel_pobj ?parking1) (bel_pname direction) (bel_pval right))
    (ag_bel (bel_type moment) (bel_pobj ?parking1) (bel_pname proximity) (bel_pval 1))
    (ag_bel (bel_type moment) (bel_pobj ?secondcar) (bel_pname proximity) (bel_pval 1))
    (ag_bel (bel_type moment) (bel_pobj ?sem1) (bel_pname proximity) (bel_pval 2))
=>
    (if (eq ?*ag-in-debug* TRUE) then (printout t "    <D>rsrcap vad a doua masina vrea " ahead " si semafor " red " si parcare " parking crlf))
    (retract ?f)
    (assert (ag_bel (bel_type moment) (bel_pname go-further-before-stopping-maneuver) (bel_pval allowed)))
)

;--- Test 4: Semafor verde, masina nu semnalizeaza, locul detectat
(defrule AGENT::rsgcap
    (timp (valoare ?t))
    ?f <- (ag_bel (bel_type moment) (bel_pname keep-going-maneuver) (bel_pval prohibited))
    (ag_bel (bel_type moment) (bel_pobj ?sem1) (bel_pname isa) (bel_pval semafor))
    (ag_bel (bel_type moment) (bel_pobj ?sem1) (bel_pname color) (bel_pval green))
    (ag_bel (bel_type moment) (bel_pobj ?yourcar) (bel_pname isa) (bel_pval car))
    (ag_bel (bel_type moment) (bel_pobj ?secondcar) (bel_pname isa) (bel_pval car))
    (ag_bel (bel_type moment) (bel_pobj ?secondcar) (bel_pname intention) (bel_pval ahead))
    (ag_bel (bel_type moment) (bel_pobj ?parking1) (bel_pname isa) (bel_pval parking))
    (ag_bel (bel_type moment) (bel_pobj ?parking1) (bel_pname direction) (bel_pval right))
    (ag_bel (bel_type moment) (bel_pobj ?parking1) (bel_pname proximity) (bel_pval 1))
    (ag_bel (bel_type moment) (bel_pobj ?secondcar) (bel_pname proximity) (bel_pval 1))
    (ag_bel (bel_type moment) (bel_pobj ?sem1) (bel_pname proximity) (bel_pval 2))
=>
    (if (eq ?*ag-in-debug* TRUE) then (printout t "    <D>rsgcap vad a doua masina vrea " ahead " si semafor " green " si parcare " parking crlf))
    (retract ?f)
    (assert (ag_bel (bel_type moment) (bel_pname keep-going-maneuver) (bel_pval allowed)))
)

;;----------------------------------
;;
;;    Case 4: Unificare a 2 benzi pe acelasi sens de mers, automobilul nostru e pe banda prioritata
;;
;;----------------------------------

;--- Test 1: O masina pe banda care se uneste, paralela cu a ta
(defrule AGENT::rcn
    (timp (valoare ?t))
    ?f <- (ag_bel (bel_type moment) (bel_pname reduce-speed-maneuver) (bel_pval prohibited))
    (ag_bel (bel_type moment) (bel_pobj ?lane1) (bel_pname isa) (bel_pval lane))
    (ag_bel (bel_type moment) (bel_pobj ?lane2) (bel_pname isa) (bel_pval lane))
    (ag_bel (bel_type moment) (bel_pobj ?yourcar) (bel_pname isa) (bel_pval car))
    (ag_bel (bel_type moment) (bel_pobj ?secondcar) (bel_pname isa) (bel_pval car))
    (ag_bel (bel_type moment) (bel_pobj ?yourcar) (bel_pname ison) (bel_pval ?lane2))
    (ag_bel (bel_type moment) (bel_pobj ?secondcar) (bel_pname ison) (bel_pval ?lane1))
    (ag_bel (bel_type moment) (bel_pobj ?secondcar) (bel_pname proximity) (bel_pval 0))
    (ag_bel (bel_type moment) (bel_pobj ?lane1) (bel_pname priority) (bel_pval low))
    (ag_bel (bel_type moment) (bel_pobj ?lane2) (bel_pname priority) (bel_pval high))
    (ag_bel (bel_type moment) (bel_pobj ?lane1) (bel_pname continues) (bel_pval no))
    (ag_bel (bel_type moment) (bel_pobj ?lane2) (bel_pname continues) (bel_pval yes))
=>
    (if (eq ?*ag-in-debug* TRUE) then (printout t "    <D>rcn vad a doua masina aproape" crlf))
    (retract ?f)
    (assert (ag_bel (bel_type moment) (bel_pname reduce-speed-maneuver) (bel_pval allowed)))
)

;--- Test 2: O masina pe banda care se uneste, mai in spate
(defrule AGENT::rcf
    (timp (valoare ?t))
    ?f <- (ag_bel (bel_type moment) (bel_pname keep-going-maneuver) (bel_pval prohibited))
    (ag_bel (bel_type moment) (bel_pobj ?lane1) (bel_pname isa) (bel_pval lane))
    (ag_bel (bel_type moment) (bel_pobj ?lane2) (bel_pname isa) (bel_pval lane))
    (ag_bel (bel_type moment) (bel_pobj ?yourcar) (bel_pname isa) (bel_pval car))
    (ag_bel (bel_type moment) (bel_pobj ?secondcar) (bel_pname isa) (bel_pval car))
    (ag_bel (bel_type moment) (bel_pobj ?yourcar) (bel_pname ison) (bel_pval ?lane2))
    (ag_bel (bel_type moment) (bel_pobj ?secondcar) (bel_pname ison) (bel_pval ?lane1))
    (ag_bel (bel_type moment) (bel_pobj ?secondcar) (bel_pname proximity) (bel_pval 1))
    (ag_bel (bel_type moment) (bel_pobj ?lane1) (bel_pname priority) (bel_pval low))
    (ag_bel (bel_type moment) (bel_pobj ?lane2) (bel_pname priority) (bel_pval high))
    (ag_bel (bel_type moment) (bel_pobj ?lane1) (bel_pname continues) (bel_pval no))
    (ag_bel (bel_type moment) (bel_pobj ?lane2) (bel_pname continues) (bel_pval yes))
=>
    (if (eq ?*ag-in-debug* TRUE) then (printout t "    <D>rcf vad a doua masina departe" crlf))
    (retract ?f)
    (assert (ag_bel (bel_type moment) (bel_pname keep-going-maneuver) (bel_pval allowed)))
)

;--- Test 3: Doua masini pe banda care se uneste, prima e paralela cu a ta, a doua mai in spate
(defrule AGENT::rscntcf
    (timp (valoare ?t))
    ?f <- (ag_bel (bel_type moment) (bel_pname allow-first-car-through-maneuver) (bel_pval prohibited))
    (ag_bel (bel_type moment) (bel_pobj ?lane1) (bel_pname isa) (bel_pval lane))
    (ag_bel (bel_type moment) (bel_pobj ?lane2) (bel_pname isa) (bel_pval lane))
    (ag_bel (bel_type moment) (bel_pobj ?yourcar) (bel_pname isa) (bel_pval car))
    (ag_bel (bel_type moment) (bel_pobj ?secondcar) (bel_pname isa) (bel_pval car))
    (ag_bel (bel_type moment) (bel_pobj ?thirdcar) (bel_pname isa) (bel_pval car))
    (ag_bel (bel_type moment) (bel_pobj ?yourcar) (bel_pname ison) (bel_pval ?lane2))
    (ag_bel (bel_type moment) (bel_pobj ?secondcar) (bel_pname ison) (bel_pval ?lane1))
    (ag_bel (bel_type moment) (bel_pobj ?thirdcar) (bel_pname ison) (bel_pval ?lane1))
    (ag_bel (bel_type moment) (bel_pobj ?secondcar) (bel_pname proximity) (bel_pval 0))
    (ag_bel (bel_type moment) (bel_pobj ?thirdcar) (bel_pname proximity) (bel_pval 1))
    (ag_bel (bel_type moment) (bel_pobj ?lane1) (bel_pname priority) (bel_pval low))
    (ag_bel (bel_type moment) (bel_pobj ?lane2) (bel_pname priority) (bel_pval high))
    (ag_bel (bel_type moment) (bel_pobj ?lane1) (bel_pname continues) (bel_pval no))
    (ag_bel (bel_type moment) (bel_pobj ?lane2) (bel_pname continues) (bel_pval yes))
=>
    (if (eq ?*ag-in-debug* TRUE) then (printout t "    <D>rscntcf vad a doua masina departe" crlf))
    (retract ?f)
    (assert (ag_bel (bel_type moment) (bel_pname allow-first-car-through-maneuver) (bel_pval allowed)))
)

;;----------------------------------
;;
;;    Case 5: Automobilul face loc unui alt automobil angajat in depasire care vine din sens opus
;;
;;----------------------------------

;--- Test 1: Detectam doua masini, una ce vine in depasire spre noi pe banda noastra, aproape de noi
(defrule AGENT::rscon
    (timp (valoare ?t))
    ?f <- (ag_bel (bel_type moment) (bel_pname pull-right-maneuver) (bel_pval prohibited))
    (ag_bel (bel_type moment) (bel_pobj ?lane1) (bel_pname isa) (bel_pval lane))
    (ag_bel (bel_type moment) (bel_pobj ?lane2) (bel_pname isa) (bel_pval lane))
    (ag_bel (bel_type moment) (bel_pobj ?yourcar) (bel_pname isa) (bel_pval car))
    (ag_bel (bel_type moment) (bel_pobj ?secondcar) (bel_pname isa) (bel_pval car))
    (ag_bel (bel_type moment) (bel_pobj ?thirdcar) (bel_pname isa) (bel_pval car))
    (ag_bel (bel_type moment) (bel_pobj ?yourcar) (bel_pname ison) (bel_pval ?lane1))
    (ag_bel (bel_type moment) (bel_pobj ?secondcar) (bel_pname ison) (bel_pval ?lane1))
    (ag_bel (bel_type moment) (bel_pobj ?thirdcar) (bel_pname ison) (bel_pval ?lane2))
    (ag_bel (bel_type moment) (bel_pobj ?secondcar) (bel_pname overtaking) (bel_pval ?thirdcar))
    (ag_bel (bel_type moment) (bel_pobj ?secondcar) (bel_pname proximity) (bel_pval 2))
=>
    (if (eq ?*ag-in-debug* TRUE) then (printout t "    <D>rscon vad a doua masina in depasire apropiindu-se" crlf))
    (retract ?f)
    (assert (ag_bel (bel_type moment) (bel_pname pull-right-maneuver) (bel_pval allowed)))
)

;--- Test 2: Detectam doua masini, una ce vine in depasire spre noi pe banda noastra, destul de departe
(defrule AGENT::rscof
    (timp (valoare ?t))
    ?f <- (ag_bel (bel_type moment) (bel_pname reduce-speed-maneuver) (bel_pval prohibited))
    (ag_bel (bel_type moment) (bel_pobj ?lane1) (bel_pname isa) (bel_pval lane))
    (ag_bel (bel_type moment) (bel_pobj ?lane2) (bel_pname isa) (bel_pval lane))
    (ag_bel (bel_type moment) (bel_pobj ?yourcar) (bel_pname isa) (bel_pval car))
    (ag_bel (bel_type moment) (bel_pobj ?secondcar) (bel_pname isa) (bel_pval car))
    (ag_bel (bel_type moment) (bel_pobj ?thirdcar) (bel_pname isa) (bel_pval car))
    (ag_bel (bel_type moment) (bel_pobj ?yourcar) (bel_pname ison) (bel_pval ?lane1))
    (ag_bel (bel_type moment) (bel_pobj ?secondcar) (bel_pname ison) (bel_pval ?lane1))
    (ag_bel (bel_type moment) (bel_pobj ?thirdcar) (bel_pname ison) (bel_pval ?lane2))
    (ag_bel (bel_type moment) (bel_pobj ?secondcar) (bel_pname overtaking) (bel_pval ?thirdcar))
    (ag_bel (bel_type moment) (bel_pobj ?secondcar) (bel_pname proximity) (bel_pval 3))
=>
    (if (eq ?*ag-in-debug* TRUE) then (printout t "    <D>rscof vad a doua masina in depasire, suficient de departe" crlf))
    (retract ?f)
    (assert (ag_bel (bel_type moment) (bel_pname reduce-speed-maneuver) (bel_pval allowed)))
)

;--- Test 3: Detectam doua masini, niciuna nu e in depasire
(defrule AGENT::rccon
    (timp (valoare ?t))
    ?f <- (ag_bel (bel_type moment) (bel_pname keep-going-maneuver) (bel_pval prohibited))
    (ag_bel (bel_type moment) (bel_pobj ?lane1) (bel_pname isa) (bel_pval lane))
    (ag_bel (bel_type moment) (bel_pobj ?lane2) (bel_pname isa) (bel_pval lane))
    (ag_bel (bel_type moment) (bel_pobj ?yourcar) (bel_pname isa) (bel_pval car))
    (ag_bel (bel_type moment) (bel_pobj ?secondcar) (bel_pname isa) (bel_pval car))
    (ag_bel (bel_type moment) (bel_pobj ?thirdcar) (bel_pname isa) (bel_pval car))
    (ag_bel (bel_type moment) (bel_pobj ?yourcar) (bel_pname ison) (bel_pval ?lane1))
    (ag_bel (bel_type moment) (bel_pobj ?secondcar) (bel_pname ison) (bel_pval ?lane2))
    (ag_bel (bel_type moment) (bel_pobj ?thirdcar) (bel_pname ison) (bel_pval ?lane2))
    (ag_bel (bel_type moment) (bel_pobj ?secondcar) (bel_pname intention) (bel_pval behind))
    (ag_bel (bel_type moment) (bel_pobj ?thirdcar) (bel_pname intention) (bel_pval behind))
    (ag_bel (bel_type moment) (bel_pobj ?secondcar) (bel_pname proximity) (bel_pval 1))
=>
    (if (eq ?*ag-in-debug* TRUE) then (printout t "    <D>rccon vad doua masini, niciuna nu depaseste" crlf))
    (retract ?f)
    (assert (ag_bel (bel_type moment) (bel_pname keep-going-maneuver) (bel_pval allowed)))
)

;;----------------------------------
;;
;;    Case 6: Stropire pietoni
;;
;;----------------------------------

;--- Test 1: Detectam balta pe banda noastra langa pietoni, o singura banda pe sens
(defrule AGENT::rlpnb
    (timp (valoare ?t))
    ?f <- (ag_bel (bel_type moment) (bel_pname reduce-speed-maneuver) (bel_pval prohibited))
    (ag_bel (bel_type moment) (bel_pobj ?lane1) (bel_pname isa) (bel_pval lane))
    (ag_bel (bel_type moment) (bel_pobj ?lane2) (bel_pname isa) (bel_pval lane))
    (ag_bel (bel_type moment) (bel_pobj ?lane1) (bel_pname direction) (bel_pval ahead))
    (ag_bel (bel_type moment) (bel_pobj ?lane2) (bel_pname direction) (bel_pval behind))
    (ag_bel (bel_type moment) (bel_pobj ?yourcar) (bel_pname isa) (bel_pval car))
    (ag_bel (bel_type moment) (bel_pobj ?yourcar) (bel_pname ison) (bel_pval ?lane1))
    (ag_bel (bel_type moment) (bel_pobj ?puddle) (bel_pname partof) (bel_pval ?lane1))
    (ag_bel (bel_type moment) (bel_pobj ?bystanders) (bel_pname isa) (bel_pval condition))
    (ag_bel (bel_type moment) (bel_pobj ?puddle) (bel_pname near) (bel_pval ?bystanders))
=>
    (if (eq ?*ag-in-debug* TRUE) then (printout t "    <D>rlpnb vad balta langa " ?bystanders ", o banda pe sens" crlf))
    (retract ?f)
    (assert (ag_bel (bel_type moment) (bel_pname reduce-speed-maneuver) (bel_pval allowed)))
)

;--- Test 2: Detectam balta pe banda noastra langa pietoni, doua benzi pe sens
(defrule AGENT::rllpanb
    (timp (valoare ?t))
    ?f <- (ag_bel (bel_type moment) (bel_pname change-lane-maneuver) (bel_pval prohibited))
    (ag_bel (bel_type moment) (bel_pobj ?lane1) (bel_pname isa) (bel_pval lane))
    (ag_bel (bel_type moment) (bel_pobj ?lane2) (bel_pname isa) (bel_pval lane))
    (ag_bel (bel_type moment) (bel_pobj ?lane1) (bel_pname direction) (bel_pval ahead))
    (ag_bel (bel_type moment) (bel_pobj ?lane2) (bel_pname direction) (bel_pval ahead))
    (ag_bel (bel_type moment) (bel_pobj ?yourcar) (bel_pname isa) (bel_pval car))
    (ag_bel (bel_type moment) (bel_pobj ?yourcar) (bel_pname ison) (bel_pval ?lane1))
    (ag_bel (bel_type moment) (bel_pobj ?puddle) (bel_pname partof) (bel_pval ?lane1))
    (ag_bel (bel_type moment) (bel_pobj ?bystanders) (bel_pname isa) (bel_pval condition))
    (ag_bel (bel_type moment) (bel_pobj ?puddle) (bel_pname near) (bel_pval ?bystanders))
=>
    (if (eq ?*ag-in-debug* TRUE) then (printout t "    <D>rllpanb vad balta pe propria banda langa " ?bystanders ", doua benzi pe sens" crlf))
    (retract ?f)
    (assert (ag_bel (bel_type moment) (bel_pname change-lane-maneuver) (bel_pval allowed)))
)

;--- Test 3: Detectam balta pe cealalta banda langa pietoni, doua benzi pe sens
(defrule AGENT::rllpnanb
    (timp (valoare ?t))
    ?f <- (ag_bel (bel_type moment) (bel_pname keep-going-maneuver) (bel_pval prohibited))
    (ag_bel (bel_type moment) (bel_pobj ?lane1) (bel_pname isa) (bel_pval lane))
    (ag_bel (bel_type moment) (bel_pobj ?lane2) (bel_pname isa) (bel_pval lane))
    (ag_bel (bel_type moment) (bel_pobj ?lane1) (bel_pname direction) (bel_pval ahead))
    (ag_bel (bel_type moment) (bel_pobj ?lane2) (bel_pname direction) (bel_pval ahead))
    (ag_bel (bel_type moment) (bel_pobj ?yourcar) (bel_pname isa) (bel_pval car))
    (ag_bel (bel_type moment) (bel_pobj ?yourcar) (bel_pname ison) (bel_pval ?lane2))
    (ag_bel (bel_type moment) (bel_pobj ?puddle) (bel_pname partof) (bel_pval ?lane1))
    (ag_bel (bel_type moment) (bel_pobj ?bystanders) (bel_pname isa) (bel_pval condition))
    (ag_bel (bel_type moment) (bel_pobj ?puddle) (bel_pname near) (bel_pval ?bystanders))
=>
    (if (eq ?*ag-in-debug* TRUE) then (printout t "    <D>rllpnanb vad balta pe cealalta banda langa " ?bystanders ", doua benzi pe sens" crlf))
    (retract ?f)
    (assert (ag_bel (bel_type moment) (bel_pname keep-going-maneuver) (bel_pval allowed)))
)

;--- Test 4: Detectam balta pe banda noastra, dar nu e langa nimic, doua benzi pe sens
(defrule AGENT::rllpann
    (timp (valoare ?t))
    ?f <- (ag_bel (bel_type moment) (bel_pname keep-going-maneuver) (bel_pval prohibited))
    (ag_bel (bel_type moment) (bel_pobj ?lane1) (bel_pname isa) (bel_pval lane))
    (ag_bel (bel_type moment) (bel_pobj ?lane2) (bel_pname isa) (bel_pval lane))
    (ag_bel (bel_type moment) (bel_pobj ?lane1) (bel_pname direction) (bel_pval ahead))
    (ag_bel (bel_type moment) (bel_pobj ?lane2) (bel_pname direction) (bel_pval ahead))
    (ag_bel (bel_type moment) (bel_pobj ?yourcar) (bel_pname isa) (bel_pval car))
    (ag_bel (bel_type moment) (bel_pobj ?yourcar) (bel_pname ison) (bel_pval ?lane1))
    (ag_bel (bel_type moment) (bel_pobj ?puddle) (bel_pname partof) (bel_pval ?lane1))
    (ag_bel (bel_type moment) (bel_pobj ?puddle) (bel_pname near) (bel_pval nothing))
=>
    (if (eq ?*ag-in-debug* TRUE) then (printout t "    <D>rllpann vad balta pe propria banda lang " nothing ", doua benzi pe sens" crlf))
    (retract ?f)
    (assert (ag_bel (bel_type moment) (bel_pname keep-going-maneuver) (bel_pval allowed)))
)




;;----------------------------------
;;
;;    Overtaking
;;
;;----------------------------------

;
;-------Check percepts to update restriction fluents-----------
;
;---Case #1: a fluent with 1 sign to turn it on and 2 signs which might turn it off

;--- Sign overtaking prohibited
(defrule AGENT::rdi
    (timp (valoare ?t))
    (ag_bel (bel_type moment) (bel_pobj ?ps) (bel_pname isa) (bel_pval road_sign))
    (ag_bel (bel_type moment) (bel_pobj ?ps) (bel_pname semnificatie) (bel_pval depasire_interzisa))
=>
    (if (eq ?*ag-in-debug* TRUE) then (printout t "    <D>rdi vad indicator " depasire_interzisa crlf))
    (assert (ag_bel (bel_type fluent) (bel_pname no-overtaking-zone) (bel_pval yes)))
    ;(facts AGENT)
)

(defrule AGENT::frdi
    (timp (valoare ?t))
    ?f <- (ag_bel (bel_type fluent) (bel_pname no-overtaking-zone) (bel_pval yes))
    (ag_bel (bel_type moment) (bel_pobj ?ps) (bel_pname isa) (bel_pval road_sign))
    (ag_bel (bel_type moment) (bel_pobj ?ps) (bel_pname semnificatie) (bel_pval final_depasire_interzisa))
=>
    (if (eq ?*ag-in-debug* TRUE) then (printout t "    <D>frdi vad indicator " final_depasire_interzisa crlf))
    (retract ?f)
    ;(facts AGENT)
)

(defrule AGENT::far
    (timp (valoare ?t))
    ?f <- (ag_bel (bel_type fluent) (bel_pname no-overtaking-zone) (bel_pval yes))
    (ag_bel (bel_type moment) (bel_pobj ?ps) (bel_pname isa) (bel_pval road_sign))
    (ag_bel (bel_type moment) (bel_pobj ?ps) (bel_pname semnificatie) (bel_pval  incetarea_tuturor_restrictiilor))
=>
    (if (eq ?*ag-in-debug* TRUE) then (printout t "    <D>far vad indicator " tip incetarea_tuturor_restrictiilor crlf))
    (retract ?f)
    ;(facts AGENT)
)

;----Case #2: an non-fluent belief: it depends on the current percepts only
;--- Marcaj trecere pietoni perceput in momentul curent
(defrule AGENT::rmtp
    (timp (valoare ?t))
    (ag_bel (bel_type moment) (bel_pobj ?ps) (bel_pname isa) (bel_pval road_surface_marking))
    (ag_bel (bel_type moment) (bel_pobj ?ps) (bel_pname semnificatie) (bel_pval  trecere_pietoni))
=>
    (if (eq ?*ag-in-debug* TRUE) then (printout t "    <D>rmtp vad marcaj " trecere_pietoni crlf))
    (assert (ag_bel (bel_type moment) (bel_pname pedestrian-crossing-marking) (bel_pval yes)))
)

;--- Marcaj linie continua perceput in momentul curent
(defrule AGENT::rmlc
    (timp (valoare ?t))
    (ag_bel (bel_type moment) (bel_pobj ?ps) (bel_pname isa) (bel_pval road_surface_marking))
    (ag_bel (bel_type moment) (bel_pobj ?ps) (bel_pname semnificatie) (bel_pval linie_cont))
=>
    (if (eq ?*ag-in-debug* TRUE) then (printout t "    <D>rmlc vad marcaj " linie_cont crlf))
    (assert (ag_bel (bel_type moment) (bel_pname continuous-line-marking) (bel_pval yes)))
    ;(facts AGENT)
)


;-- TODO: daca am Semn trecere de pietoni (nu marcaj, ci semn!) - switch fluent dupa o anumita distanta parcursa
;-- de abstractizat terminarea parcurgerii distantei 

;-- TODO: marcaj linie continua pe care l-as incalca la repliere - tratare perceptii curente+viitoare
;-- de integrat si in regula validate-overtaking

;-----Validate intention of overtaking: check if there is any restriction ----------
(defrule AGENT::validate-overtaking
    (declare (salience -10))
    ?f <- (ag_bel (bel_type moment) (bel_pname overtaking-maneuver) (bel_pval prohibited))
    (not (ag_bel (bel_type fluent) (bel_pname no-overtaking-zone) (bel_pval yes)))
    (not (ag_bel (bel_type moment) (bel_pname pedestrian-crossing-marking) (bel_pval yes)))
    (not (ag_bel (bel_type moment) (bel_pname continuous-line-marking) (bel_pval yes)))
; TODO: De restul cazurilor, listate mai jos, trebuie sa te ocupi 
;    (not (crt-intersectie))
;    (not (crt-rampa))
;    (not (crt-curba))
;    (not (crt-vizibilitate redusa))
;    (not (crt-pasaj))
;    (not (crt-pod))
;    (not (crt-sub pod))
;    (not (crt-tunel))
;    (not (crt-cale ferata curenta))
;    (not (crt-urmeaza cale ferata))
;    (not (crt-statie))
;    (not (crt-marcaj dublu continuu))
;    (not (crt-posibila coliziune))
;    (not (crt-coloana))
;    (not (crt-coloana_oficiala))
=>
    (if (eq ?*ag-in-debug* TRUE) then (printout t "    <D>validate-overtaking NU->DA (nu avem restrictii) " crlf))
    (retract ?f)
    (assert (ag_bel (bel_type moment) (bel_pname overtaking-maneuver) (bel_pval allowed)))
    ;(facts AGENT)
)


;;----------------------------------
;;
;;    Right turn
;;
;;----------------------------------

;--- Sign forbidding right turn or forcing either go ahead or left turn
(defrule AGENT::r-no-right-turn-sign
    (timp (valoare ?t))
    (ag_bel (bel_pobj ?ps) (bel_pname isa) (bel_pval road_sign))
    (ag_bel (bel_pobj ?ps) (bel_pname semnificatie) (bel_pval ?v&interzis_viraj_dreapta | obligatoriu_inainte | obligatoriu_stanga | obligatoriu_inainte_stanga))
=>
    (if (eq ?*ag-in-debug* TRUE) then (printout t "    <D>r-no-right-turn-sign" crlf))
    (assert (ag_bel (bel_type fluent) (bel_pname no-right-turn-zone) (bel_pval yes)))
    ;(facts AGENT)
)

(defrule AGENT::r-no-right-turn-zone-end
    (timp (valoare ?t))
    ?f <- (ag_bel (bel_type fluent) (bel_pname no-right-turn-zone) (bel_pval yes))
    (ag_bel (bel_pobj ?ps) (bel_pname isa) (bel_pval area_limit))
    (ag_bel (bel_pobj ?ps) (bel_pname semnificatie) (bel_pval intersection_end))
=>
    (if (eq ?*ag-in-debug* TRUE) then (printout t "    <D>r-no-right-turn-zone-end we crossed an intersection" crlf))
    (retract ?f)
)

 ;--- Sign forbidding access on a street
(defrule AGENT::r-no-access
    (timp (valoare ?t))
    (ag_bel (bel_pobj ?ps) (bel_pname isa) (bel_pval road_sign))
    (ag_bel (bel_pobj ?ps) (bel_pname semnificatie) (bel_pval ?v& accesul_interzis | circulatia_interzisa_in_ambele_sensuri))
    ;;;(ag_bel (bel_pobj ?ps) (bel_pname direction) (bel_pval ?pd& right | left))
=>
    (if (eq ?*ag-in-debug* TRUE) then (printout t "    <D>r-no-access" crlf))
    (assert (ag_bel (bel_type moment) (bel_pname no-access) (bel_pval yes)))
    ;(facts AGENT)
)

;-----Validate intention of right-turn: check if there is any restriction ----------
(defrule AGENT::validate-right-turn
    (declare (salience -10))
    ?f <- (ag_bel (bel_type moment) (bel_pname right-turn-maneuver) (bel_pval prohibited))
    (not (ag_bel (bel_type fluent) (bel_pname no-right-turn-zone) (bel_pval yes)))
    ;(not (ag_bel (bel_type moment) (bel_pname no-access) (bel_pval yes) (bel_pdir right)))
    ;; TODO: manage direction
    (not (ag_bel (bel_type moment) (bel_pname no-access) (bel_pval yes)))
=>
    (if (eq ?*ag-in-debug* TRUE) then (printout t "    <D>validate-right-turn NU->DA (nu avem restrictii) " crlf))
    (retract ?f)
    (assert (ag_bel (bel_type moment) (bel_pname right-turn-maneuver) (bel_pval allowed)))
    ;(facts AGENT)
)


;;----------------------------------
;;
;;    Left turn
;;
;;----------------------------------

;--Sign forbidding access on a street to the left dealt by r-no-access rule
;--continuous line presence checked by rmlc rule
;--TODO: roundabout

;--- Sign forbidding left turn or forcing either go ahead or right turn
(defrule AGENT::r-no-left-turn-sign
    (timp (valoare ?t))
    (ag_bel (bel_pobj ?ps) (bel_pname isa) (bel_pval road_sign))
    (ag_bel (bel_pobj ?ps) (bel_pname semnificatie) (bel_pval ?v&interzis_viraj_stanga | obligatoriu_inainte | obligatoriu_dreapta | obligatoriu_inainte_dreapta | intersectie_cu_sens_giratoriu))
=>
    (if (eq ?*ag-in-debug* TRUE) then (printout t "    <D>r-no-left-turn-sign" ?v crlf))
    (assert (ag_bel (bel_type fluent) (bel_pname no-left-turn-zone) (bel_pval yes)))
    ;(facts AGENT)
)

(defrule AGENT::r-no-left-turn-zone-end
    (timp (valoare ?t))
    ?f <- (ag_bel (bel_type fluent) (bel_pname no-left-turn-zone) (bel_pval yes))
    (ag_bel (bel_pobj ?ps) (bel_pname isa) (bel_pval area_limit))
    (ag_bel (bel_pobj ?ps) (bel_pname isa) (bel_pval area_limit))
    (ag_bel (bel_pobj ?ps) (bel_pname semnificatie) (bel_pval intersection_end))
=>
    (if (eq ?*ag-in-debug* TRUE) then (printout t "    <D>r-no-left-turn-zone-end we crossed an intersection" crlf))
    (retract ?f)
)

;-----Validate intention of left-turn: check if there is any restriction ----------
(defrule AGENT::validate-left-turn
    (declare (salience -10))
    ?f <- (ag_bel (bel_type moment) (bel_pname left-turn-maneuver) (bel_pval prohibited))
    (not (ag_bel (bel_type fluent) (bel_pname no-left-turn-zone) (bel_pval yes)))
    ;(not (ag_bel (bel_type moment) (bel_pname no-access) (bel_pval yes) (bel_pdir left)))
    ;; TODO: manage direction
     (not (ag_bel (bel_type moment) (bel_pname no-access) (bel_pval yes)))
    (not (ag_bel (bel_type moment) (bel_pname continuous-line-marking) (bel_pval yes)))
;roundabout
=>
    (if (eq ?*ag-in-debug* TRUE) then (printout t "    <D>validate-left-turn NU->DA (nu avem restrictii) " crlf))
    (retract ?f)
    (assert (ag_bel (bel_type moment) (bel_pname left-turn-maneuver) (bel_pval allowed)))
    ;(facts AGENT)
)



;---------Delete auxiliary facts which are no longer needed ----------
;
; Programmner's task
;
