;
;-------Auxiliary facts ---------------------------------------
;

(defrule AGENT::initCycle-pressbreak-no-turn
    (declare (salience 89))
    (timp (valoare ?)) ;make sure it fires each cycle
=>
    (if (eq ?*ag-in-debug* TRUE) then (printout t "    <D>initCycle-pressbreak-no-turn prohibited by default " crlf))
    (assert (ag_bel (bel_type moment) (bel_pname pressbreak-no-turn-maneuver) (bel_pval prohibited))) ;by default, we assume pressbreak-no-turn NOT valid
    ;(facts AGENT)
)

(defrule AGENT::initCycle-accelerate-no-turn
    (declare (salience 89))
    (timp (valoare ?)) ;make sure it fires each cycle
=>
    (if (eq ?*ag-in-debug* TRUE) then (printout t "    <D>initCycle-accelerate-no-turn prohibited by default " crlf))
    (assert (ag_bel (bel_type moment) (bel_pname accelerate-no-turn-maneuver) (bel_pval prohibited))) ;by default, we assume accelerate-no-turn NOT valid
    ;(facts AGENT)
)

(defrule AGENT::initCycle-wait-pressbreak-no-turn
    (declare (salience 89))
    (timp (valoare ?)) ;make sure it fires each cycle
=>
    (if (eq ?*ag-in-debug* TRUE) then (printout t "    <D>initCycle-wait-pressbreak-no-turn prohibited by default " crlf))
    (assert (ag_bel (bel_type moment) (bel_pname wait-pressbreak-no-turn-maneuver) (bel_pval prohibited))) ;by default, we assume wait-pressbreak-no-turn NOT valid
    ;(facts AGENT)
)

(defrule AGENT::initCycle-accelerate-turn-left
    (declare (salience 89))
    (timp (valoare ?)) ;make sure it fires each cycle
=>
    (if (eq ?*ag-in-debug* TRUE) then (printout t "    <D>initCycle-accelerate-turn-left prohibited by default " crlf))
    (assert (ag_bel (bel_type moment) (bel_pname accelerate-turn-left-maneuver) (bel_pval prohibited))) ;by default, we assume accelerate-turn-left NOT valid
    ;(facts AGENT)
)

(defrule AGENT::initCycle-pressbreak-wait-accelerate-no-turn
    (declare (salience 89))
    (timp (valoare ?)) ;make sure it fires each cycle
=>
    (if (eq ?*ag-in-debug* TRUE) then (printout t "    <D>initCycle-pressbreak-wait-accelerate-no-turn prohibited by default " crlf))
    (assert (ag_bel (bel_type moment) (bel_pname pressbreak-wait-accelerate-no-turn-maneuver) (bel_pval prohibited))) ;by default, we assume pressbreak-wait-accelerate-no-turn NOT valid
    ;(facts AGENT)
)

(defrule AGENT::initCycle-pressbreak-turn-right
    (declare (salience 89))
    (timp (valoare ?)) ;make sure it fires each cycle
=>
    (if (eq ?*ag-in-debug* TRUE) then (printout t "    <D>initCycle-pressbreak-turn-right prohibited by default " crlf))
    (assert (ag_bel (bel_type moment) (bel_pname pressbreak-turn-right-maneuver) (bel_pval prohibited))) ;by default, we assume pressbreak-turn-right NOT valid
    ;(facts AGENT)
)

;;----------------------------------
;;
;;    Case 1: Intersectie cu un drum neprioritar de pe partea dreapta, o masina vine de pe acel drum si trecere de pietoni in fata, dupa intersectie
;;
;;----------------------------------

;--- Test 1: A doua masina vrea sa faca stanga, iar trecerea este ocupata
(defrule AGENT::rsclcb
    (timp (valoare ?t))
    ?f <- (ag_bel (bel_type moment) (bel_pname pressbreak-no-turn-maneuver) (bel_pval prohibited))
    (ag_bel (bel_type moment) (bel_pobj ?inter) (bel_pname isa) (bel_pval intersection))
    (ag_bel (bel_type moment) (bel_pobj ?road1) (bel_pname partof) (bel_pval ?inter))
    (ag_bel (bel_type moment) (bel_pobj ?road2) (bel_pname partof) (bel_pval ?inter))
    (ag_bel (bel_type moment) (bel_pobj ?road2) (bel_pname state) (bel_pval busy))
    (ag_bel (bel_type moment) (bel_pobj ?crossing1) (bel_pname isa) (bel_pval crossing))
    (ag_bel (bel_type moment) (bel_pobj ?yourcar) (bel_pname isa) (bel_pval car))
    (ag_bel (bel_type moment) (bel_pobj ?secondcar) (bel_pname isa) (bel_pval car))
    (ag_bel (bel_type moment) (bel_pobj ?yourcar) (bel_pname ison) (bel_pval ?road1))
    (ag_bel (bel_type moment) (bel_pobj ?secondcar) (bel_pname ison) (bel_pval ?road2))
    (ag_bel (bel_type moment) (bel_pobj ?yourcar) (bel_pname intention) (bel_pval ahead))
    (ag_bel (bel_type moment) (bel_pobj ?secondcar) (bel_pname intention) (bel_pval left))
    (ag_bel (bel_type moment) (bel_pobj ?crossing1) (bel_pname state) (bel_pval busy))
    (ag_bel (bel_type moment) (bel_pobj ?secondcar) (bel_pname proximity) (bel_pval 1))
    (ag_bel (bel_type moment) (bel_pobj ?crossing1) (bel_pname proximity) (bel_pval 2))
    (test (neq ?road1 ?road2))
    (test (neq ?yourcar ?secondcar))
=>
    (if (eq ?*ag-in-debug* TRUE) then (printout t "    <D>rsclcb vad a doua masina vrea " left " si trecerea " busy crlf))
    (retract ?f)
    (assert (ag_bel (bel_type moment) (bel_pname pressbreak-no-turn-maneuver) (bel_pval allowed)))
)

