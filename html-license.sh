shopt -s globstar
for i in public/css/*.css
do
  echo "" >> $i
  echo "/** LICENSE" >> $i
  echo "  * This is a course requirement for CS 192 Software Engineering II under the supervision of Asst. Prof. Ma. Rowena C. Solamo of the Department of Computer Science, College of Engineering, University of the Philippines, Diliman for the AY 2017-2018." >> $i
  echo "  */" >> $i
done

for i in public/js/*.js
do
  echo "" >> $i
  echo "/** LICENSE" >> $i
  echo "  * This is a course requirement for CS 192 Software Engineering II under the supervision of Asst. Prof. Ma. Rowena C. Solamo of the Department of Computer Science, College of Engineering, University of the Philippines, Diliman for the AY 2017-2018." >> $i
  echo "  */" >> $i
done

for i in public/*.html
do
  echo "" >> $i
  echo "<!-- LICENSE -->" >> $i
  echo "<!-- This is a course requirement for CS 192 Software Engineering II under the supervision of Asst. Prof. Ma. Rowena C. Solamo of the Department of Computer Science, College of Engineering, University of the Philippines, Diliman for the AY 2017-2018. -->" >> $i
  echo "" >> $i
done
