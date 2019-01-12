**1.Data collection**
During this phase the primary data sources from the corresponding units of the city of Athens were collected in various formats (.csv, .txt files. .xls, .shp)
**2.Data management and processing** 
a. During this phase, the data collected was extensively processed in order to “be cleaned” and to be imported into databases. The postreSQL server (version 9.5.) and pgAdmin4 (version 3.0.) were installed to manage the data. Then, through pgAdmin4, the database schemas were created and the data were inserted into the databases.
b. The next step was to install database virtualization software in order to virtualize the databases created into one database. Virtualization was considered necessary as the OBDA framework used can link the ontology to a single database. Its operation requires the installation of the Java Runtime Environment (JRE) 8, the Eclipse Neon software suite (IDE), the JBoss server (JBoss AS / Wildfly application server with Teiid Runtime 9.0.6), and the Teiid design tool, Teiid Designer. Server and designer operation is done through the Eclipse Neon environment. It is also necessary to download the postgreSQL and Teiid drivers for the necessary connections.
**3.Ontology creation and elaboration** 
During this phase the field ontology (city ontology) was created. The Protégé version 5.1.0. Ontology editor was installed and Ontop was added as a plugin. 
**4.Linking ontology to databases**
Through the Protégé JDBC connector, the JBoss Application server was connected with the ontology. Then with active connection, mappings of the ontology with the databases were designed and SPARQL queries were executed on the ontology.