;--- Test 2: A doua masina vrea sa faca stanga, iar trecerea este libera
(defrule AGENT::rsclce
    (timp (valoare ?t))
    ?f <- (ag_bel (bel_type moment) (bel_pname accelerate-no-turn-maneuver) (bel_pval prohibited))
    (ag_bel (bel_type moment) (bel_pobj ?inter) (bel_pname isa) (bel_pval intersection))
    (ag_bel (bel_type moment) (bel_pobj ?road1) (bel_pname partof) (bel_pval ?inter))
    (ag_bel (bel_type moment) (bel_pobj ?road2) (bel_pname partof) (bel_pval ?inter))
    (ag_bel (bel_type moment) (bel_pobj ?road2) (bel_pname state) (bel_pval busy))
    (ag_bel (bel_type moment) (bel_pobj ?crossing1) (bel_pname isa) (bel_pval crossing))
    (ag_bel (bel_type moment) (bel_pobj ?yourcar) (bel_pname isa) (bel_pval car))
    (ag_bel (bel_type moment) (bel_pobj ?secondcar) (bel_pname isa) (bel_pval car))
    (ag_bel (bel_type moment) (bel_pobj ?yourcar) (bel_pname ison) (bel_pval ?road1))
    (ag_bel (bel_type moment) (bel_pobj ?secondcar) (bel_pname ison) (bel_pval ?road2))
    (ag_bel (bel_type moment) (bel_pobj ?yourcar) (bel_pname intention) (bel_pval ahead))
    (ag_bel (bel_type moment) (bel_pobj ?secondcar) (bel_pname intention) (bel_pval left))
    (ag_bel (bel_type moment) (bel_pobj ?crossing1) (bel_pname state) (bel_pval empty))
    (ag_bel (bel_type moment) (bel_pobj ?secondcar) (bel_pname proximity) (bel_pval 1))
    (ag_bel (bel_type moment) (bel_pobj ?crossing1) (bel_pname proximity) (bel_pval 2))
    (test (neq ?road1 ?road2))
    (test (neq ?yourcar ?secondcar))
=>
    (if (eq ?*ag-in-debug* TRUE) then (printout t "    <D>rsclce vad a doua masina vrea " left " si trecerea " empty crlf))
    (retract ?f)
    (assert (ag_bel (bel_type moment) (bel_pname accelerate-no-turn-maneuver) (bel_pval allowed)))
)

;--- Test 3: A doua masina vrea sa faca dreapta, iar trecerea este ocupata
(defrule AGENT::rscrcb
    (timp (valoare ?t))
    ?f <- (ag_bel (bel_type moment) (bel_pname pressbreak-no-turn-maneuver) (bel_pval prohibited))
    (ag_bel (bel_type moment) (bel_pobj ?inter) (bel_pname isa) (bel_pval intersection))
    (ag_bel (bel_type moment) (bel_pobj ?road1) (bel_pname partof) (bel_pval ?inter))
    (ag_bel (bel_type moment) (bel_pobj ?road2) (bel_pname partof) (bel_pval ?inter))
    (ag_bel (bel_type moment) (bel_pobj ?road2) (bel_pname state) (bel_pval busy))
    (ag_bel (bel_type moment) (bel_pobj ?crossing1) (bel_pname isa) (bel_pval crossing))
    (ag_bel (bel_type moment) (bel_pobj ?yourcar) (bel_pname isa) (bel_pval car))
    (ag_bel (bel_type moment) (bel_pobj ?secondcar) (bel_pname isa) (bel_pval car))
    (ag_bel (bel_type moment) (bel_pobj ?yourcar) (bel_pname ison) (bel_pval ?road1))
    (ag_bel (bel_type moment) (bel_pobj ?secondcar) (bel_pname ison) (bel_pval ?road2))
    (ag_bel (bel_type moment) (bel_pobj ?yourcar) (bel_pname intention) (bel_pval ahead))
    (ag_bel (bel_type moment) (bel_pobj ?secondcar) (bel_pname intention) (bel_pval right))
    (ag_bel (bel_type moment) (bel_pobj ?crossing1) (bel_pname state) (bel_pval busy))
    (ag_bel (bel_type moment) (bel_pobj ?secondcar) (bel_pname proximity) (bel_pval 1))
    (ag_bel (bel_type moment) (bel_pobj ?crossing1) (bel_pname proximity) (bel_pval 2))
    (test (neq ?road1 ?road2))
    (test (neq ?yourcar ?secondcar))
=>
    (if (eq ?*ag-in-debug* TRUE) then (printout t "    <D>rscrcb vad a doua masina vrea " right " si trecerea " busy crlf))
    (retract ?f)
    (assert (ag_bel (bel_type moment) (bel_pname pressbreak-no-turn-maneuver) (bel_pval allowed)))
)

