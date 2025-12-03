Feature: Database insertion

    Scenario Outline: Simple insertion
        Given Row insertion: "<id>" "<username>" "<email>"
        When I run script
        Then REPL result "<answer>"
    
    Examples:
        | id    | username      | email                 | answer                |
        | 1     | john          | john14@kmail.com      | Executed.             |
        | 2     | maria         | maria@outlook.com     | Executed.             |
        | 3     | charlie       | charlie87@hotmail.com | Executed.             |
    

    Scenario Outline: Incomplete argument insertion
        Given Row insertion: "<id>" "<username>" "<email>"
        When I run script
        Then REPL result "<answer>"

    Examples:
        | id    | username      | email                 | answer                |
        |       | peter         | peter@pmail.com       | Invalid arguments.    |
        | 5     |               | julia101@outlook.com  | Invalid arguments.    |
        | 4     | george        |                       | Invalid arguments.    |

    Scenario: Insertion with maximum argument length
        #Given Rows insertion with maximum length user and email
        Given An insertion command with maximum argument length
        When I run script
        Then REPL result "Executed."
        
    Scenario: Insertion with arguments exceeding the maximum length
        #Given Row insertion with exceeded maximum length user and email
        Given An insertion command with exceeded maximum argument length
        When I run script
        Then REPL result "String is too long."

    Scenario: Insertion with negative id
        Given An insertion with negative id
        When I run script
        Then REPL result "ID cannot be negative."
