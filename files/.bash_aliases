alias run="cd /home/$USER/server && java -jar paper*.jar"
alias temp="/usr/bin/vcgencmd measure_temp | sed 's/^.*=//'"
alias session="cd /home/$USER && tmux new -Asmain"i
alias la='ls -a --color -h --group-directories-first'
alias py="python3"

mkcd ()
{
	        mkdir -p -- "$1" && cd -P -- "$1"
}

cs ()
{
	        cd $1 && ls
}


test-ports () {
	RED='\033[0;31m'
	GREEN='\033[0;32m'
	NC='\033[0m'

	if sudo netstat -tnlp | grep -q :22; then
		printf "${GREEN}SSH port open (port 22)"
	else
		printf "${RED}SSH port closed (port 22)"
	fi
	
	printf "\n"

	if sudo netstat -tnlp | grep -q :25565; then
		printf "${GREEN}Minecraft port open (port 25565)"
	else
		printf "${RED}Minecraft port closed (port 25565)"
	fi

	printf "\n"

	if sudo netstat -tnlp | grep -q :8123; then
		printf "${GREEN}Map port open (port 8123)"
	else
		printf "${RED}Map port closed (port 8123)"
	fi

	printf "\n${NC}"
}

list () {
	RED='\033[0;31m'
	GREEN='\033[0;32m'
	NC='\033[0m'


	if tmux ls |& grep -q no; then
		printf "${RED}"
		tmux ls
	else
		printf "${GREEN}"
		tmux ls
	fi
		
	printf "${NC}"
}

stats () {
	printf "TMUX Servers:\n"
	list

	printf "\nPorts:\n"
	test-ports

	printf "\nTemperature:\n"
	temp	
}

log () {
	while true; do
		clear
		stats
		sleep 5
	done
}