;--- Test 4: A doua masina vrea sa faca dreapta, iar trecerea este libera
(defrule AGENT::rscrce
    (timp (valoare ?t))
    ?f <- (ag_bel (bel_type moment) (bel_pname accelerate-no-turn-maneuver) (bel_pval prohibited))
    (ag_bel (bel_type moment) (bel_pobj ?inter) (bel_pname isa) (bel_pval intersection))
    (ag_bel (bel_type moment) (bel_pobj ?road1) (bel_pname partof) (bel_pval ?inter))
    (ag_bel (bel_type moment) (bel_pobj ?road2) (bel_pname partof) (bel_pval ?inter))
    (ag_bel (bel_type moment) (bel_pobj ?road2) (bel_pname state) (bel_pval busy))
    (ag_bel (bel_type moment) (bel_pobj ?crossing1) (bel_pname isa) (bel_pval crossing))
    (ag_bel (bel_type moment) (bel_pobj ?yourcar) (bel_pname isa) (bel_pval car))
    (ag_bel (bel_type moment) (bel_pobj ?secondcar) (bel_pname isa) (bel_pval car))
    (ag_bel (bel_type moment) (bel_pobj ?yourcar) (bel_pname ison) (bel_pval ?road1))
    (ag_bel (bel_type moment) (bel_pobj ?secondcar) (bel_pname ison) (bel_pval ?road2))
    (ag_bel (bel_type moment) (bel_pobj ?yourcar) (bel_pname intention) (bel_pval ahead))
    (ag_bel (bel_type moment) (bel_pobj ?secondcar) (bel_pname intention) (bel_pval right))
    (ag_bel (bel_type moment) (bel_pobj ?crossing1) (bel_pname state) (bel_pval empty))
    (ag_bel (bel_type moment) (bel_pobj ?secondcar) (bel_pname proximity) (bel_pval 1))
    (ag_bel (bel_type moment) (bel_pobj ?crossing1) (bel_pname proximity) (bel_pval 2))
    (test (neq ?road1 ?road2))
    (test (neq ?yourcar ?secondcar))
=>
    (if (eq ?*ag-in-debug* TRUE) then (printout t "    <D>rscrce vad a doua masina vrea " right " si trecerea " empty crlf))
    (retract ?f)
    (assert (ag_bel (bel_type moment) (bel_pname accelerate-no-turn-maneuverr) (bel_pval allowed)))
)

;--- Test 5: Nu exista a doua masina, iar trecerea este ocupata
(defrule AGENT::rnsccb
    (timp (valoare ?t))
    ?f <- (ag_bel (bel_type moment) (bel_pname wait-pressbreak-no-turn-maneuver) (bel_pval prohibited))
    (ag_bel (bel_type moment) (bel_pobj ?inter) (bel_pname isa) (bel_pval intersection))
    (ag_bel (bel_type moment) (bel_pobj ?road1) (bel_pname partof) (bel_pval ?inter))
    (ag_bel (bel_type moment) (bel_pobj ?road2) (bel_pname partof) (bel_pval ?inter))
    (ag_bel (bel_type moment) (bel_pobj ?road2) (bel_pname state) (bel_pval empty))
    (ag_bel (bel_type moment) (bel_pobj ?crossing1) (bel_pname isa) (bel_pval crossing))
    (ag_bel (bel_type moment) (bel_pobj ?yourcar) (bel_pname isa) (bel_pval car))
    (ag_bel (bel_type moment) (bel_pobj ?yourcar) (bel_pname ison) (bel_pval ?road1))
    (ag_bel (bel_type moment) (bel_pobj ?yourcar) (bel_pname intention) (bel_pval ahead))
    (ag_bel (bel_type moment) (bel_pobj ?crossing1) (bel_pname state) (bel_pval busy))
    (ag_bel (bel_type moment) (bel_pobj ?crossing1) (bel_pname proximity) (bel_pval 2))
    (test (neq ?road1 ?road2))
=>
    (if (eq ?*ag-in-debug* TRUE) then (printout t "    <D>rnsccb vad trecerea " busy crlf))
    (retract ?f)
    (assert (ag_bel (bel_type moment) (bel_pname wait-pressbreak-no-turn-maneuver) (bel_pval allowed)))
)

;;----------------------------------
;;
;;    Case 2: Schimbare banda pe autostrada pentru a permite intrarea unei masini de pe banda de accelerare
;;
;;----------------------------------

