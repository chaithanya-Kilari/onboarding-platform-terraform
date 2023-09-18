--
-- DEV Environment : ACCESS ROLES
--

-- Create DATA_ANALYST_WH_S full access role
USE ROLE SECURITYADMIN;
CREATE ROLE IF NOT EXISTS "__{{ENV}}_DATA_ANALYST_WH_S_FULL_AR";
GRANT MONITOR,USAGE,OPERATE,MODIFY ON WAREHOUSE "{{ENV}}_DATA_ANALYST_WH_S" TO ROLE "__{{ENV}}_DATA_ANALYST_WH_S_FULL_AR";


-- Create {{ENV}}_EDW_DATABRICKS_WH full access role
USE ROLE SECURITYADMIN;
CREATE ROLE IF NOT EXISTS "__{{ENV}}_{{TeamName}}_DATABRICKS_WH_FULL_AR";
GRANT MONITOR,USAGE,OPERATE,MODIFY ON WAREHOUSE "{{ENV}}_{{TeamName}}_DATABRICKS_WH" TO ROLE "__{{ENV}}_{{TeamName}}_DATABRICKS_WH_FULL_AR";

-- Create EDW_ENGINEER_WH_S full access role
USE ROLE SECURITYADMIN;
CREATE ROLE IF NOT EXISTS "__{{ENV}}_{{TeamName}}_ENGINEER_WH_S_FULL_AR";
GRANT MONITOR,USAGE,OPERATE,MODIFY ON WAREHOUSE "{{ENV}}_{{TeamName}}_ENGINEER_WH_S" TO ROLE "__{{ENV}}_{{TeamName}}_ENGINEER_WH_S_FULL_AR";

--usage on monitor roles
-- Create and Grant Privileges to Access Role __DATA_ANALYST_WH_S_UM_AR
USE ROLE SECURITYADMIN;
CREATE ROLE IF NOT EXISTS "__{{ENV}}_DATA_ANALYST_WH_S_UM_AR";
GRANT USAGE ON WAREHOUSE "{{ENV}}_DATA_ANALYST_WH_S" TO ROLE "__{{ENV}}_DATA_ANALYST_WH_S_UM_AR";
GRANT MONITOR ON WAREHOUSE "{{ENV}}_DATA_ANALYST_WH_S" TO ROLE "__{{ENV}}_DATA_ANALYST_WH_S_UM_AR";

-- Create and Grant Privileges to Access Role __{{ENV}}_EDW_DATABRICKS_WH_UM_AR
USE ROLE SECURITYADMIN;
CREATE ROLE IF NOT EXISTS "__{{ENV}}_{{TeamName}}_DATABRICKS_WH_UM_AR";
GRANT USAGE ON WAREHOUSE "{{ENV}}_{{TeamName}}_DATABRICKS_WH" TO ROLE "__{{ENV}}_{{TeamName}}_DATABRICKS_WH_UM_AR";
GRANT MONITOR ON WAREHOUSE "{{ENV}}_{{TeamName}}_DATABRICKS_WH" TO ROLE "__{{ENV}}_{{TeamName}}_DATABRICKS_WH_UM_AR";

-- Create and Grant Privileges to Access Role __EDW_ENGINEER_WH_S_UM_AR
USE ROLE SECURITYADMIN;
CREATE ROLE IF NOT EXISTS "__{{ENV}}_{{TeamName}}_ENGINEER_WH_S_UM_AR";
GRANT USAGE ON WAREHOUSE "{{ENV}}_{{TeamName}}_ENGINEER_WH_S" TO ROLE "__{{ENV}}_{{TeamName}}_ENGINEER_WH_S_UM_AR";
GRANT MONITOR ON WAREHOUSE "{{ENV}}_{{TeamName}}_ENGINEER_WH_S" TO ROLE "__{{ENV}}_{{TeamName}}_ENGINEER_WH_S_UM_AR";


--COMMON SCHEMA ACCESS
-- Create and Grant Privileges to Access Role __{{ENV}}_{{TeamName}}_CURATED_DB_COMMON_RO_AR (READ ONLY)
-- Create LOG owner access role
USE ROLE SECURITYADMIN;
CREATE ROLE IF NOT EXISTS "__{{ENV}}_{{TeamName}}_CURATED_DB_COMMON_FULL_AR";
GRANT OWNERSHIP ON SCHEMA "{{ENV}}_{{TeamName}}_CURATED_DB"."COMMON" TO ROLE "__{{ENV}}_{{TeamName}}_CURATED_DB_COMMON_FULL_AR" REVOKE CURRENT GRANTS;

