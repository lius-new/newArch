//Modify this file to change what commands output to your statusbar, and recompile using the make command.
// light=$(cat /sys/class/backlight/intel_backlight/brightness);let light/=960;if [[ $light -gt 80 ]];then echo $lightﯧ ;else echo $light ;fi
static const Block blocks[] = {
	/*Icon*/	/*Command*/		/*Update Interval*/	/*Update Signal*/
	{"", "uname -srm",	60*60,		0},
	{"^c#0095ff^ Mem:", "free -h | awk '/^内存/ { print $3 }' |sed s/i//g",	30,		0},
	{"^c#ff0339^ Acpi:", "acpi | awk '{print $4,$6}' | awk -F ',' '{print $1,$2}' | sed 's/until//g' | sed 's/remaining//g'",	30,		0},
	{"^c#00ff73^ Light:", "light=$(cat /sys/class/backlight/intel_backlight/brightness);let light/=960;if [[ $light -gt 80 ]];then echo $light%ﯧ ;else echo $light%;fi",	5,		0},
	{"^c#ff9d00^ Volume:", "amixer sget Master | awk -F \"[][]\" 'END{print $2,$4}' | sed '/^$/d' | sed 's/on//g' | sed 's/off/婢/g'",	5,		0},
	{"^c#ee00ff^ ﮮ Date:", "date '+ %Y年%m月%d日 %H:%M:%S'",					5,		0},
};

//sets delimeter between status commands. NULL character ('\0') means no delimeter.
// 󰇝 󱋱 󰇥    
static char delim[] = "  ";
static unsigned int delimLen = 15;