;--- Test 1: Sunt doar doua masini pe autostrada, masina ta e pe banda 1, cealalta e paralela cu a ta
(defrule AGENT::rcciscn
    (timp (valoare ?t))
    ?f <- (ag_bel (bel_type moment) (bel_pname accelerate-turn-left-maneuver) (bel_pval prohibited))
    (ag_bel (bel_type moment) (bel_pobj ?lane1) (bel_pname isa) (bel_pval lane))
    (ag_bel (bel_type moment) (bel_pobj ?lane2) (bel_pname isa) (bel_pval lane))
    (ag_bel (bel_type moment) (bel_pobj ?accelerationlane) (bel_pname isa) (bel_pval lane))
    (ag_bel (bel_type moment) (bel_pobj ?lane1) (bel_pname number) (bel_pval one))
    (ag_bel (bel_type moment) (bel_pobj ?lane2) (bel_pname number) (bel_pval two))
    (ag_bel (bel_type moment) (bel_pobj ?lane1) (bel_pname state) (bel_pval busy))
    (ag_bel (bel_type moment) (bel_pobj ?lane2) (bel_pname state) (bel_pval empty))
    (ag_bel (bel_type moment) (bel_pobj ?yourcar) (bel_pname isa) (bel_pval car))
    (ag_bel (bel_type moment) (bel_pobj ?secondcar) (bel_pname isa) (bel_pval car))
    (ag_bel (bel_type moment) (bel_pobj ?yourcar) (bel_pname ison) (bel_pval ?lane1))
    (ag_bel (bel_type moment) (bel_pobj ?secondcar) (bel_pname ison) (bel_pval ?accelerationlane))
    (ag_bel (bel_type moment) (bel_pobj ?secondcar) (bel_pname proximity) (bel_pval 0))
    (test (neq ?lane1 ?lane2))
    (test (neq ?lane2 ?accelerationlane))
    (test (neq ?yourcar ?secondcar))
=>
    (if (eq ?*ag-in-debug* TRUE) then (printout t "    <D>rcciscn sunt pe " ?lane1 " si vad a doua masina aproape" crlf))
    (retract ?f)
    (assert (ag_bel (bel_type moment) (bel_pname accelerate-turn-left-maneuver) (bel_pval allowed)))
)

;--- Test 2: Sunt doar doua masini pe autostrada, masina ta e pe banda 1, cealalta e mai in spate
(defrule AGENT::rcciscf
    (timp (valoare ?t))
    ?f <- (ag_bel (bel_type moment) (bel_pname accelerate-no-turn-maneuver) (bel_pval prohibited))
    (ag_bel (bel_type moment) (bel_pobj ?lane1) (bel_pname isa) (bel_pval lane))
    (ag_bel (bel_type moment) (bel_pobj ?lane2) (bel_pname isa) (bel_pval lane))
    (ag_bel (bel_type moment) (bel_pobj ?accelerationlane) (bel_pname isa) (bel_pval lane))
    (ag_bel (bel_type moment) (bel_pobj ?lane1) (bel_pname number) (bel_pval one))
    (ag_bel (bel_type moment) (bel_pobj ?lane2) (bel_pname number) (bel_pval two))
    (ag_bel (bel_type moment) (bel_pobj ?lane1) (bel_pname state) (bel_pval busy))
    (ag_bel (bel_type moment) (bel_pobj ?lane2) (bel_pname state) (bel_pval empty))
    (ag_bel (bel_type moment) (bel_pobj ?yourcar) (bel_pname isa) (bel_pval car))
    (ag_bel (bel_type moment) (bel_pobj ?secondcar) (bel_pname isa) (bel_pval car))
    (ag_bel (bel_type moment) (bel_pobj ?yourcar) (bel_pname ison) (bel_pval ?lane1))
    (ag_bel (bel_type moment) (bel_pobj ?secondcar) (bel_pname ison) (bel_pval ?accelerationlane))
    (ag_bel (bel_type moment) (bel_pobj ?secondcar) (bel_pname proximity) (bel_pval 1))
    (test (neq ?lane1 ?lane2))
    (test (neq ?lane2 ?accelerationlane))
    (test (neq ?yourcar ?secondcar))
=>
    (if (eq ?*ag-in-debug* TRUE) then (printout t "    <D>rcciscf sunt pe " ?lane1 " si vad a doua masina departe" crlf))
    (retract ?f)
    (assert (ag_bel (bel_type moment) (bel_pname accelerate-no-turn-maneuver) (bel_pval allowed)))
)

;--- Test 3: Sunt trei masini pe autostrada, masina ta e pe banda 1, celelalte merg in paralel cu a ta
(defrule AGENT::rccci
    (timp (valoare ?t))
    ?f <- (ag_bel (bel_type moment) (bel_pname accelerate-no-turn-maneuver) (bel_pval prohibited))
    (ag_bel (bel_type moment) (bel_pobj ?lane1) (bel_pname isa) (bel_pval lane))
    (ag_bel (bel_type moment) (bel_pobj ?lane2) (bel_pname isa) (bel_pval lane))
    (ag_bel (bel_type moment) (bel_pobj ?accelerationlane) (bel_pname isa) (bel_pval lane))
    (ag_bel (bel_type moment) (bel_pobj ?lane1) (bel_pname number) (bel_pval one))
    (ag_bel (bel_type moment) (bel_pobj ?lane2) (bel_pname number) (bel_pval two))
    (ag_bel (bel_type moment) (bel_pobj ?lane1) (bel_pname state) (bel_pval busy))
    (ag_bel (bel_type moment) (bel_pobj ?lane2) (bel_pname state) (bel_pval busy))
    (ag_bel (bel_type moment) (bel_pobj ?yourcar) (bel_pname isa) (bel_pval car))
    (ag_bel (bel_type moment) (bel_pobj ?secondcar) (bel_pname isa) (bel_pval car))
    (ag_bel (bel_type moment) (bel_pobj ?thirdcar) (bel_pname isa) (bel_pval car))
    (ag_bel (bel_type moment) (bel_pobj ?yourcar) (bel_pname ison) (bel_pval ?lane1))
    (ag_bel (bel_type moment) (bel_pobj ?secondcar) (bel_pname ison) (bel_pval ?accelerationlane))
    (ag_bel (bel_type moment) (bel_pobj ?thirdcar) (bel_pname ison) (bel_pval ?lane2))
    (ag_bel (bel_type moment) (bel_pobj ?secondcar) (bel_pname proximity) (bel_pval 0))
    (ag_bel (bel_type moment) (bel_pobj ?thirdcar) (bel_pname proximity) (bel_pval 0))
    (test (neq ?lane1 ?lane2))
    (test (neq ?lane2 ?accelerationlane))
    (test (neq ?yourcar ?secondcar))
    (test (neq ?yourcar ?thirdcar))
=>
    (if (eq ?*ag-in-debug* TRUE) then (printout t "    <D>rccci sunt pe " ?lane1 " si vad doua masini" crlf))
    (retract ?f)
    (assert (ag_bel (bel_type moment) (bel_pname accelerate-no-turn-maneuver) (bel_pval allowed)))
)