USE ROLE SECURITYADMIN;
CREATE ROLE IF NOT EXISTS "__{{ENV}}_{{TeamName}}_CURATED_DB_COMMON_RO_AR";
GRANT USAGE ON DATABASE "{{ENV}}_{{TeamName}}_CURATED_DB" TO ROLE "__{{ENV}}_{{TeamName}}_CURATED_DB_COMMON_RO_AR";
GRANT USAGE ON SCHEMA "{{ENV}}_{{TeamName}}_CURATED_DB"."COMMON" TO ROLE "__{{ENV}}_{{TeamName}}_CURATED_DB_COMMON_RO_AR";
GRANT SELECT ON ALL TABLES IN SCHEMA "{{ENV}}_{{TeamName}}_CURATED_DB"."COMMON" TO ROLE "__{{ENV}}_{{TeamName}}_CURATED_DB_COMMON_RO_AR";
GRANT SELECT ON FUTURE TABLES IN SCHEMA "{{ENV}}_{{TeamName}}_CURATED_DB"."COMMON" TO ROLE "__{{ENV}}_{{TeamName}}_CURATED_DB_COMMON_RO_AR";
GRANT SELECT ON ALL VIEWS IN SCHEMA "{{ENV}}_{{TeamName}}_CURATED_DB"."COMMON" TO ROLE "__{{ENV}}_{{TeamName}}_CURATED_DB_COMMON_RO_AR";
GRANT SELECT ON FUTURE VIEWS IN SCHEMA "{{ENV}}_{{TeamName}}_CURATED_DB"."COMMON" TO ROLE "__{{ENV}}_{{TeamName}}_CURATED_DB_COMMON_RO_AR";
GRANT USAGE ON ALL SEQUENCES IN SCHEMA "{{ENV}}_{{TeamName}}_CURATED_DB"."COMMON" TO ROLE "__{{ENV}}_{{TeamName}}_CURATED_DB_COMMON_RO_AR";
GRANT USAGE ON FUTURE SEQUENCES IN SCHEMA "{{ENV}}_{{TeamName}}_CURATED_DB"."COMMON" TO ROLE "__{{ENV}}_{{TeamName}}_CURATED_DB_COMMON_RO_AR";
GRANT USAGE ON ALL STAGES IN SCHEMA "{{ENV}}_{{TeamName}}_CURATED_DB"."COMMON" TO ROLE "__{{ENV}}_{{TeamName}}_CURATED_DB_COMMON_RO_AR";
GRANT READ ON ALL STAGES IN SCHEMA "{{ENV}}_{{TeamName}}_CURATED_DB"."COMMON" TO ROLE "__{{ENV}}_{{TeamName}}_CURATED_DB_COMMON_RO_AR";
GRANT USAGE ON FUTURE STAGES IN SCHEMA "{{ENV}}_{{TeamName}}_CURATED_DB"."COMMON" TO ROLE "__{{ENV}}_{{TeamName}}_CURATED_DB_COMMON_RO_AR";
GRANT READ ON FUTURE STAGES IN SCHEMA "{{ENV}}_{{TeamName}}_CURATED_DB"."COMMON" TO ROLE "__{{ENV}}_{{TeamName}}_CURATED_DB_COMMON_RO_AR";
GRANT USAGE ON ALL FILE FORMATS IN SCHEMA "{{ENV}}_{{TeamName}}_CURATED_DB"."COMMON" TO ROLE "__{{ENV}}_{{TeamName}}_CURATED_DB_COMMON_RO_AR";
GRANT USAGE ON FUTURE FILE FORMATS IN SCHEMA "{{ENV}}_{{TeamName}}_CURATED_DB"."COMMON" TO ROLE "__{{ENV}}_{{TeamName}}_CURATED_DB_COMMON_RO_AR";
GRANT SELECT ON ALL STREAMS IN SCHEMA "{{ENV}}_{{TeamName}}_CURATED_DB"."COMMON" TO ROLE "__{{ENV}}_{{TeamName}}_CURATED_DB_COMMON_RO_AR";
GRANT SELECT ON FUTURE STREAMS IN SCHEMA "{{ENV}}_{{TeamName}}_CURATED_DB"."COMMON" TO ROLE "__{{ENV}}_{{TeamName}}_CURATED_DB_COMMON_RO_AR";
GRANT USAGE ON ALL PROCEDURES IN SCHEMA "{{ENV}}_{{TeamName}}_CURATED_DB"."COMMON" TO ROLE "__{{ENV}}_{{TeamName}}_CURATED_DB_COMMON_RO_AR";
GRANT USAGE ON FUTURE PROCEDURES IN SCHEMA "{{ENV}}_{{TeamName}}_CURATED_DB"."COMMON" TO ROLE "__{{ENV}}_{{TeamName}}_CURATED_DB_COMMON_RO_AR";
GRANT USAGE ON ALL FUNCTIONS IN SCHEMA "{{ENV}}_{{TeamName}}_CURATED_DB"."COMMON" TO ROLE "__{{ENV}}_{{TeamName}}_CURATED_DB_COMMON_RO_AR";
GRANT USAGE ON FUTURE FUNCTIONS IN SCHEMA "{{ENV}}_{{TeamName}}_CURATED_DB"."COMMON" TO ROLE "__{{ENV}}_{{TeamName}}_CURATED_DB_COMMON_RO_AR";


