## PFAS Database

Database to store PFAS data.

### Access

- [Access Database Instructions & Business Rules](https://daltare.github.io/pfas-database/03_documentation/access/00_instructions_PFAS_AccessDB.html)
- [Access Database Documentation](https://daltare.github.io/pfas-database/03_documentation/access/01_create_PFAS_AccessDB.html)
- [Uploading / Analyzing Data Programmatically with Access (via R script)](https://daltare.github.io/pfas-database/03_documentation/access/02_append_data_PFAS_AccessDB.html)

### DuckDB

- [DuckDB Database Documentation (in progress)](https://daltare.github.io/pfas-database/03_documentation/duckdb/01_create_PFAS_duckdb_database.html) 

#### Graphical Interfaces / Data Viewers
- [DBeaver (Community Edition)](https://dbeaver.io/) (works with both SQLite and DuckDB)
    - Download from: <https://dbeaver.io/download/>
        - Download and run the installer (e.g. the `Windows (installer)` link which downloads a `.exe` file)
        - During the installation process, you'll have a 'Choose Users' option - select the 'For me (username)' option (NOT "For anyone...")
        - Accept the remaining defaults (you can choose where to install if you want)
    - (optional) Pin `dbeaver.exe` to taskbar and/or add a shortcut somewhere convenient
    - This should automatically work with SQLite
    - To use with DuckDB, you'll need to install the DuckDB JDBC driver - the instructions will be automatically provided when you try to connect, and they're also described [here](https://duckdb.org/docs/guides/sql_editors/dbeaver)


### SQLite

- [SQLite Database Documentation (in progress)](https://daltare.github.io/pfas-database/03_documentation/sqlite/01_create_PFAS_SQLite_database.html)

### Graphical Interfaces / Data Viewers

- [SQLiteStudio](https://sqlitestudio.pl/)
    - Download from: <https://github.com/pawelsalawa/sqlitestudio/releases> 
        - Platform: Windows x64 | Package type: Portable
    - Unzip the file into a location where you want to install (e.g. user folder)
    - (optional) Pin `SQLiteStudio.exe` to taskbar and/or add a shortcut somewhere convenient

- [DB Browser for SQLite](https://sqlitebrowser.org/)
    - Download from: <https://sqlitebrowser.org/dl/>
        - Use 'Windows PortableApp' version
    - Move the `.exe` file to the loaction where you want to install (e.g. user folder), then run the file
    - (optional) Pin `SQLiteDatabaseBrowserPortable.exe` to taskbar and/or add a shortcut somewhere convenient
