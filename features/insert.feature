Feature: Database insertion

    Scenario Outline: Simple insertion
        Given Row insertion: "<id>" "<username>" "<email>"
        When Run script
        Then REPL result "<answer>"
    
    Examples:
        | id    | username      | email                 | answer                |
        | 1     | john          | john14@kmail.com      | Executed.             |
        | 2     | maria         | maria@outlook.com     | Executed.             |
        | 3     | charlie       | charlie87@hotmail.com | Executed.             |
    

    Scenario Outline: Incomplete argument insertion
        Given Row insertion: "<id>" "<username>" "<email>"
        When Run script
        Then REPL result "<answer>"

    Examples:
        | id    | username      | email                 | answer                |
        | 4     | george        |                       | Invalid arguments.    |
        |       | peter         | peter@pmail.com       | Invalid arguments.    |
        | 5     |               | julia101@outlook.com  | Invalid arguments.    |