-- Create and Grant Privileges to Access Role __{{ENV}}_{{TeamName}}_CURATED_DB_COMMON_RW_AR (READ WRITE)
USE ROLE SECURITYADMIN;
CREATE ROLE IF NOT EXISTS "__{{ENV}}_{{TeamName}}_CURATED_DB_COMMON_RW_AR";
GRANT USAGE ON DATABASE "{{ENV}}_{{TeamName}}_CURATED_DB" TO ROLE "__{{ENV}}_{{TeamName}}_CURATED_DB_COMMON_RW_AR";
GRANT USAGE ON SCHEMA "{{ENV}}_{{TeamName}}_CURATED_DB"."COMMON" TO ROLE "__{{ENV}}_{{TeamName}}_CURATED_DB_COMMON_RW_AR";
GRANT SELECT,INSERT,UPDATE,DELETE,REFERENCES ON ALL TABLES IN SCHEMA "{{ENV}}_{{TeamName}}_CURATED_DB"."COMMON" TO ROLE "__{{ENV}}_{{TeamName}}_CURATED_DB_COMMON_RW_AR";
GRANT SELECT,INSERT,UPDATE,DELETE,REFERENCES ON FUTURE TABLES IN SCHEMA "{{ENV}}_{{TeamName}}_CURATED_DB"."COMMON" TO ROLE "__{{ENV}}_{{TeamName}}_CURATED_DB_COMMON_RW_AR";
GRANT SELECT ON ALL VIEWS IN SCHEMA "{{ENV}}_{{TeamName}}_CURATED_DB"."COMMON" TO ROLE "__{{ENV}}_{{TeamName}}_CURATED_DB_COMMON_RW_AR";
GRANT SELECT ON FUTURE VIEWS IN SCHEMA "{{ENV}}_{{TeamName}}_CURATED_DB"."COMMON" TO ROLE "__{{ENV}}_{{TeamName}}_CURATED_DB_COMMON_RW_AR";
GRANT USAGE ON ALL SEQUENCES IN SCHEMA "{{ENV}}_{{TeamName}}_CURATED_DB"."COMMON" TO ROLE "__{{ENV}}_{{TeamName}}_CURATED_DB_COMMON_RW_AR";
GRANT USAGE ON FUTURE SEQUENCES IN SCHEMA "{{ENV}}_{{TeamName}}_CURATED_DB"."COMMON" TO ROLE "__{{ENV}}_{{TeamName}}_CURATED_DB_COMMON_RW_AR";
GRANT USAGE,READ,WRITE ON ALL STAGES IN SCHEMA "{{ENV}}_{{TeamName}}_CURATED_DB"."COMMON" TO ROLE "__{{ENV}}_{{TeamName}}_CURATED_DB_COMMON_RW_AR";
GRANT USAGE,READ,WRITE ON FUTURE STAGES IN SCHEMA "{{ENV}}_{{TeamName}}_CURATED_DB"."COMMON" TO ROLE "__{{ENV}}_{{TeamName}}_CURATED_DB_COMMON_RW_AR";
GRANT USAGE ON ALL FILE FORMATS IN SCHEMA "{{ENV}}_{{TeamName}}_CURATED_DB"."COMMON" TO ROLE "__{{ENV}}_{{TeamName}}_CURATED_DB_COMMON_RW_AR";
GRANT USAGE ON FUTURE FILE FORMATS IN SCHEMA "{{ENV}}_{{TeamName}}_CURATED_DB"."COMMON" TO ROLE "__{{ENV}}_{{TeamName}}_CURATED_DB_COMMON_RW_AR";
GRANT SELECT ON ALL STREAMS IN SCHEMA "{{ENV}}_{{TeamName}}_CURATED_DB"."COMMON" TO ROLE "__{{ENV}}_{{TeamName}}_CURATED_DB_COMMON_RW_AR";
GRANT SELECT ON FUTURE STREAMS IN SCHEMA "{{ENV}}_{{TeamName}}_CURATED_DB"."COMMON" TO ROLE "__{{ENV}}_{{TeamName}}_CURATED_DB_COMMON_RW_AR";
GRANT USAGE ON ALL PROCEDURES IN SCHEMA "{{ENV}}_{{TeamName}}_CURATED_DB"."COMMON" TO ROLE "__{{ENV}}_{{TeamName}}_CURATED_DB_COMMON_RW_AR";
GRANT USAGE ON FUTURE PROCEDURES IN SCHEMA "{{ENV}}_{{TeamName}}_CURATED_DB"."COMMON" TO ROLE "__{{ENV}}_{{TeamName}}_CURATED_DB_COMMON_RW_AR";
GRANT USAGE ON ALL FUNCTIONS IN SCHEMA "{{ENV}}_{{TeamName}}_CURATED_DB"."COMMON" TO ROLE "__{{ENV}}_{{TeamName}}_CURATED_DB_COMMON_RW_AR";
GRANT USAGE ON FUTURE FUNCTIONS IN SCHEMA "{{ENV}}_{{TeamName}}_CURATED_DB"."COMMON" TO ROLE "__{{ENV}}_{{TeamName}}_CURATED_DB_COMMON_RW_AR";
GRANT MONITOR,OPERATE ON ALL TASKS IN SCHEMA "{{ENV}}_{{TeamName}}_CURATED_DB"."COMMON" TO ROLE "__{{ENV}}_{{TeamName}}_CURATED_DB_COMMON_RW_AR";
GRANT MONITOR,OPERATE ON FUTURE TASKS IN SCHEMA "{{ENV}}_{{TeamName}}_CURATED_DB"."COMMON" TO ROLE "__{{ENV}}_{{TeamName}}_CURATED_DB_COMMON_RW_AR";