;--- Test 4: Sunt doar doua masini pe autostrada, masina ta e pe banda 2, cealalta e paralela cu a ta
(defrule AGENT::rcciiscn
    (timp (valoare ?t))
    ?f <- (ag_bel (bel_type moment) (bel_pname accelerate-no-turn-maneuver) (bel_pval prohibited))
    (ag_bel (bel_type moment) (bel_pobj ?lane1) (bel_pname isa) (bel_pval lane))
    (ag_bel (bel_type moment) (bel_pobj ?lane2) (bel_pname isa) (bel_pval lane))
    (ag_bel (bel_type moment) (bel_pobj ?accelerationlane) (bel_pname isa) (bel_pval lane))
    (ag_bel (bel_type moment) (bel_pobj ?lane1) (bel_pname number) (bel_pval one))
    (ag_bel (bel_type moment) (bel_pobj ?lane2) (bel_pname number) (bel_pval two))
    (ag_bel (bel_type moment) (bel_pobj ?lane1) (bel_pname state) (bel_pval empty))
    (ag_bel (bel_type moment) (bel_pobj ?lane2) (bel_pname state) (bel_pval busy))
    (ag_bel (bel_type moment) (bel_pobj ?yourcar) (bel_pname isa) (bel_pval car))
    (ag_bel (bel_type moment) (bel_pobj ?secondcar) (bel_pname isa) (bel_pval car))
    (ag_bel (bel_type moment) (bel_pobj ?yourcar) (bel_pname ison) (bel_pval ?lane2))
    (ag_bel (bel_type moment) (bel_pobj ?secondcar) (bel_pname ison) (bel_pval ?accelerationlane))
    (ag_bel (bel_type moment) (bel_pobj ?secondcar) (bel_pname proximity) (bel_pval 0))
    (test (neq ?lane1 ?lane2))
    (test (neq ?lane2 ?accelerationlane))
    (test (neq ?yourcar ?secondcar))
=>
    (if (eq ?*ag-in-debug* TRUE) then (printout t "    <D>rcciiscn sunt pe " ?lane2 " si vad a doua masina intrand" crlf))
    (retract ?f)
    (assert (ag_bel (bel_type moment) (bel_pname accelerate-no-turn-maneuver) (bel_pval allowed)))
)

;;----------------------------------
;;
;;    Case 3: Avem in fata semafor rosu si de pe banda opusa vine o masina care doreste sa ocupe un loc de parcare in dreapta noastra
;;
;;----------------------------------

;--- Test 1: Semafor rosu, masina semnalizeaza stanga, locul detectat
(defrule AGENT::rsrclp
    (timp (valoare ?t))
    ?f <- (ag_bel (bel_type moment) (bel_pname pressbreak-no-turn-maneuver) (bel_pval prohibited))
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
    (test (neq ?yourcar ?secondcar))
=>
    (if (eq ?*ag-in-debug* TRUE) then (printout t "    <D>rsrclp vad a doua masina vrea " left " si semafor " red " si parcare " parking crlf))
    (retract ?f)
    (assert (ag_bel (bel_type moment) (bel_pname pressbreak-no-turn-maneuver) (bel_pval allowed)))
)

;--- Test 2: Semafor verde, masina semnalizeaza stanga, locul detectat
(defrule AGENT::rsgclp
    (timp (valoare ?t))
    ?f <- (ag_bel (bel_type moment) (bel_pname accelerate-no-turn-maneuver) (bel_pval prohibited))
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
    (test (neq ?yourcar ?secondcar))
=>
    (if (eq ?*ag-in-debug* TRUE) then (printout t "    <D>rsgclp vad a doua masina vrea " left " si semafor " green " si parcare " parking crlf))
    (retract ?f)
    (assert (ag_bel (bel_type moment) (bel_pname accelerate-no-turn-maneuver) (bel_pval allowed)))
)

;--- Test 3: Semafor rosu, masina nu semnalizeaza, locul detectat
(defrule AGENT::rsrcap
    (timp (valoare ?t))
    ?f <- (ag_bel (bel_type moment) (bel_pname wait-pressbreak-no-turn-maneuver) (bel_pval prohibited))
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
    (test (neq ?yourcar ?secondcar))
=>
    (if (eq ?*ag-in-debug* TRUE) then (printout t "    <D>rsrcap vad a doua masina vrea " ahead " si semafor " red " si parcare " parking crlf))
    (retract ?f)
    (assert (ag_bel (bel_type moment) (bel_pname wait-pressbreak-no-turn-maneuver) (bel_pval allowed)))
)

