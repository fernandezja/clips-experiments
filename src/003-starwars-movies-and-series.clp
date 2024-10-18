(deftemplate es-una-historia-de-starwars
    (slot nombre)
    (slot es-starwars))

(deftemplate es-pelicula
    (slot nombre)
    (slot relacionado-starwars)
)

(deftemplate es-serie
    (slot nombre)
    (slot relacionado-starwars)
)



; Hechos
(deffacts initial-facts
    (es-pelicula (nombre EpisodioIV) (relacionado-starwars si))
    (rule-1 "Es una pelicula")

    (es-pelicula (nombre HanSolo) (relacionado-starwars si))
    (rule-1 "Es una pelicula")

    (es-serie (nombre Avengers) (relacionado-starwars no))
    (rule-1 "Es una pelicula")

    (es-serie (nombre Ahsoka) (relacionado-starwars si))
    (rule-1 "Es una serie")

    (es-serie (nombre Loki) (relacionado-starwars no))
    (rule-1 "Es una serie")   
)






; Reglas
(defrule pelicula-es-historia-starwars
    (es-pelicula (nombre ?value) (relacionado-starwars si))
    (rule-1 "Es una pelicula")
    =>
    (assert (es-una-historia-de-starwars (nombre ?value) (es-starwars si)))
    (printout t ?value " es una pelicula historia de Starwars." crlf))


(defrule serie-es-historia-starwars
    (es-serie (nombre ?value) (relacionado-starwars si))
    (rule-1 "Es una serie")
    =>
    (assert (es-una-historia-de-starwars (nombre ?value) (es-starwars si)))
    (printout t ?value " es una serie de historia de Starwars." crlf))




(defrule me-gustaria-mirarla
    (es-una-historia-de-starwars (nombre ?value) (es-starwars si))
    =>
    (printout t "Entonces, " ?value " me gustaria mirarla." crlf))