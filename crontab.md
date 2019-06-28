# Crontab

## Syntax

```
┌───────────── minute (0 - 59)
│ ┌───────────── hour (0 - 23)
│ │ ┌───────────── day of month (1 - 31)
│ │ │ ┌───────────── month (1 - 12)
│ │ │ │ ┌───────────── day of week (0 - 6) (Sunday to Saturday;
│ │ │ │ │                                       7 is also Sunday on some systems)
│ │ │ │ │
│ │ │ │ │
* * * * *  command to execute
```

`*` = every
`*/n` = every n
`x,y,z` = every x, y, z

### Examples

```
0 5 * * * /usr/bin/backup.sh
```
Every morning 5am (minute == 0 & hour == 5)

```
*/10 * * * * /usr/bin/runsomething.sh
```
Every 10 minutes

```
0 8,17 * * * /usr/bin/runsomething.sh
```
On 8am and 5pm