;--- Test 4: Semafor verde, masina nu semnalizeaza, locul detectat
(defrule AGENT::rsgcap
    (timp (valoare ?t))
    ?f <- (ag_bel (bel_type moment) (bel_pname accelerate-no-turn-maneuver) (bel_pval prohibited))
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
    (test (neq ?yourcar ?secondcar))
=>
    (if (eq ?*ag-in-debug* TRUE) then (printout t "    <D>rsgcap vad a doua masina vrea " ahead " si semafor " green " si parcare " parking crlf))
    (retract ?f)
    (assert (ag_bel (bel_type moment) (bel_pname accelerate-no-turn-maneuver) (bel_pval allowed)))
)

;;----------------------------------
;;
;;    Case 4: Unificare a 2 benzi pe acelasi sens de mers, automobilul nostru e pe banda prioritara
;;
;;----------------------------------

;--- Test 1: O masina pe banda care se uneste, paralela cu a ta
(defrule AGENT::rcn
    (timp (valoare ?t))
    ?f <- (ag_bel (bel_type moment) (bel_pname pressbreak-wait-accelerate-no-turn-maneuver) (bel_pval prohibited))
    (ag_bel (bel_type moment) (bel_pobj ?lane1) (bel_pname isa) (bel_pval lane))
    (ag_bel (bel_type moment) (bel_pobj ?lane2) (bel_pname isa) (bel_pval lane))
    (ag_bel (bel_type moment) (bel_pobj ?lane1) (bel_pname nocars) (bel_pval one))
    (ag_bel (bel_type moment) (bel_pobj ?yourcar) (bel_pname isa) (bel_pval car))
    (ag_bel (bel_type moment) (bel_pobj ?secondcar) (bel_pname isa) (bel_pval car))
    (ag_bel (bel_type moment) (bel_pobj ?yourcar) (bel_pname ison) (bel_pval ?lane2))
    (ag_bel (bel_type moment) (bel_pobj ?secondcar) (bel_pname ison) (bel_pval ?lane1))
    (ag_bel (bel_type moment) (bel_pobj ?secondcar) (bel_pname proximity) (bel_pval 0))
    (ag_bel (bel_type moment) (bel_pobj ?lane1) (bel_pname priority) (bel_pval low))
    (ag_bel (bel_type moment) (bel_pobj ?lane2) (bel_pname priority) (bel_pval high))
    (ag_bel (bel_type moment) (bel_pobj ?lane1) (bel_pname continues) (bel_pval no))
    (ag_bel (bel_type moment) (bel_pobj ?lane2) (bel_pname continues) (bel_pval yes))
    (test (neq ?lane1 ?lane2))
    (test (neq ?yourcar ?secondcar))
=>
    (if (eq ?*ag-in-debug* TRUE) then (printout t "    <D>rcn vad a doua masina aproape" crlf))
    (retract ?f)
    (assert (ag_bel (bel_type moment) (bel_pname pressbreak-wait-accelerate-no-turn-maneuver) (bel_pval allowed)))
)

;--- Test 2: O masina pe banda care se uneste, mai in spate
(defrule AGENT::rcf
    (timp (valoare ?t))
    ?f <- (ag_bel (bel_type moment) (bel_pname accelerate-no-turn-maneuver) (bel_pval prohibited))
    (ag_bel (bel_type moment) (bel_pobj ?lane1) (bel_pname isa) (bel_pval lane))
    (ag_bel (bel_type moment) (bel_pobj ?lane2) (bel_pname isa) (bel_pval lane))
    (ag_bel (bel_type moment) (bel_pobj ?lane1) (bel_pname nocars) (bel_pval one))
    (ag_bel (bel_type moment) (bel_pobj ?yourcar) (bel_pname isa) (bel_pval car))
    (ag_bel (bel_type moment) (bel_pobj ?secondcar) (bel_pname isa) (bel_pval car))
    (ag_bel (bel_type moment) (bel_pobj ?yourcar) (bel_pname ison) (bel_pval ?lane2))
    (ag_bel (bel_type moment) (bel_pobj ?secondcar) (bel_pname ison) (bel_pval ?lane1))
    (ag_bel (bel_type moment) (bel_pobj ?secondcar) (bel_pname proximity) (bel_pval 1))
    (ag_bel (bel_type moment) (bel_pobj ?lane1) (bel_pname priority) (bel_pval low))
    (ag_bel (bel_type moment) (bel_pobj ?lane2) (bel_pname priority) (bel_pval high))
    (ag_bel (bel_type moment) (bel_pobj ?lane1) (bel_pname continues) (bel_pval no))
    (ag_bel (bel_type moment) (bel_pobj ?lane2) (bel_pname continues) (bel_pval yes))
    (test (neq ?lane1 ?lane2))
    (test (neq ?yourcar ?secondcar))
=>
    (if (eq ?*ag-in-debug* TRUE) then (printout t "    <D>rcf vad a doua masina departe" crlf))
    (retract ?f)
    (assert (ag_bel (bel_type moment) (bel_pname accelerate-no-turn-maneuver) (bel_pval allowed)))
)

