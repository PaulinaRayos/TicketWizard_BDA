# TicketWizard - Java JDBC & MySQL Event Ticketing System 

A highly transactional event ticket purchase and resale system engineered in Java SE. The solution implements a strict Layered Architecture to decouple database operations from user interfaces, leveraging low-level **JDBC (Java Database Connectivity)** protocols to communicate with **MySQL** relational databases.

The architecture emphasizes strong relational database integrity, transactional safety, and server-side performance optimization through database persistence abstraction.

## Architectural Topology & Design Patterns

The software's internal engine isolates responsibilities into dedicated structural layers:
* `conexion/`: Manages physical connectivity contexts, transaction limits, and persistent channel opening with the MySQL server.
* `dao/` & `interfaces/`: Implements the Data Access Object pattern to isolate SQL query workflows away from the business rules.
* `dtos/`: Implements Data Transfer Objects to safely transport optimized data slices between boundaries without exposing core persistent models.
* `negocio/`: Controls complex state verifications and structural transactions (e.g., ticket authenticity, pricing margins, user access controls).
* `presentacionFrames/`: Driven by Java Swing to handle component layout setups independently from backend transactions.

## Relational Engineering & Performance Features

* Stored Procedures Optimization: Leverages compiled server-side Stored Procedures within the relational engine to process multi-step purchase workflows and transactional updates efficiently.
* JDBC Transaction Security: Implements transactional boundary controls (Commit/Rollback strategies) to guarantee ACID properties during simultaneous ticket acquisitions and re-sales.
* Full Database Blueprinting: Includes physical entity-relationship representations (ModeloEntidadRelacion_Ticketwizard.pdf) and native initialization scripts (Script_Ticketwizard.sql).

## Tech Stack & Build Tooling

* Core Language: Java SE
* Relational Engine: MySQL Server
* Database Connector: Native JDBC Driver API
* Build Automator: Maven Lifecycle Architecture (pom.xml)
