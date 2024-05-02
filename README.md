# Sunnah Dieting App 
For my Final Year Project under Sir Jamaludin bin Ibrahim.

A dieting app with added functionality of tracking sunnah/islamic foods and sunnah eating habits (actions before, during, after eating) and listing their sources (where it is mentioned ie. Quran or which sunnah/hadith book).
Made with the intention of helping Muslims/dieters interested in islamic diet to learn and able to track their sunnah dieting. 

Functionalities:
- Admin : Maintain and update sunnah food/habit list and sources.
- User : Diet tracking, sunnah food tracking, notifications for meal times, BMI calculator in profile.

Made using VSCode (glorified text editor), Flutter(framework + dart language), Firebase (auth and storage), and USDA (United States Department of Agriculture) FoodData Central database (food API).

Lacking:
- Haram foods are in the database and not marked (since using USDA FDC API)
- Notifications not fully functional
- Diet tracker certain actions not refreshing

## Documentation and others: 
https://drive.google.com/drive/folders/1zgEDlWms-cXUkMfj6NlmXDNwLuNRp8vG?usp=sharing

## How to run
1. Download flutter.
2. flutter create sunnah_diet
3. Download project files using git pull or github desktop.
4. flutter pub get
5. flutter pub upgrade
6. flutter run 