-- Create and Grant Privileges to Access Role __{{ENV}}_{{TeamName}}_CURATED_DB_COMMON_FULL_AR
USE ROLE SECURITYADMIN;
CREATE ROLE IF NOT EXISTS "__{{ENV}}_{{TeamName}}_CURATED_DB_COMMON_FULL_AR";
GRANT USAGE ON DATABASE "{{ENV}}_{{TeamName}}_CURATED_DB" TO ROLE "__{{ENV}}_{{TeamName}}_CURATED_DB_COMMON_FULL_AR";
GRANT USAGE ON SCHEMA "{{ENV}}_{{TeamName}}_CURATED_DB"."COMMON" TO ROLE "__{{ENV}}_{{TeamName}}_CURATED_DB_COMMON_FULL_AR";
GRANT OWNERSHIP ON ALL TABLES IN SCHEMA "{{ENV}}_{{TeamName}}_CURATED_DB"."COMMON" TO ROLE "__{{ENV}}_{{TeamName}}_CURATED_DB_COMMON_FULL_AR";
GRANT OWNERSHIP ON FUTURE TABLES IN SCHEMA "{{ENV}}_{{TeamName}}_CURATED_DB"."COMMON" TO ROLE "__{{ENV}}_{{TeamName}}_CURATED_DB_COMMON_FULL_AR";
GRANT OWNERSHIP ON ALL VIEWS IN SCHEMA "{{ENV}}_{{TeamName}}_CURATED_DB"."COMMON" TO ROLE "__{{ENV}}_{{TeamName}}_CURATED_DB_COMMON_FULL_AR";
GRANT OWNERSHIP ON FUTURE VIEWS IN SCHEMA "{{ENV}}_{{TeamName}}_CURATED_DB"."COMMON" TO ROLE "__{{ENV}}_{{TeamName}}_CURATED_DB_COMMON_FULL_AR";
GRANT OWNERSHIP ON ALL SEQUENCES IN SCHEMA "{{ENV}}_{{TeamName}}_CURATED_DB"."COMMON" TO ROLE "__{{ENV}}_{{TeamName}}_CURATED_DB_COMMON_FULL_AR";
GRANT OWNERSHIP ON FUTURE SEQUENCES IN SCHEMA "{{ENV}}_{{TeamName}}_CURATED_DB"."COMMON" TO ROLE "__{{ENV}}_{{TeamName}}_CURATED_DB_COMMON_FULL_AR";
GRANT OWNERSHIP ON ALL STAGES IN SCHEMA "{{ENV}}_{{TeamName}}_CURATED_DB"."COMMON" TO ROLE "__{{ENV}}_{{TeamName}}_CURATED_DB_COMMON_FULL_AR";
GRANT OWNERSHIP ON FUTURE STAGES IN SCHEMA "{{ENV}}_{{TeamName}}_CURATED_DB"."COMMON" TO ROLE "__{{ENV}}_{{TeamName}}_CURATED_DB_COMMON_FULL_AR";
GRANT OWNERSHIP ON ALL FILE FORMATS IN SCHEMA "{{ENV}}_{{TeamName}}_CURATED_DB"."COMMON" TO ROLE "__{{ENV}}_{{TeamName}}_CURATED_DB_COMMON_FULL_AR";
GRANT OWNERSHIP ON FUTURE FILE FORMATS IN SCHEMA "{{ENV}}_{{TeamName}}_CURATED_DB"."COMMON" TO ROLE "__{{ENV}}_{{TeamName}}_CURATED_DB_COMMON_FULL_AR";
GRANT OWNERSHIP ON ALL STREAMS IN SCHEMA "{{ENV}}_{{TeamName}}_CURATED_DB"."COMMON" TO ROLE "__{{ENV}}_{{TeamName}}_CURATED_DB_COMMON_FULL_AR";
GRANT OWNERSHIP ON FUTURE STREAMS IN SCHEMA "{{ENV}}_{{TeamName}}_CURATED_DB"."COMMON" TO ROLE "__{{ENV}}_{{TeamName}}_CURATED_DB_COMMON_FULL_AR";
GRANT OWNERSHIP ON ALL PROCEDURES IN SCHEMA "{{ENV}}_{{TeamName}}_CURATED_DB"."COMMON" TO ROLE "__{{ENV}}_{{TeamName}}_CURATED_DB_COMMON_FULL_AR";
GRANT OWNERSHIP ON FUTURE PROCEDURES IN SCHEMA "{{ENV}}_{{TeamName}}_CURATED_DB"."COMMON" TO ROLE "__{{ENV}}_{{TeamName}}_CURATED_DB_COMMON_FULL_AR";
GRANT OWNERSHIP ON ALL FUNCTIONS IN SCHEMA "{{ENV}}_{{TeamName}}_CURATED_DB"."COMMON" TO ROLE "__{{ENV}}_{{TeamName}}_CURATED_DB_COMMON_FULL_AR";
GRANT OWNERSHIP ON FUTURE FUNCTIONS IN SCHEMA "{{ENV}}_{{TeamName}}_CURATED_DB"."COMMON" TO ROLE "__{{ENV}}_{{TeamName}}_CURATED_DB_COMMON_FULL_AR";
GRANT OWNERSHIP ON ALL TASKS IN SCHEMA "{{ENV}}_{{TeamName}}_CURATED_DB"."COMMON" TO ROLE "__{{ENV}}_{{TeamName}}_CURATED_DB_COMMON_FULL_AR";
GRANT OWNERSHIP ON FUTURE TASKS IN SCHEMA "{{ENV}}_{{TeamName}}_CURATED_DB"."COMMON" TO ROLE "__{{ENV}}_{{TeamName}}_CURATED_DB_COMMON_FULL_AR";