;--- Test 3: Doua masini pe banda care se uneste, prima e paralela cu a ta, a doua mai in spate
(defrule AGENT::rscntcf
    (timp (valoare ?t))
    ?f <- (ag_bel (bel_type moment) (bel_pname pressbreak-wait-accelerate-no-turn-maneuver) (bel_pval prohibited))
    (ag_bel (bel_type moment) (bel_pobj ?lane1) (bel_pname isa) (bel_pval lane))
    (ag_bel (bel_type moment) (bel_pobj ?lane2) (bel_pname isa) (bel_pval lane))
    (ag_bel (bel_type moment) (bel_pobj ?lane1) (bel_pname nocars) (bel_pval two))
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
    (test (neq ?lane1 ?lane2))
    (test (neq ?yourcar ?secondcar))
    (test (neq ?yourcar ?thirdcar))
=>
    (if (eq ?*ag-in-debug* TRUE) then (printout t "    <D>rscntcf vad doua masini" crlf))
    (retract ?f)
    (assert (ag_bel (bel_type moment) (bel_pname pressbreak-wait-accelerate-no-turn-maneuver) (bel_pval allowed)))
)

;;----------------------------------
;;
;;    Case 5: Automobilul face loc unui alt automobil angajat in depasire care vine din sens opus
;;
;;----------------------------------

;--- Test 1: Detectam doua masini, una ce vine in depasire spre noi pe banda noastra, aproape de noi
(defrule AGENT::rscon
    (timp (valoare ?t))
    ?f <- (ag_bel (bel_type moment) (bel_pname pressbreak-turn-right-maneuver) (bel_pval prohibited))
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
    (test (neq ?lane1 ?lane2))
    (test (neq ?yourcar ?secondcar))
    (test (neq ?yourcar ?thirdcar))
=>
    (if (eq ?*ag-in-debug* TRUE) then (printout t "    <D>rscon vad a doua masina in depasire apropiindu-se" crlf))
    (retract ?f)
    (assert (ag_bel (bel_type moment) (bel_pname pressbreak-turn-right-maneuver) (bel_pval allowed)))
)

;--- Test 2: Detectam doua masini, una ce vine in depasire spre noi pe banda noastra, destul de departe
(defrule AGENT::rscof
    (timp (valoare ?t))
    ?f <- (ag_bel (bel_type moment) (bel_pname pressbreak-no-turn-maneuver) (bel_pval prohibited))
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
    (test (neq ?lane1 ?lane2))
    (test (neq ?yourcar ?secondcar))
    (test (neq ?yourcar ?thirdcar))
=>
    (if (eq ?*ag-in-debug* TRUE) then (printout t "    <D>rscof vad a doua masina in depasire, suficient de departe" crlf))
    (retract ?f)
    (assert (ag_bel (bel_type moment) (bel_pname pressbreak-no-turn-maneuver) (bel_pval allowed)))
)

;--- Test 3: Detectam doua masini, niciuna nu e in depasire
(defrule AGENT::rccon
    (timp (valoare ?t))
    ?f <- (ag_bel (bel_type moment) (bel_pname accelerate-no-turn-maneuver) (bel_pval prohibited))
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
    (test (neq ?lane1 ?lane2))
    (test (neq ?yourcar ?secondcar))
    (test (neq ?yourcar ?thirdcar))
=>
    (if (eq ?*ag-in-debug* TRUE) then (printout t "    <D>rccon vad doua masini, niciuna nu depaseste" crlf))
    (retract ?f)
    (assert (ag_bel (bel_type moment) (bel_pname accelerate-no-turn-maneuver) (bel_pval allowed)))
)

;;----------------------------------
;;
;;    Case 6: Stropire pietoni
;;
;;----------------------------------

;--- Test 1: Detectam balta pe banda noastra langa pietoni, o singura banda pe sens
(defrule AGENT::rlpnb
    (timp (valoare ?t))
    ?f <- (ag_bel (bel_type moment) (bel_pname pressbreak-no-turn-maneuver) (bel_pval prohibited))
    (ag_bel (bel_type moment) (bel_pobj ?lane1) (bel_pname isa) (bel_pval lane))
    (ag_bel (bel_type moment) (bel_pobj ?lane2) (bel_pname isa) (bel_pval lane))
    (ag_bel (bel_type moment) (bel_pobj ?lane1) (bel_pname direction) (bel_pval ahead))
    (ag_bel (bel_type moment) (bel_pobj ?lane2) (bel_pname direction) (bel_pval behind))
    (ag_bel (bel_type moment) (bel_pobj ?yourcar) (bel_pname isa) (bel_pval car))
    (ag_bel (bel_type moment) (bel_pobj ?yourcar) (bel_pname ison) (bel_pval ?lane1))
    (ag_bel (bel_type moment) (bel_pobj ?puddle) (bel_pname partof) (bel_pval ?lane1))
    (ag_bel (bel_type moment) (bel_pobj ?bystanders) (bel_pname isa) (bel_pval condition))
    (ag_bel (bel_type moment) (bel_pobj ?puddle) (bel_pname near) (bel_pval ?bystanders))
    (test (neq ?lane1 ?lane2))
=>
    (if (eq ?*ag-in-debug* TRUE) then (printout t "    <D>rlpnb vad balta langa " ?bystanders ", o banda pe sens" crlf))
    (retract ?f)
    (assert (ag_bel (bel_type moment) (bel_pname pressbreak-no-turn-maneuver) (bel_pval allowed)))
)

