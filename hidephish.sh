logo(){
    { clear; }
printf "\e[1;77m \033[31m          _     _ _     _       ______  _     _      _      \e[0m\n"
printf "\e[1;77m \033[31m         | |   | (_)   | |     (_____ \| |   (_)    | |     \e[0m\n"
printf "\e[1;77m \033[31m         | |__ | |_  _ | | ____ _____) ) | _  _  ___| | _   \e[0m\n"
printf "\e[1;77m \033[31m         |  __)| | |/ || |/ _  )  ____/| || \| |/___) || \  \e[0m\n"
printf "\e[1;77m \033[31m         | |   | | ( (_| ( (/ /| |     | | | | |___ | | | | \e[0m\n"
printf "\e[1;77m \033[31m         |_|   |_|_|\____|\____)_|     |_| |_|_(___/|_| |_| \e[0m\n"
printf "\n"
printf "\033[36m       .:.:.\e[0m\e[1;77m Shorter URL Tool coded by:\e[0m \033[32m@birinci.emre.61 \033[36m.:.:.\e[0m\n"
printf "\n"                                                  
}

denetleme1(){
    if [ ! "${1//:*}" = http ]; then
        if [ ! "${1//:*}" = https ]; then
            printf "\e[1;92m  [\e[0m\e[1;77m!\e[0m\e[1;92m]\e[0m\e[1;93m Geçersiz url (http) yada (https) kullanarak tekrar deneyin. \e[0m\n"
            sleep 2
            gizlenecek
        fi
    fi
}

denetleme2(){
    if [ ! "${1//:*}" = http ]; then
        if [ ! "${1//:*}" = https ]; then
            printf "\e[1;92m  [\e[0m\e[1;77m!\e[0m\e[1;92m]\e[0m\e[1;93m Geçersiz bağlantı (http) yada (https) kullanarak tekrar deneyin. \e[0m\n"
            sleep 2
            maske
        fi
    fi
}

gizlenecek(){
    { logo; }
    read -p $'\n\e[1;92m  [\e[0m\e[1;77m*\e[0m\e[1;92m] Gizleme işlemi yapmak istediğiniz bağlantı 
  \033[37m->>> \e[0m\en' girdi
    denetleme1 $girdi
    sleep 1
    kisa=$(curl -s https://is.gd/create.php\?format\=simple\&url\=${girdi})
    kisalt=${kisa#https://}
    sleep 1
    maske
}

maske(){
    read -p $'\n\e[1;92m  [\e[0m\e[1;77m*\e[0m\e[1;92m] Bağlantıyı gizlemek için etki alanı 
  \033[37m->>> \e[0m\en' gizli
    denetleme2 $gizli
    sleep 1

    read -p $'\n\e[1;92m  [\e[0m\e[1;77m*\e[0m\e[1;92m] Bağlantıya kelime eklemek istermisiniz? \033[37m(E/H) 
  ->>> \e[0m\en' kelime

    	if [[ "$kelime" == e || "$kelime" == E ]]; then
        read -p $'\n\e[1;92m  [\e[0m\e[1;77m*\e[0m\e[1;92m] Eklemek istediğiniz kelimelerin arasına (-) kullanın. \033[37m 
  ->>> \e[0m\en' ekle
		son=$gizli-$ekle@$kisalt
        printf "\n"
        printf "\e[1;92m  [\e[0m\e[1;77m*\e[0m\e[1;92m]\e[0m\e[1;93m URL \033[37m->>> \033[31m${son}"
        exit
	    elif [[ "$kelime" == h || "$kelime" == H ]]; then
        son=$gizli@$kisalt
        printf "\n"
        printf "\e[1;92m  [\e[0m\e[1;77m*\e[0m\e[1;92m]\e[0m\e[1;93m URL \033[37m->>> \033[31m${son}"
        exit
        else
        printf "\e[1;92m[\e[0m\e[1;77m!\e[0m\e[1;92m]\e[0m\e[1;93m Geçersiz seçenek, Tekrar deneyin.\e[0m\n"
        maske
        fi

}

gizlenecek