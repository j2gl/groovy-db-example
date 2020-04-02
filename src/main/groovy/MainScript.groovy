import groovy.cli.picocli.CliBuilder
import groovy.cli.picocli.OptionAccessor
import groovy.sql.Sql

import com.j2gl.groovydb.DBQuery;

CliBuilder cli = new CliBuilder(posix: false, usage: '')
cli.jdbcHost    (args: 1, argName: "host", longOpt: 'jdbcHost', 'JDBC hostname')
cli.jdbcPort    (args: 1, argName: "port", longOpt: 'jdbcPort', 'JDBC port')
cli.jdbcUsername(args: 1, argName: "username", longOpt: 'jdbcUsername', 'JDBC username')
cli.jdbcPassword(args: 1, argName: "password", longOpt: 'jdbcPassword', 'JDBC password')

OptionAccessor opt = cli.parse(args)
if (opt == null) {
  System.exit(-1)
}

final def jdbcHost = opt.jdbcHost ?: 'localhost'
final def jdbcPort = opt.jdbcPort ?: '3306'
final def jdbcUsername = opt.jdbcUsername ?: 'root'
final def jdbcPassword = opt.jdbcPassword ?: ''

Sql sql = Sql.newInstance("jdbc:mysql://$jdbcHost:$jdbcPort/groovy_db?zeroDateTimeBehavior=convertToNull&useSSL=false", jdbcUsername, jdbcPassword, "com.mysql.jdbc.Driver")

final long countryId = 320
final def country = DBQuery.findCountryById(sql, countryId)
if (country == null) {
  println("Country with id=" + countryId + " not found.")
  System.exit(-1)
}

println country