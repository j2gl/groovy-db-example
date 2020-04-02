MYSQL_HOST=127.0.0.1
MYSQL_PORT=23376
MYSQL_USER=groovydbusr
MYSQL_PASS=NicePassword
MYSQL_ROOT_PASS=DEVELOPMENT
MYSQL_DB=groovy_db

M2_REPO=/Users/juanjo/.m2/repository
JAR_FILE=target/groovy-db-0.1.0-jar-with-dependencies.jar
CONNECTION_ARGS=--jdbcHost=${MYSQL_HOST} --jdbcPort=${MYSQL_PORT} --jdbcUsername=${MYSQL_USER} --jdbcPassword="${MYSQL_PASS}"
ARGS=${CONNECTION_ARGS}

default: compile run

compile:
	mvn clean package

run: 
	java -jar ${JAR_FILE} ${ARGS} 

init-db:
	mysql -u root -p${MYSQL_ROOT_PASS} -h ${MYSQL_HOST} --port=${MYSQL_PORT} < sql/init-database.sql
	mysql -u ${MYSQL_USER} -p${MYSQL_PASS} -h ${MYSQL_HOST} --port=${MYSQL_PORT} ${MYSQL_DB} < sql/init-db-data.sql

mysql:
	mysql -u ${MYSQL_USER} -p${MYSQL_PASS} -h ${MYSQL_HOST} --port=${MYSQL_PORT} ${MYSQL_DB}

groovy:
	groovy -cp src/main/groovy/.:${M2_REPO}/info/picocli/picocli/4.0.1/picocli-4.0.1.jar:${M2_REPO}/mysql/mysql-connector-java/5.1.48/mysql-connector-java-5.1.48.jar \
		src/main/groovy/MainScript.groovy ${ARGS} 