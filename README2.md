#Guide to UQBARS Database

##Viewing Database
###View Database in CSV format

`heroku pg:pull DATABASE_URL [newdatabasename]`

`psql`

`\list`

`\connect [database]`

`\copy (SELECT * FROM users) TO 'test.csv' WITH CSV`

or
###View Database in command line

`heroku pg:psql`

`SELECT * FROM users;`



##Delete User

`heroku pg:psql`

`DELETE FROM users WHERE sid = 'sid you want to delete';`



##Update User
####(Probably to change paid:f to paid:t)
`heroku pg:psql`

`UPDATE users SET paid = 't'`

`WHERE name/sid/email/id = whatever;`