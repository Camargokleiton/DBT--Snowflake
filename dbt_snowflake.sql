-- EN: Switch the current session context to the highest administrative role.
-- PT: Altera o contexto da sessão atual para a role administrativa de nível mais alto.
use role accountadmin;

-- EN: Create a virtual warehouse (compute resource) named 'dbt_wh' if it does not already exist.
-- PT: Cria um warehouse virtual (recurso de processamento) chamado 'dbt_wh' caso ele ainda não exista.
create warehouse if not exists dbt_wh;

-- EN: Create a database named 'dbt_db' to store your data objects if it does not already exist.
-- PT: Cria um banco de dados chamado 'dbt_db' para armazenar seus objetos de dados caso ele ainda não exista.
create database if not exists dbt_db;

-- EN: List all active privileges and access rights granted on the 'dbt_wh' warehouse.
-- PT: Lista todos os privilégios e direitos de acesso ativos concedidos no warehouse 'dbt_wh'.
show grants on warehouse dbt_wh;

-- EN: Create a custom RBAC role named 'dbt_role' for the dbt project permissions if it does not exist.
-- PT: Cria uma role personalizada (perfil de acesso) chamada 'dbt_role' para o projeto dbt se não existir.
create role if not exists dbt_role;

-- EN: Allow the custom 'dbt_role' to consume compute power from the 'dbt_wh' warehouse.
-- PT: Permite que a role personalizada 'dbt_role' consuma poder de processamento do warehouse 'dbt_wh'.
grant usage on warehouse dbt_wh to role dbt_role;

-- EN: Grant full control (create, modify, read) over the 'dbt_db' database to 'dbt_role'.
-- PT: Concede controle total (criar, modificar, ler) sobre o banco de dados 'dbt_db' para a 'dbt_role'.
grant all on database dbt_db to role dbt_role;

-- EN: Switch to the newly configured 'dbt_role' to execute the next object creation steps.
-- PT: Muda para a recém-configurada 'dbt_role' para executar os próximos passos de criação de objetos.
use role dbt_role;

-- EN: Completely delete an old schema named 'dbtShema' if it exists in the database.
-- PT: Exclui completamente um schema antigo chamado 'dbtShema' caso ele exista no banco de dados.
drop schema if exists dbt_db.dbtShema;

-- EN: Create the logical namespace (schema) named 'dbt_Shema' inside the database if it doesn't exist.
-- PT: Cria o namespace lógico (schema) chamado 'dbt_Shema' dentro do banco de dados caso não exista.
create schema if not exists dbt_db.dbt_Shema;

-- EN: Assign the 'dbt_role' access permissions to the specific user account named "KLEITON".
-- PT: Atribui as permissões de acesso da 'dbt_role' para a conta de usuário específica chamada "KLEITON".
GRANT ROLE dbt_role TO USER "KLEITON";

-- EN: Explicitly allow the 'dbt_role' to read/access the metadata of the 'dbt_shema' schema.
-- PT: Permite explicitamente que a 'dbt_role' leia/acesse os metadados do schema 'dbt_shema'.
GRANT USAGE ON SCHEMA dbt_db.dbt_shema TO ROLE dbt_role;

-- EN: Grant permission to the 'dbt_role' to build and replace views inside the 'dbt_shema' schema.
-- PT: Concede permissão para a 'dbt_role' construir e substituir views dentro do schema 'dbt_shema'.
GRANT CREATE VIEW ON SCHEMA dbt_db.dbt_shema TO ROLE dbt_role;

-- EN: Grant permission to the 'dbt_role' to create permanent, transient, or temporary tables in the schema.
-- PT: Concede permissão para a 'dbt_role' criar tabelas permanentes, transitórias ou temporárias no schema.
GRANT CREATE TABLE ON SCHEMA dbt_db.dbt_shema TO ROLE dbt_role;