-- Grant Access Roles to Functional Roles
USE ROLE SECURITYADMIN;
GRANT ROLE "__{{ENV}}_{{TeamName}}_CURATED_DB_COMMON_FULL_AR" TO ROLE "{{ENV}}_{{Team}}_ADMIN_FR";
GRANT ROLE "__{{ENV}}_{{TeamName}}_CURATED_DB_COMMON_RO_AR" TO ROLE "{{ENV}}_{{Team}}_ANALYST_FR";
GRANT ROLE "__{{ENV}}_{{TeamName}}_CURATED_DB_COMMON_FULL_AR" TO ROLE "{{ENV}}_{{Team}}_DATABRICKS_FR";
GRANT ROLE "__{{ENV}}_{{TeamName}}_CURATED_DB_COMMON_RW_AR" TO ROLE "{{ENV}}_{{Team}}_ENGINEER_FR";


USE ROLE SYSADMIN;

--COMMON SCHEMA ACCESS
-- STG_DB
-- Create and Grant Privileges to Access Role __{{ENV}}_{{TeamName}}_STG_DB_COMMON_RO_AR (READ ONLY)
USE ROLE SECURITYADMIN;
CREATE ROLE IF NOT EXISTS "__{{ENV}}_{{TeamName}}_STG_DB_COMMON_FULL_AR";
GRANT OWNERSHIP ON SCHEMA "{{ENV}}_{{TeamName}}_STG_DB"."COMMON" TO ROLE "__{{ENV}}_{{TeamName}}_STG_DB_COMMON_FULL_AR" REVOKE CURRENT GRANTS;

