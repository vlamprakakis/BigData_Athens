[QueryGroup="test"] @collection [[
[QueryItem="1"]
PREFIX : <http://www.semanticweb.org/aueb/cityontology/athens#>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>

SELECT ?p WHERE {
   ?p a :recycling .
}

[QueryItem="2"]
PREFIX : <http://www.semanticweb.org/aueb/cityontology/athens#>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>

SELECT ?p WHERE {
   ?p a :CleaningService .
}

[QueryItem="3"]
PREFIX : <http://www.semanticweb.org/aueb/cityontology/athens#>
PREFIX obda: <https://w3id.org/obda/vocabulary#>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>


SELECT * WHERE {
   ?p a :e-requestPlatform; 
:hasperiohistreet ?hasperiohistreet .
}

[QueryItem="4"]
PREFIX : <http://www.semanticweb.org/aueb/cityontology/athens#>
PREFIX obda: <https://w3id.org/obda/vocabulary#>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>


SELECT * WHERE {
    ?p a :e-requestPlatform;
:hasaitimaperigrafi ?hasaitimaperigrafi; 
:hasperiohistreet ?hasperiohistreet; 
:hasaitimakatigoria ?hasaitimakatigoria .
}

[QueryItem="waste1"]
PREFIX : <http://www.semanticweb.org/aueb/cityontology/athens#>
PREFIX obda: <https://w3id.org/obda/vocabulary#>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>


SELECT * WHERE {
    ?p a :CleaningService;
:hasArithmosKadwn ?hasArithmosKadwn;
:hasProgramma ?hasProgramma;
:hasDimotEnot ?hasDimotEnot .
}

[QueryItem="waste2"]
PREFIX : <http://www.semanticweb.org/aueb/cityontology/athens#>
PREFIX obda: <https://w3id.org/obda/vocabulary#>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>


SELECT * WHERE {
    ?p a :recycling;
:hasArithmosKadwn ?hasArithmosKadwn;
:hasProgramma ?hasProgramma;
:hasDimotEnot ?hasDimotEnot .
}

[QueryItem="waste3"]
PREFIX : <http://www.semanticweb.org/aueb/cityontology/athens#>
PREFIX obda: <https://w3id.org/obda/vocabulary#>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>


SELECT * WHERE {
    ?p a :nonRecycling;
:hasArithmosKadwn ?hasArithmosKadwn;
:hasProgramma ?hasProgramma;
:hasDimotEnot ?hasDimotEnot .
}

[QueryItem="e-request"]
PREFIX : <http://www.semanticweb.org/aueb/cityontology/athens#>
PREFIX obda: <https://w3id.org/obda/vocabulary#>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>


SELECT ?p ?hasaitimaperigrafi WHERE {
    ?p a :e-requestPlatform;
:hasaitimaperigrafi ?hasaitimaperigrafi .
}

[QueryItem="e-request2"]
PREFIX : <http://www.semanticweb.org/aueb/cityontology/athens#>
PREFIX obda: <https://w3id.org/obda/vocabulary#>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>


SELECT  ?p ?hasperiohistreet WHERE {
    ?p a :e-requestPlatform;
:hasperiohistreet ?hasperiohistreet .
FILTER (?hasperiohistreet ="ΑΧΑΡΝΩΝ"^^xsd:string) 
}

[QueryItem="waste4"]
PREFIX : <http://www.semanticweb.org/aueb/cityontology/athens#>
PREFIX obda: <https://w3id.org/obda/vocabulary#>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>


SELECT  * WHERE {
    ?p a :nonRecycling;
:hasArithmosKadwn ?hasArithmosKadwn;
:hasProgramma ?hasProgramma;
:hasDimotEnot ?hasDimotEnot;
:hasOdos ?hasOdos .
FILTER (?hasArithmosKadwn >= "40") 
}
]]

