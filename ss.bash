RANGE=100

number=$RANDOM
let "number %= $RANGE"

attempts=0

while [ "$attempts" -le 6 ]
do
  read -p "Введите загаддное число: " answer
  
  if [ "$answer" -lt "$number" ]
  then
    echo "Число больше"
  fi

  if [ "$answer" -gt "$number" ] 
  then
    echo "Число меньше"
  fi

  if [ "$answer" -eq "$number" ] 
  then 
    echo "Вы угадали !"
    exit 0
  fi

  let "attempts += 1"
done

####
#3-9 (with case construction)
function print_error() {
    if [[  "$2" == "ru" ]]
    then
        code_to_error_ru $1
    fi 

    if [[  "$2" == "en" ]]
    then
        code_to_error_en $1
    fi 
}

function code_to_error_ru() {
    case "$1" in
    255 ) echo "Работа приложения завершена с ошибкой";;
    * ) echo "Неизвестная ошибка";;
    esac
}

function code_to_error_en() {
    case "$1" in
    255 ) echo "App was terminate with error";;
    * ) echo "Unknown error";;
    esac
}


print_error 255 ru

######
#3-9 (with associative array)
function print_error() {
    if [[  "$2" == "ru" ]]
    then
        code_to_error_ru $1
    fi 

    if [[  "$2" == "en" ]]
    then
        code_to_error_en $1
    fi 
}

declare -a ruErrors=(
    [255]='Работа приложения завершена с ошибкой'
)
function code_to_error_ru() {
    if [ "${ruErrors[$1]+1}" == "1" ]
    then
        echo "${ruErrors[$1]}"
        exit 0
    fi

    echo "Неизвестная ошибка"
}

enErrors=(
    [255]="App was terminate with error"
)
function code_to_error_en() {
    if [ "${enErrors[$1]+1}" == "1" ]
    then
        echo "${enErrors[$1]}"
        exit 0
    fi

    echo "Unknown error"
}


print_error 55 en