USE ROLE SECURITYADMIN;
CREATE ROLE IF NOT EXISTS "__{{ENV}}_{{TeamName}}_STG_DB_COMMON_RO_AR";
GRANT USAGE ON DATABASE "{{ENV}}_{{TeamName}}_STG_DB" TO ROLE "__{{ENV}}_{{TeamName}}_STG_DB_COMMON_RO_AR";
GRANT USAGE ON SCHEMA "{{ENV}}_{{TeamName}}_STG_DB"."COMMON" TO ROLE "__{{ENV}}_{{TeamName}}_STG_DB_COMMON_RO_AR";
GRANT SELECT ON ALL TABLES IN SCHEMA "{{ENV}}_{{TeamName}}_STG_DB"."COMMON" TO ROLE "__{{ENV}}_{{TeamName}}_STG_DB_COMMON_RO_AR";
GRANT SELECT ON FUTURE TABLES IN SCHEMA "{{ENV}}_{{TeamName}}_STG_DB"."COMMON" TO ROLE "__{{ENV}}_{{TeamName}}_STG_DB_COMMON_RO_AR";
GRANT SELECT ON ALL VIEWS IN SCHEMA "{{ENV}}_{{TeamName}}_STG_DB"."COMMON" TO ROLE "__{{ENV}}_{{TeamName}}_STG_DB_COMMON_RO_AR";
GRANT SELECT ON FUTURE VIEWS IN SCHEMA "{{ENV}}_{{TeamName}}_STG_DB"."COMMON" TO ROLE "__{{ENV}}_{{TeamName}}_STG_DB_COMMON_RO_AR";
GRANT USAGE ON ALL SEQUENCES IN SCHEMA "{{ENV}}_{{TeamName}}_STG_DB"."COMMON" TO ROLE "__{{ENV}}_{{TeamName}}_STG_DB_COMMON_RO_AR";
GRANT USAGE ON FUTURE SEQUENCES IN SCHEMA "{{ENV}}_{{TeamName}}_STG_DB"."COMMON" TO ROLE "__{{ENV}}_{{TeamName}}_STG_DB_COMMON_RO_AR";
GRANT USAGE ON ALL STAGES IN SCHEMA "{{ENV}}_{{TeamName}}_STG_DB"."COMMON" TO ROLE "__{{ENV}}_{{TeamName}}_STG_DB_COMMON_RO_AR";
GRANT READ ON ALL STAGES IN SCHEMA "{{ENV}}_{{TeamName}}_STG_DB"."COMMON" TO ROLE "__{{ENV}}_{{TeamName}}_STG_DB_COMMON_RO_AR";
GRANT USAGE ON FUTURE STAGES IN SCHEMA "{{ENV}}_{{TeamName}}_STG_DB"."COMMON" TO ROLE "__{{ENV}}_{{TeamName}}_STG_DB_COMMON_RO_AR";
GRANT READ ON FUTURE STAGES IN SCHEMA "{{ENV}}_{{TeamName}}_STG_DB"."COMMON" TO ROLE "__{{ENV}}_{{TeamName}}_STG_DB_COMMON_RO_AR";
GRANT USAGE ON ALL FILE FORMATS IN SCHEMA "{{ENV}}_{{TeamName}}_STG_DB"."COMMON" TO ROLE "__{{ENV}}_{{TeamName}}_STG_DB_COMMON_RO_AR";
GRANT USAGE ON FUTURE FILE FORMATS IN SCHEMA "{{ENV}}_{{TeamName}}_STG_DB"."COMMON" TO ROLE "__{{ENV}}_{{TeamName}}_STG_DB_COMMON_RO_AR";
GRANT SELECT ON ALL STREAMS IN SCHEMA "{{ENV}}_{{TeamName}}_STG_DB"."COMMON" TO ROLE "__{{ENV}}_{{TeamName}}_STG_DB_COMMON_RO_AR";
GRANT SELECT ON FUTURE STREAMS IN SCHEMA "{{ENV}}_{{TeamName}}_STG_DB"."COMMON" TO ROLE "__{{ENV}}_{{TeamName}}_STG_DB_COMMON_RO_AR";
GRANT USAGE ON ALL PROCEDURES IN SCHEMA "{{ENV}}_{{TeamName}}_STG_DB"."COMMON" TO ROLE "__{{ENV}}_{{TeamName}}_STG_DB_COMMON_RO_AR";
GRANT USAGE ON FUTURE PROCEDURES IN SCHEMA "{{ENV}}_{{TeamName}}_STG_DB"."COMMON" TO ROLE "__{{ENV}}_{{TeamName}}_STG_DB_COMMON_RO_AR";
GRANT USAGE ON ALL FUNCTIONS IN SCHEMA "{{ENV}}_{{TeamName}}_STG_DB"."COMMON" TO ROLE "__{{ENV}}_{{TeamName}}_STG_DB_COMMON_RO_AR";
GRANT USAGE ON FUTURE FUNCTIONS IN SCHEMA "{{ENV}}_{{TeamName}}_STG_DB"."COMMON" TO ROLE "__{{ENV}}_{{TeamName}}_STG_DB_COMMON_RO_AR";


