<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html dir="rtl">
  <head>
    <title>FirstForum</title>
    <link rel="stylesheet" type="text/css" href="style.css" />
    <script type="text/javascript" src="functions.js"></script>
  </head>

  <body>
    <%@include file="header.jsp"%>

    <div class="s_r_root">
      <div class="first-logo"></div>
      <!-- <h3>הרשמה</h3> -->
      <div class="s_r_container">
        <form
          name="register"
          action="dbRegister.jsp"
          onsubmit="return checkAll();"
          method="post"
        >
          <label> שם משתמש</label>
          <input type="text" name="username" placeholder="הכנס שם משתמש" />
          <label>סיסמה</label>
          <input type="password" name="password" placeholder="הכנס סיסמה" />
          <label> אשר סיסמה</label>
          <input
            type="password"
            name="password_confirm"
            placeholder="אשר סיסמה"
          />
          <label>כתובת דואר</label>
          <input type="text" name="email" placeholder="הכנס כתובת דואר" />
          <label>אשר כתובת דואר</label>
          <input
            type="text"
            name="email_confirm"
            placeholder="הכנס כתובת דואר"
          />
          <label>סוג תחרות</label>
          <select name="compType">
            <option value="FRC">FRC</option>
            <option value="FTC">FTC</option>
            <option value="FLL">FLL</option>
          </select>
          <label>מספר קבוצה</label>
          <input type="text" name="teamNumber" placeholder="הכנס מספר קבוצה" />
          <label>מדינה</label>
          <select name="country">
            <option value="בחר מיקום">בחר מיקום</option>
            <option value="אוגנדה">אוגנדה</option>
            <option value="אוזבקיסטן">אוזבקיסטן</option>
            <option value="אוסטריה">אוסטריה</option>
            <option value="אוסטרליה">אוסטרליה</option>
            <option value="אוקראינה">אוקראינה</option>
            <option value="אורוגווי">אורוגווי</option>
            <option value="אזרבייג'ן">אזרבייג'ן</option>
            <option value="איחוד האמירויות הערביות"
              >איחוד האמירויות הערביות</option
            >
            <option value="איטליה">איטליה</option>
            <option value="איי הבהאמה">איי הבהאמה</option>
            <option value="איי הבתולה (האמריקניים)"
              >איי הבתולה (האמריקניים)</option
            >
            <option value="איי הבתולה (הבריטיים)">איי הבתולה (הבריטיים)</option>
            <option value="איי התעלה">איי התעלה</option>
            <option value="איי טורקס וקאיקוס">איי טורקס וקאיקוס</option>
            <option value="איי מרשל">איי מרשל</option>
            <option value="איי פארו">איי פארו</option>
            <option value="איי פוקלנד">איי פוקלנד</option>
            <option value="איי קומורו">איי קומורו</option>
            <option value="איי קוק">איי קוק</option>
            <option value="איי קיימן">איי קיימן</option>
            <option value="איי שלמה">איי שלמה</option>
            <option value="אינדונזיה">אינדונזיה</option>
            <option value="איסלנד">איסלנד</option>
            <option value="איראן (הרפובליקה האיסלאמית של)"
              >איראן (הרפובליקה האיסלאמית של)</option
            >
            <option value="אירלנד, הרפובליקה של">אירלנד, הרפובליקה של</option>
            <option value="אלבניה">אלבניה</option>
            <option value="אל סלבדור">אל סלבדור</option>
            <option value="אנגווילה">אנגווילה</option>
            <option value="אנגולה">אנגולה</option>
            <option value="אנדורה">אנדורה</option>
            <option value="אנטיגואה וברבודה">אנטיגואה וברבודה</option>
            <option value="אסטוניה">אסטוניה</option>
            <option value="אפגניסטן">אפגניסטן</option>
            <option value="אקוודור">אקוודור</option>
            <option value="ארובה">ארובה</option>
            <option value="אריתריאה">אריתריאה</option>
            <option value="ארמניה">ארמניה</option>
            <option value="ארצות הברית של אמריקה">ארצות הברית של אמריקה</option>
            <option value="אתיופיה">אתיופיה</option>
            <option value="בהוטן">בהוטן</option>
            <option value="בוטסוואנה">בוטסוואנה</option>
            <option value="בולגריה">בולגריה</option>
            <option value="בוליביה">בוליביה</option>
            <option value="בונייר">בונייר</option>
            <option value="בוסניה והרצגובינה">בוסניה והרצגובינה</option>
            <option value="בורונדי">בורונדי</option>
            <option value="בורקינה פאסו">בורקינה פאסו</option>
            <option value="בחריין">בחריין</option>
            <option value="בלגיה">בלגיה</option>
            <option value="בליז">בליז</option>
            <option value="בלרוס">בלרוס</option>
            <option value="בנגלדש">בנגלדש</option>
            <option value="בנין">בנין</option>
            <option value="ברבדוס">ברבדוס</option>
            <option value="ברוניי">ברוניי</option>
            <option value="ברזיל">ברזיל</option>
            <option value="בריטניה">בריטניה</option>
            <option value="ברמודה">ברמודה</option>
            <option value="ג'יבוטי">ג'יבוטי</option>
            <option value="ג'מייקה">ג'מייקה</option>
            <option value="ג'רזי">ג'רזי</option>
            <option value="גאורגיה">גאורגיה</option>
            <option value="גאנה">גאנה</option>
            <option value="גבון">גבון</option>
            <option value="גואדלופ">גואדלופ</option>
            <option value="גואטמלה">גואטמלה</option>
            <option value="גואם">גואם</option>
            <option value="גיאנה (הבריטית)">גיאנה (הבריטית)</option>
            <option value="גיאנה (הצרפתית)">גיאנה (הצרפתית)</option>
            <option value="גיברלטר">גיברלטר</option>
            <option value="גינאה ביסאו">גינאה ביסאו</option>
            <option value="גינאה המשוונית">גינאה המשוונית</option>
            <option value="גמביה">גמביה</option>
            <option value="גרינלנד">גרינלנד</option>
            <option value="גרמניה">גרמניה</option>
            <option value="גרנדה">גרנדה</option>
            <option value="גרנזי">גרנזי</option>
            <option value="דומיניקה">דומיניקה</option>
            <option value="דנמרק">דנמרק</option>
            <option value="דרום אפריקה">דרום אפריקה</option>
            <option value="דרום סודאן">דרום סודאן</option>
            <option value="האיטי">האיטי</option>
            <option value="האיים המלדיביים">האיים המלדיביים</option>
            <option value="הודו">הודו</option>
            <option value="הולנד">הולנד</option>
            <option value="הונג קונג">הונג קונג</option>
            <option value="הונגריה">הונגריה</option>
            <option value="הונדורס">הונדורס</option>
            <option value="הפיליפינים">הפיליפינים</option>
            <option value="הרפובליקה הדומיניקנית">הרפובליקה הדומיניקנית</option>
            <option value="הרפובליקה המרכז אפריקאית"
              >הרפובליקה המרכז אפריקאית</option
            >
            <option value="וייטנאם">וייטנאם</option>
            <option value="ונואטו">ונואטו</option>
            <option value="ונצואלה">ונצואלה</option>
            <option value="זימבבואה">זימבבואה</option>
            <option value="זמביה">זמביה</option>
            <option value="חוף השנהב">חוף השנהב</option>
            <option value="טג'יקיסטן">טג'יקיסטן</option>
            <option value="טהיטי">טהיטי</option>
            <option value="טובלו">טובלו</option>
            <option value="טוגו">טוגו</option>
            <option value="טונגה">טונגה</option>
            <option value="טוניסיה">טוניסיה</option>
            <option value="טורטולה">טורטולה</option>
            <option value="טורקיה">טורקיה</option>
            <option value="טורקמניסטן">טורקמניסטן</option>
            <option value="טיוואן">טיוואן</option>
            <option value="טנזניה">טנזניה</option>
            <option value="טרינידד וטובגו">טרינידד וטובגו</option>
            <option value="יוון">יוון</option>
            <option value="יפן">יפן</option>
            <option value="ירדן">ירדן</option>
            <option value="ישראל">ישראל</option>
            <option value="כווית">כווית</option>
            <option value="לאוס">לאוס</option>
            <option value="לבנון">לבנון</option>
            <option value="לוב ">לוב</option>
            <option value="לוקסמבורג">לוקסמבורג</option>
            <option value="לטביה">לטביה</option>
            <option value="ליבריה">ליבריה</option>
            <option value="ליטא">ליטא</option>
            <option value="ליכטנשטיין">ליכטנשטיין</option>
            <option value="לסותו">לסותו</option>
            <option value="מאוריטניה">מאוריטניה</option>
            <option value="מאוריציוס">מאוריציוס</option>
            <option value="מאלי">מאלי</option>
            <option value="מדגסקר">מדגסקר</option>
            <option value="מוזמביק">מוזמביק</option>
            <option value="מולדובה, הרפובליקה של">מולדובה, הרפובליקה של</option>
            <option value="מונגוליה">מונגוליה</option>
            <option value="מונסראט">מונסראט</option>
            <option value="מונקו">מונקו</option>
            <option value="מזרח טימור">מזרח טימור</option>
            <option value="מיוט">מיוט</option>
            <option value="מיינמאר">מיינמאר</option>
            <option value="מלאווי">מלאווי</option>
            <option value="מלזיה">מלזיה</option>
            <option value="מלטה">מלטה</option>
            <option value="מצרים">מצרים</option>
            <option value="מקאו">מקאו</option>
            <option value="מקדוניה, הרפובליקה של">מקדוניה, הרפובליקה של</option>
            <option value="מקסיקו">מקסיקו</option>
            <option value="מרוקו">מרוקו</option>
            <option value="מרטיניק">מרטיניק</option>
            <option value="נאורו, הרפובליקה של">נאורו, הרפובליקה של</option>
            <option value="נורווגיה">נורווגיה</option>
            <option value="ניגריה">ניגריה</option>
            <option value="ניואה">ניואה</option>
            <option value="ניו זילנד">ניו זילנד</option>
            <option value="ניז'ר">ניז'ר</option>
            <option value="ניקרגואה">ניקרגואה</option>
            <option value="נמיביה">נמיביה</option>
            <option value="נפאל">נפאל</option>
            <option value="סאו טומה ופרינסיפה">סאו טומה ופרינסיפה</option>
            <option value="סודן">סודן</option>
            <option value="סוואזילנד">סוואזילנד</option>
            <option value="סומליה">סומליה</option>
            <option value="סוריה">סוריה</option>
            <option value="סורינם">סורינם</option>
            <option value="סייפן">סייפן</option>
            <option value="סיירה לאונה">סיירה לאונה</option>
            <option value="סיישל">סיישל</option>
            <option value="סין, הרפובליקה העממית של"
              >סין, הרפובליקה העממית של</option
            >
            <option value="סינגפור">סינגפור</option>
            <option value="סלובניה">סלובניה</option>
            <option value="סלובקיה">סלובקיה</option>
            <option value="סמואה">סמואה</option>
            <option value="סמואה האמריקנית">סמואה האמריקנית</option>
            <option value="סנגל">סנגל</option>
            <option value="סנט אוסטטיוס">סנט אוסטטיוס</option>
            <option value="סנט ברתלמי">סנט ברתלמי</option>
            <option value="סנט ג'והן">סנט ג'והן</option>
            <option value="סנט וינסנט והגרנדינים">סנט וינסנט והגרנדינים</option>
            <option value="סנט לושיה">סנט לושיה</option>
            <option value="סנט מרטן">סנט מרטן</option>
            <option value="סנט קיטס ונוויס">סנט קיטס ונוויס</option>
            <option value="סנט קרואה">סנט קרואה</option>
            <option value="סנט תומס">סנט תומס</option>
            <option value="ספרד">ספרד</option>
            <option value="סרביה">סרביה</option>
            <option value="סרי לנקה">סרי לנקה</option>
            <option value="עומאן">עומאן</option>
            <option value="עירק">עירק</option>
            <option value="ערב הסעודית">ערב הסעודית</option>
            <option value="פולין">פולין</option>
            <option value="פולינזיה הצרפתית">פולינזיה הצרפתית</option>
            <option value="פורטוגל">פורטוגל</option>
            <option value="פורטו ריקו">פורטו ריקו</option>
            <option value="פיג'י">פיג'י</option>
            <option value="פינלנד">פינלנד</option>
            <option value="פנמה">פנמה</option>
            <option value="פפואה גינאה החדשה">פפואה גינאה החדשה</option>
            <option value="פקיסטן">פקיסטן</option>
            <option value="פרגוואי">פרגוואי</option>
            <option value="פרו">פרו</option>
            <option value="צ'אד">צ'אד</option>
            <option value="צ'ילה">צ'ילה</option>
            <option value="צ'כיה">צ'כיה</option>
            <option value="צרפת">צרפת</option>
            <option value="קאטאר">קאטאר</option>
            <option value="קובה">קובה</option>
            <option value="קולומביה">קולומביה</option>
            <option value="קונגו">קונגו</option>
            <option value="קונגו">קונגו</option>
            <option value="קוסובו">קוסובו</option>
            <option value="קוסטה ריקה">קוסטה ריקה</option>
            <option value="קוראסאו">קוראסאו</option>
            <option value="קוריאה">קוריאה</option>
            <option value="קוריאה">קוריאה</option>
            <option value="קזחסטן">קזחסטן</option>
            <option value="קייפ ורדה">קייפ ורדה</option>
            <option value="קירגיזסטן">קירגיזסטן</option>
            <option value="קיריבטי">קיריבטי</option>
            <option value="קלדוניה החדשה">קלדוניה החדשה</option>
            <option value="קמבודיה">קמבודיה</option>
            <option value="קמרון">קמרון</option>
            <option value="קנדה">קנדה</option>
            <option value="קניה">קניה</option>
            <option value="קפריסין">קפריסין</option>
            <option value="קרואטיה">קרואטיה</option>
            <option value="ראוניון, האי">ראוניון, האי</option>
            <option value="רואנדה">רואנדה</option>
            <option value="רומניה">רומניה</option>
            <option value="רוסיה">רוסיה</option>
            <option value="רפובליקת גינאה">רפובליקת גינאה</option>
            <option value="שוודיה">שוודיה</option>
            <option value="שוויץ">שוויץ</option>
            <option value="תאילנד">תאילנד</option>
            <option value="תימן">תימן</option>
          </select>
          <label>תפקיד בקבוצה</label>
          <input type="text" name="teamJob" placeholder="הכנס תפקיד בקבוצה" />
          <label>תאריך הצטרפות לקבוצה</label>
          <input
            type="date"
            name="rookieTime"
            placeholder="הכנס תאריך הצטרפות לקבוצה"
          />
          <input type="reset" value="נקה" class="button clear-button" />
          <input type="submit" value="היכנס" class="button send-button" />
        </form>
      </div>
    </div>
  </body>
</html>
