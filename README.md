# Sunnah Dieting App 
For my Final Year Project under Sir Jamaludin bin Ibrahim.

A dieting app with added functionality of tracking sunnah/islamic foods and sunnah eating habits (actions before, during, after eating) and listing their sources (where it is mentioned ie. Quran or which sunnah/hadith book).

Made with the intention of helping Muslims/dieters interested in islamic diet to learn and able to track their sunnah dieting. 

Functionalities:
- Admin : Maintain and update sunnah food/habit list and sources.
- User : Diet tracking, sunnah food tracking (marks with a star), notifications for meal times, profile has BMI calculator, favourite sunnah food, average daily calorie intake and total intake since using the app.

Made using VSCode (glorified text editor), Flutter(framework + dart language), Firebase (auth and storage), and USDA (United States Department of Agriculture) FoodData Central database (food API).

Lacking:
- Haram foods are in the database and not marked (since using USDA FDC API)
- Notifications not fully functional
- Diet tracker certain actions not refreshing

## Documentation and others: 
https://drive.google.com/drive/folders/1zgEDlWms-cXUkMfj6NlmXDNwLuNRp8vG?usp=sharing

## How to run
1. Configure your own firebase auth and storage and place API in the api location.
2. Get API from USDA FDC and place the api.
3. flutter run