-- Create and Grant Privileges to Access Role __{{ENV}}_{{TeamName}}_STG_DB_COMMON_RW_AR (READ WRITE)
USE ROLE SECURITYADMIN;
CREATE ROLE IF NOT EXISTS "__{{ENV}}_{{TeamName}}_STG_DB_COMMON_RW_AR";
GRANT USAGE ON DATABASE "{{ENV}}_{{TeamName}}_STG_DB" TO ROLE "__{{ENV}}_{{TeamName}}_STG_DB_COMMON_RW_AR";
GRANT USAGE ON SCHEMA "{{ENV}}_{{TeamName}}_STG_DB"."COMMON" TO ROLE "__{{ENV}}_{{TeamName}}_STG_DB_COMMON_RW_AR";
GRANT SELECT,INSERT,UPDATE,DELETE,REFERENCES ON ALL TABLES IN SCHEMA "{{ENV}}_{{TeamName}}_STG_DB"."COMMON" TO ROLE "__{{ENV}}_{{TeamName}}_STG_DB_COMMON_RW_AR";
GRANT SELECT,INSERT,UPDATE,DELETE,REFERENCES ON FUTURE TABLES IN SCHEMA "{{ENV}}_{{TeamName}}_STG_DB"."COMMON" TO ROLE "__{{ENV}}_{{TeamName}}_STG_DB_COMMON_RW_AR";
GRANT SELECT ON ALL VIEWS IN SCHEMA "{{ENV}}_{{TeamName}}_STG_DB"."COMMON" TO ROLE "__{{ENV}}_{{TeamName}}_STG_DB_COMMON_RW_AR";
GRANT SELECT ON FUTURE VIEWS IN SCHEMA "{{ENV}}_{{TeamName}}_STG_DB"."COMMON" TO ROLE "__{{ENV}}_{{TeamName}}_STG_DB_COMMON_RW_AR";
GRANT USAGE ON ALL SEQUENCES IN SCHEMA "{{ENV}}_{{TeamName}}_STG_DB"."COMMON" TO ROLE "__{{ENV}}_{{TeamName}}_STG_DB_COMMON_RW_AR";
GRANT USAGE ON FUTURE SEQUENCES IN SCHEMA "{{ENV}}_{{TeamName}}_STG_DB"."COMMON" TO ROLE "__{{ENV}}_{{TeamName}}_STG_DB_COMMON_RW_AR";
GRANT USAGE,READ,WRITE ON ALL STAGES IN SCHEMA "{{ENV}}_{{TeamName}}_STG_DB"."COMMON" TO ROLE "__{{ENV}}_{{TeamName}}_STG_DB_COMMON_RW_AR";
GRANT USAGE,READ,WRITE ON FUTURE STAGES IN SCHEMA "{{ENV}}_{{TeamName}}_STG_DB"."COMMON" TO ROLE "__{{ENV}}_{{TeamName}}_STG_DB_COMMON_RW_AR";
GRANT USAGE ON ALL FILE FORMATS IN SCHEMA "{{ENV}}_{{TeamName}}_STG_DB"."COMMON" TO ROLE "__{{ENV}}_{{TeamName}}_STG_DB_COMMON_RW_AR";
GRANT USAGE ON FUTURE FILE FORMATS IN SCHEMA "{{ENV}}_{{TeamName}}_STG_DB"."COMMON" TO ROLE "__{{ENV}}_{{TeamName}}_STG_DB_COMMON_RW_AR";
GRANT SELECT ON ALL STREAMS IN SCHEMA "{{ENV}}_{{TeamName}}_STG_DB"."COMMON" TO ROLE "__{{ENV}}_{{TeamName}}_STG_DB_COMMON_RW_AR";
GRANT SELECT ON FUTURE STREAMS IN SCHEMA "{{ENV}}_{{TeamName}}_STG_DB"."COMMON" TO ROLE "__{{ENV}}_{{TeamName}}_STG_DB_COMMON_RW_AR";
GRANT USAGE ON ALL PROCEDURES IN SCHEMA "{{ENV}}_{{TeamName}}_STG_DB"."COMMON" TO ROLE "__{{ENV}}_{{TeamName}}_STG_DB_COMMON_RW_AR";
GRANT USAGE ON FUTURE PROCEDURES IN SCHEMA "{{ENV}}_{{TeamName}}_STG_DB"."COMMON" TO ROLE "__{{ENV}}_{{TeamName}}_STG_DB_COMMON_RW_AR";
GRANT USAGE ON ALL FUNCTIONS IN SCHEMA "{{ENV}}_{{TeamName}}_STG_DB"."COMMON" TO ROLE "__{{ENV}}_{{TeamName}}_STG_DB_COMMON_RW_AR";
GRANT USAGE ON FUTURE FUNCTIONS IN SCHEMA "{{ENV}}_{{TeamName}}_STG_DB"."COMMON" TO ROLE "__{{ENV}}_{{TeamName}}_STG_DB_COMMON_RW_AR";
GRANT MONITOR,OPERATE ON ALL TASKS IN SCHEMA "{{ENV}}_{{TeamName}}_STG_DB"."COMMON" TO ROLE "__{{ENV}}_{{TeamName}}_STG_DB_COMMON_RW_AR";
GRANT MONITOR,OPERATE ON FUTURE TASKS IN SCHEMA "{{ENV}}_{{TeamName}}_STG_DB"."COMMON" TO ROLE "__{{ENV}}_{{TeamName}}_STG_DB_COMMON_RW_AR";

