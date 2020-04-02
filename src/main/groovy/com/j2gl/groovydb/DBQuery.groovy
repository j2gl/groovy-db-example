package com.j2gl.groovydb;

import groovy.sql.Sql

class DBQuery {

  static findCountryById(final Sql sql, final Long countryId) {
    final def country = sql.firstRow("""
        SELECT id, created, modified, alpha_iso_2, alpha_iso_3, name, name_es, active
        FROM   country 
        WHERE  id = ?""", countryId)

    return country
  }
  
}