[QueryGroup="BigCivicData"] @collection [[
[QueryItem="CityAdmin"]
PREFIX : <http://www.semanticweb.org/aueb/cityontology/athens#>
PREFIX obda: <https://w3id.org/obda/vocabulary#>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>


SELECT ?p ?hasMonada WHERE {
    ?p a :CityAdministration;
:hasMonada ?hasMonada .
}

[QueryItem="postgraduates"]
PREFIX : <http://www.semanticweb.org/aueb/cityontology/athens#>
PREFIX obda: <https://w3id.org/obda/vocabulary#>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>


SELECT ?p WHERE{
    ?p a :postGraduate .
}

[QueryItem="kadoi_parapona pou aforoun sygkekrimeni odo"]
PREFIX : <http://www.semanticweb.org/aueb/cityontology/athens#>
PREFIX obda: <https://w3id.org/obda/vocabulary#>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>


SELECT ?hasArithmosKadwn  
 WHERE {
?p a :CityService;
:hasArithmosKadwn ?hasArithmosKadwn;
:hasOdos ?hasOdos;
:hasOdos ?hasperiohistreet .
FILTER (?hasperiohistreet="ΑΧΑΡΝΩΝ"^^xsd:string)
}

[QueryItem="low temperature and pollution"]
PREFIX : <http://www.semanticweb.org/aueb/cityontology/athens#>
PREFIX obda: <https://w3id.org/obda/vocabulary#>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>


SELECT  ?hasTimiRypou ?hasMeanTemperature WHERE {
    ?p a :Sensor;
:hasTimiRypou ?hasTimiRypou;
:hasMeanTemperature ?hasMeanTemperature;
:hasWeatherDate ?hasWeatherDate;
:hasDateRypou ?hasWeatherDate .
FILTER (?hasWeatherDate="2016-12-31"^^xsd:date)
}

[QueryItem="temperature and pollution"]
PREFIX : <http://www.semanticweb.org/aueb/cityontology/athens#>
PREFIX obda: <https://w3id.org/obda/vocabulary#>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>


SELECT  ?hasMeanTemperature  ?hasTimiRypou  ?hasKatigoriaRypou WHERE {
    {?p a :Sensor; :hasMeanTemperature ?hasMeanTemperature .
 ?p a :Sensor; :hasWeatherDate "2016-12-31"^^xsd:date .}
UNION
{?p a :Sensor; :hasTimiRypou ?hasTimiRypou .
?p a :Sensor; :hasDateRypou "2016-12-31"^^xsd:date .
?p a :Sensor; :hasKatigoriaRypou ?hasKatigoriaRypou .
?p a :Sensor; :hasDateRypou "2016-12-31"^^xsd:date .}
}

[QueryItem="kadoi se parapona pou aforoun AXARNWN"]
PREFIX : <http://www.semanticweb.org/aueb/cityontology/athens#>
PREFIX obda: <https://w3id.org/obda/vocabulary#>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>


SELECT  ?hasArithmosKadwn  ?hasaitimaperigrafi WHERE {
    {?p a :CityService; :hasArithmosKadwn ?hasArithmosKadwn .
  ?p a :CityService; :hasOdos "ΑΧΑΡΝΩΝ"^^xsd:string .}
UNION
{ ?p a :CityService; :hasaitimaperigrafi ?hasaitimaperigrafi.
?p a :CityService; :hasperiohistreet  "ΑΧΑΡΝΩΝ"^^xsd:string .}
}

[QueryItem="HR vs E-request"]
PREFIX : <http://www.semanticweb.org/aueb/cityontology/athens#>
PREFIX obda: <https://w3id.org/obda/vocabulary#>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>


SELECT  ?hasEidikotita  ?hasMonada WHERE {
    ?p a :CityAdministration; :hasEidikotita ?hasEidikotita .
?p a :CityAdministration; :hasMonada  ?hasMonada .
}

[QueryItem="e-request_Ypiresia"]
PREFIX : <http://www.semanticweb.org/aueb/cityontology/athens#>
PREFIX obda: <https://w3id.org/obda/vocabulary#>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>


SELECT  ?hasSimeio  WHERE {
    ?p a :CityAdministration; :hasSimeio ?hasSimeio.
FILTER regex (?hasSimeio,"^10")
}

[QueryItem="police vs citizen report (odos)"]
PREFIX : <http://www.semanticweb.org/aueb/cityontology/athens#>
PREFIX obda: <https://w3id.org/obda/vocabulary#>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>


SELECT  * WHERE { 
{?p a :CityService; :hasSimeio ?hasSimeio .
FILTER (?hasSimeio="3ΗΣ ΣΕΠΤΕΜΒΡΙΟΥ "^^xsd:string)}
UNION
{?p a :CityService; :hasaitimaperigrafi ?hasaitimaperigrafi .
?p a :CityService; :hasperiohistreet ?hasperiohistreet .
FILTER (?hasperiohistreet="3ΗΣ ΣΕΠΤΕΜΒΡΙΟΥ"^^xsd:string)}
}

[QueryItem="citizenreport vs GISfotismos"]
PREFIX : <http://www.semanticweb.org/aueb/cityontology/athens#>
PREFIX obda: <https://w3id.org/obda/vocabulary#>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>


SELECT  * WHERE { 
{?p a :FunctionCivic; :hasSimeioLamptira ?hasSimeioLamptira .
  ?p a :FunctionCivic; :hasKatastasiLamptira ?hasKatastasiLamptira .
FILTER (?hasSimeioLamptira="ΙΠΠΟΚΡΑΤΟΥΣ"^^xsd:string && (?hasKatastasiLamptira="ΟΛΙΚΩΣ ΚΑΤΕΣΤΡΑΜΜΕΝΟ"^^xsd:string))}
UNION
{?p a :FunctionCivic; :hasaitimaperigrafi ?hasaitimaperigrafi .
?p a :FunctionCivic; :hasperiohistreet ?hasperiohistreet .
FILTER (?hasperiohistreet="ΙΠΠΟΚΡΑΤΟΥΣ"^^xsd:string)}
}
]]
