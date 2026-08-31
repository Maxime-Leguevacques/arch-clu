```bash
echo <value> | sudo tee /sys/class/backlight/*/brightness
```
where \<value\> is an integer.
The max value on your computer can be checked with.
```bash
cat /sys/class/backlight/intel_backlight/max_brightness
```