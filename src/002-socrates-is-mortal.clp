(deftemplate person
    (slot name)
    (slot mortal))

(deftemplate is-human
    (slot name))

; Facts
(deffacts initial-facts
    (is-human (name Socrates))
    (rule-1 "All humans are mortal"))

; Rules
(defrule human-mortality
    (is-human (name ?name))
    (rule-1 "All humans are mortal")
    =>
    (assert (person (name ?name) (mortal yes)))
    (printout t ?name " is mortal because all humans are mortal." crlf))

(defrule show-conclusion
    (person (name ?name) (mortal yes))
    =>
    (printout t "Therefore, " ?name " is mortal." crlf))