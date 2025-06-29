# BASIC DIALECT CONVERSIONS

|       | Dartmouth                  | APPLESOFT                     | ATARI 8-BIT                                   | BBC BASIC                               | COMMODORE BASIC V2                  |
|-------|----------------------------|-------------------------------|-----------------------------------------------|-----------------------------------------|-------------------------------------|
| OPEN  | FILE #_file_, "_filename_" | OPEN _filename_               | OPEN #_fileno_,_mode control code_,_filename_ | _var_ = OPENIN, _var_ = OPENOUT         | OPEN #exp, fileno, mode, "filename" |
| CLOSE |                            | CLOSE "_filename_"            | CLOSE #_fileno_, #_fileno_                    | CLOSE #_fileno_; CLOSE #0 _(all files)_ | CLOSE #_fileno_                     |
| LOAD  |                            | LOAD _filename_               | LOAD "_disk:filename_"                        | LOAD "_filename_"                       | LOAD "_filename_",8,[disk]          |
| PRINT | PRINT                      | PRINT exp, exp, ...           | PRINT #fileno, record, record, ...            | PRINT #filename, record, record, ...    | PRINT #fileno, record, record, ...  |
| INPUT | INPUT                      | INPUT [string,] var, var, ... | INPUT #[file,disk] var                        | INPUT #filename, record, record, ...    | INPUT _"string"_ var, var, ...      |
