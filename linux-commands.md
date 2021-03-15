# Linux Commands

## Batch Rename

```bash
# Rename all *.txt to *.text
for f in *.txt; do 
    mv -- "$f" "${f%.txt}.text"
done
```

## tmux

* `tmux a` Attach to tmux session
* `Ctrl-b <nr>` Switch to tab <nr>
* `Ctrl-b c` Create new tab (window)
* `Ctrl-b &` Kill tab (window)
* `Ctrl-b d` Close tmux
* `tmux kill-session -t <snr>` Close tmux session

## Syslog

`sudo tail -f /var/log/syslog` follow syslog

## Disk usage

`df -h`