-- Create and Grant Privileges to Access Role __{{ENV}}_{{TeamName}}_STG_DB_COMMON_FULL_AR
USE ROLE SECURITYADMIN;
CREATE ROLE IF NOT EXISTS "__{{ENV}}_{{TeamName}}_STG_DB_COMMON_FULL_AR";
GRANT USAGE ON DATABASE "{{ENV}}_{{TeamName}}_STG_DB" TO ROLE "__{{ENV}}_{{TeamName}}_STG_DB_COMMON_FULL_AR";
GRANT USAGE ON SCHEMA "{{ENV}}_{{TeamName}}_STG_DB"."COMMON" TO ROLE "__{{ENV}}_{{TeamName}}_STG_DB_COMMON_FULL_AR";
GRANT OWNERSHIP ON ALL TABLES IN SCHEMA "{{ENV}}_{{TeamName}}_STG_DB"."COMMON" TO ROLE "__{{ENV}}_{{TeamName}}_STG_DB_COMMON_FULL_AR";
GRANT OWNERSHIP ON FUTURE TABLES IN SCHEMA "{{ENV}}_{{TeamName}}_STG_DB"."COMMON" TO ROLE "__{{ENV}}_{{TeamName}}_STG_DB_COMMON_FULL_AR";
GRANT OWNERSHIP ON ALL VIEWS IN SCHEMA "{{ENV}}_{{TeamName}}_STG_DB"."COMMON" TO ROLE "__{{ENV}}_{{TeamName}}_STG_DB_COMMON_FULL_AR";
GRANT OWNERSHIP ON FUTURE VIEWS IN SCHEMA "{{ENV}}_{{TeamName}}_STG_DB"."COMMON" TO ROLE "__{{ENV}}_{{TeamName}}_STG_DB_COMMON_FULL_AR";
GRANT OWNERSHIP ON ALL SEQUENCES IN SCHEMA "{{ENV}}_{{TeamName}}_STG_DB"."COMMON" TO ROLE "__{{ENV}}_{{TeamName}}_STG_DB_COMMON_FULL_AR";
GRANT OWNERSHIP ON FUTURE SEQUENCES IN SCHEMA "{{ENV}}_{{TeamName}}_STG_DB"."COMMON" TO ROLE "__{{ENV}}_{{TeamName}}_STG_DB_COMMON_FULL_AR";
GRANT OWNERSHIP ON ALL STAGES IN SCHEMA "{{ENV}}_{{TeamName}}_STG_DB"."COMMON" TO ROLE "__{{ENV}}_{{TeamName}}_STG_DB_COMMON_FULL_AR";
GRANT OWNERSHIP ON FUTURE STAGES IN SCHEMA "{{ENV}}_{{TeamName}}_STG_DB"."COMMON" TO ROLE "__{{ENV}}_{{TeamName}}_STG_DB_COMMON_FULL_AR";
GRANT OWNERSHIP ON ALL FILE FORMATS IN SCHEMA "{{ENV}}_{{TeamName}}_STG_DB"."COMMON" TO ROLE "__{{ENV}}_{{TeamName}}_STG_DB_COMMON_FULL_AR";
GRANT OWNERSHIP ON FUTURE FILE FORMATS IN SCHEMA "{{ENV}}_{{TeamName}}_STG_DB"."COMMON" TO ROLE "__{{ENV}}_{{TeamName}}_STG_DB_COMMON_FULL_AR";
GRANT OWNERSHIP ON ALL STREAMS IN SCHEMA "{{ENV}}_{{TeamName}}_STG_DB"."COMMON" TO ROLE "__{{ENV}}_{{TeamName}}_STG_DB_COMMON_FULL_AR";
GRANT OWNERSHIP ON FUTURE STREAMS IN SCHEMA "{{ENV}}_{{TeamName}}_STG_DB"."COMMON" TO ROLE "__{{ENV}}_{{TeamName}}_STG_DB_COMMON_FULL_AR";
GRANT OWNERSHIP ON ALL PROCEDURES IN SCHEMA "{{ENV}}_{{TeamName}}_STG_DB"."COMMON" TO ROLE "__{{ENV}}_{{TeamName}}_STG_DB_COMMON_FULL_AR";
GRANT OWNERSHIP ON FUTURE PROCEDURES IN SCHEMA "{{ENV}}_{{TeamName}}_STG_DB"."COMMON" TO ROLE "__{{ENV}}_{{TeamName}}_STG_DB_COMMON_FULL_AR";
GRANT OWNERSHIP ON ALL FUNCTIONS IN SCHEMA "{{ENV}}_{{TeamName}}_STG_DB"."COMMON" TO ROLE "__{{ENV}}_{{TeamName}}_STG_DB_COMMON_FULL_AR";
GRANT OWNERSHIP ON FUTURE FUNCTIONS IN SCHEMA "{{ENV}}_{{TeamName}}_STG_DB"."COMMON" TO ROLE "__{{ENV}}_{{TeamName}}_STG_DB_COMMON_FULL_AR";
GRANT OWNERSHIP ON ALL TASKS IN SCHEMA "{{ENV}}_{{TeamName}}_STG_DB"."COMMON" TO ROLE "__{{ENV}}_{{TeamName}}_STG_DB_COMMON_FULL_AR";
GRANT OWNERSHIP ON FUTURE TASKS IN SCHEMA "{{ENV}}_{{TeamName}}_STG_DB"."COMMON" TO ROLE "__{{ENV}}_{{TeamName}}_STG_DB_COMMON_FULL_AR";




-- Grant Access Roles to Functional Roles
USE ROLE SECURITYADMIN;
GRANT ROLE "__{{ENV}}_{{TeamName}}_STG_DB_COMMON_FULL_AR" TO ROLE "{{ENV}}_{{Team}}_ADMIN_FR";
GRANT ROLE "__{{ENV}}_{{TeamName}}_STG_DB_COMMON_RO_AR" TO ROLE "{{ENV}}_{{Team}}_ANALYST_FR";
GRANT ROLE "__{{ENV}}_{{TeamName}}_STG_DB_COMMON_FULL_AR" TO ROLE "{{ENV}}_{{Team}}_DATABRICKS_FR";
GRANT ROLE "__{{ENV}}_{{TeamName}}_STG_DB_COMMON_RW_AR" TO ROLE "{{ENV}}_{{Team}}_ENGINEER_FR";


USE ROLE SYSADMIN;