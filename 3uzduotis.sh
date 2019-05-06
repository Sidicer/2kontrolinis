#!/bin/bash
clear

echo "Pasirinkite norima veiksma: "
PS3="Pasirinkimas: "

select pasirinkimas in "'stud.txt' turinys ekrane" "naujas duomenu failas" "surikiuoti duomenu faila" "Exit"
do
    case $pasirinkimas in
      "'stud.txt' turinys ekrane")
        echo "$(<stud.txt)"
      ;;
      "naujas duomenu failas")
        echo -n "Iveskite naujo failo pavadinima: "
        read input_naujo_failo_pavadinimas
        echo "Kuri stulpeli irasyti i nauja faila?"
        echo -n "(3/4/5): "
        read input_naujo_failo_stulpelis
        while read col_1 col_2 col_3 col_4 col_5
        do
          if [[ $input_naujo_failo_stulpelis -eq 3 ]]; then echo $col_1 $col_2 $col_3 >> $input_naujo_failo_pavadinimas
          elif [[ $input_naujo_failo_stulpelis -eq 4 ]]; then echo $col_1 $col_2 $col_4 >> $input_naujo_failo_pavadinimas
          elif [[ $input_naujo_failo_stulpelis -eq 5 ]]; then echo $col_1 $col_2 $col_5 >> $input_naujo_failo_pavadinimas
          fi
        done<stud.txt
      ;;
      "surikiuoti duomenu faila")
        echo -n "Pagal kuri stulpeli noretumet surikiuoti?: "
        read input_stulpelio_rikiavimas
        sort -k $input_stulpelio_rikiavimas $input_naujo_failo_pavadinimas
      ;;
      "Exit")
        break
      ;;
    esac
done