;--- Test 2: Detectam balta pe banda noastra langa pietoni, doua benzi pe sens
(defrule AGENT::rllpanb
    (timp (valoare ?t))
    ?f <- (ag_bel (bel_type moment) (bel_pname accelerate-turn-left-maneuver) (bel_pval prohibited))
    (ag_bel (bel_type moment) (bel_pobj ?lane1) (bel_pname isa) (bel_pval lane))
    (ag_bel (bel_type moment) (bel_pobj ?lane2) (bel_pname isa) (bel_pval lane))
    (ag_bel (bel_type moment) (bel_pobj ?lane1) (bel_pname direction) (bel_pval ahead))
    (ag_bel (bel_type moment) (bel_pobj ?lane2) (bel_pname direction) (bel_pval ahead))
    (ag_bel (bel_type moment) (bel_pobj ?yourcar) (bel_pname isa) (bel_pval car))
    (ag_bel (bel_type moment) (bel_pobj ?yourcar) (bel_pname ison) (bel_pval ?lane1))
    (ag_bel (bel_type moment) (bel_pobj ?puddle) (bel_pname partof) (bel_pval ?lane1))
    (ag_bel (bel_type moment) (bel_pobj ?bystanders) (bel_pname isa) (bel_pval condition))
    (ag_bel (bel_type moment) (bel_pobj ?puddle) (bel_pname near) (bel_pval ?bystanders))
    (test (neq ?lane1 ?lane2))
=>
    (if (eq ?*ag-in-debug* TRUE) then (printout t "    <D>rllpanb vad balta pe propria banda langa " ?bystanders ", doua benzi pe sens" crlf))
    (retract ?f)
    (assert (ag_bel (bel_type moment) (bel_pname accelerate-turn-left-maneuver) (bel_pval allowed)))
)

;--- Test 3: Detectam balta pe cealalta banda langa pietoni, doua benzi pe sens
(defrule AGENT::rllpnanb
    (timp (valoare ?t))
    ?f <- (ag_bel (bel_type moment) (bel_pname accelerate-no-turn-maneuver) (bel_pval prohibited))
    (ag_bel (bel_type moment) (bel_pobj ?lane1) (bel_pname isa) (bel_pval lane))
    (ag_bel (bel_type moment) (bel_pobj ?lane2) (bel_pname isa) (bel_pval lane))
    (ag_bel (bel_type moment) (bel_pobj ?lane1) (bel_pname direction) (bel_pval ahead))
    (ag_bel (bel_type moment) (bel_pobj ?lane2) (bel_pname direction) (bel_pval ahead))
    (ag_bel (bel_type moment) (bel_pobj ?yourcar) (bel_pname isa) (bel_pval car))
    (ag_bel (bel_type moment) (bel_pobj ?yourcar) (bel_pname ison) (bel_pval ?lane2))
    (ag_bel (bel_type moment) (bel_pobj ?puddle) (bel_pname partof) (bel_pval ?lane1))
    (ag_bel (bel_type moment) (bel_pobj ?bystanders) (bel_pname isa) (bel_pval condition))
    (ag_bel (bel_type moment) (bel_pobj ?puddle) (bel_pname near) (bel_pval ?bystanders))
    (test (neq ?lane1 ?lane2))
=>
    (if (eq ?*ag-in-debug* TRUE) then (printout t "    <D>rllpnanb vad balta pe cealalta banda langa " ?bystanders ", doua benzi pe sens" crlf))
    (retract ?f)
    (assert (ag_bel (bel_type moment) (bel_pname accelerate-no-turn-maneuver) (bel_pval allowed)))
)

;--- Test 4: Detectam balta pe banda noastra, dar nu e langa nimic, doua benzi pe sens
(defrule AGENT::rllpann
    (timp (valoare ?t))
    ?f <- (ag_bel (bel_type moment) (bel_pname accelerate-no-turn-maneuver) (bel_pval prohibited))
    (ag_bel (bel_type moment) (bel_pobj ?lane1) (bel_pname isa) (bel_pval lane))
    (ag_bel (bel_type moment) (bel_pobj ?lane2) (bel_pname isa) (bel_pval lane))
    (ag_bel (bel_type moment) (bel_pobj ?lane1) (bel_pname direction) (bel_pval ahead))
    (ag_bel (bel_type moment) (bel_pobj ?lane2) (bel_pname direction) (bel_pval ahead))
    (ag_bel (bel_type moment) (bel_pobj ?yourcar) (bel_pname isa) (bel_pval car))
    (ag_bel (bel_type moment) (bel_pobj ?yourcar) (bel_pname ison) (bel_pval ?lane1))
    (ag_bel (bel_type moment) (bel_pobj ?puddle) (bel_pname partof) (bel_pval ?lane1))
    (ag_bel (bel_type moment) (bel_pobj ?puddle) (bel_pname near) (bel_pval nothing))
    (test (neq ?lane1 ?lane2))
=>
    (if (eq ?*ag-in-debug* TRUE) then (printout t "    <D>rllpann vad balta pe propria banda lang " nothing ", doua benzi pe sens" crlf))
    (retract ?f)
    (assert (ag_bel (bel_type moment) (bel_pname accelerate-no-turn-maneuver) (bel_pval allowed)))
)
