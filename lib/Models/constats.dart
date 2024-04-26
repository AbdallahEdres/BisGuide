import 'package:shared_preferences/shared_preferences.dart';

class MyConstents {

static  String language = 'ar'; // اللغة الافتراضية

  static Future<String> getLanguage() async {
    final prefs = await SharedPreferences.getInstance();
    MyConstents.language = prefs.getString('language') ?? 'ar';
    return language;
  }

  static void setLanguage(String language) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('language', language);
    MyConstents.language = language;
  }


  static String get aboutContent {   
     return language == 'ar' ? _aboutContentAr : _aboutContentEn;
}
  static const String _aboutContentAr =      
   'Business Information Systems هو الاختصار لمسمي “نظم معلومات الأعمال” وهو برنامج دراسي أكاديمي يهدف الي مزج علوم نظم وتكنولوجيا المعلومات بالعلوم المالية والتجارية. فالدراسة بالبرنامج تتضمن مزيجاً فريداً من أهم وأكثر المقررات الدراسية مواكبة لاحتياجات سوق العمل محلياً واقليمياً وعالمياً في مجالي تكنولوجيا المعلومات والأعمال. وقد روعي في هذا المزج الجمع بين العلوم الإدارية والاقتصادية والأساس العلمي القائم على تقديم آخر ما توصل إليه العلم والمعرفة من إبداع الي جانب التطبيق العملي لتلك الموضوعات ومدي توافقها مع احتياجات سوق العمل في مجالات نظم وتكنولوجيا المعلومات بالإضافة إلي احتياجات منظمات الأعمال الاقتصادية من مهارات';

   static const String _aboutContentEn =
"Business Information Systems is the abbreviation for 'Business Information Systems,' which is an academic program aimed at integrating information systems and technology with financial and business sciences. The program's curriculum includes a unique blend of essential courses designed to meet the needs of the local, regional, and global job markets in the fields of information technology and business. This blend considers the integration of management and economic sciences with the scientific basis, presenting the latest scientific and knowledge innovations alongside the practical application of these subjects, ensuring their compatibility with the job market's requirements in the fields of information systems and technology, as well as the skill requirements of economic business organizations.";
  
  
  static String get workingFieldsContent {
    return language == 'ar' ? _workingFieldsContentAr : _workingFieldsContentEn;
  }
  static const String _workingFieldsContentAr =
      ' يتميز خريجي برنامج نظم معلومات الأعمال (BIS) بتأهيله لكثير من فرص العمل المتنوعة والمختلفة بأسواق العمل المحلية والاقليمية والعالمية.\n إذ يوفر البرنامج خلفية قوية في المجالات التجارية، ويؤهل الدارس للعمل في المهن التي تتعلق بالمعلومات وتكنولوجيا الاتصال والتي أصبحت من سمات هذا العصر. فالطالب يدرس، بالإضافة إلى الخلفية الأساسية في العلوم التجارية، مجالات أخرى مثل تطوير البرامج، وتطبيق حزم البرامج الجاهزة، بالإضافة إلى تحليل وتصميم وتطوير وإدارة التطبيقات الحاسوبية في مجالات الأعمال والنظم المعلوماتية والحوسبة المتخصصة في مختلف مؤسسات الاعمال، كالبنوك وشركات البترول وشركات الاتصالات وشركات البرمجيات الاقليمية والعالمية ومؤسسات الأوراق المالية والبورصات ومراكز المعلومات البحثية والخدمية والزراعية والصناعية والصحية وشركات السياحة وغيرها.ويتمتع خريج البرنامج أيضا بفرص تؤهله للعمل في التخصصات المهنية التالية في سوق العمل: \n•	المحاسبة الإلكترونية المتخصصة.\n•	إنشاء وتحليل وتصميم النظم المحاسبية والإدارية بمختلف أنشطتها ومجالاتها.\n•	إنشاء قواعد البيانات المتخصصة\n•	إنشاء وتصميم المواقع الإلكترونية.\n•	المؤسسات الافتراضية والرقمية.\n•	هيكلة وتصميم شبكات المعلومات لمنظمات الأعمال.\n•	اقتصاديات المعرفة الإلكترونية لمؤسسات الأعمال والبورصات المحلية والإقليمية.\n•	تفعيل مفهوم هندسة البرمجيات لتطوير مؤسسات الأعمال في جميع نواحي الأعمال';

  static const String _workingFieldsContentEn =
"Graduates of the Business Information Systems (BIS) program are distinguished by their qualification for many diverse employment opportunities in local, regional, and global job markets. The program provides a strong background in business fields and qualifies students to work in professions related to information and communication technology, which have become characteristic of this era. In addition to the basic background in business sciences, students also study other areas such as software development, application of ready-made software packages, as well as analysis, design, development, and management of computer applications in business fields, information systems, and specialized computing in various business institutions, such as banks, petroleum companies, communication companies, regional and international software companies, financial institutions, stock exchanges, research and service information centers, agricultural, industrial, health, tourism companies, and others. Graduates of the program also enjoy opportunities to work in the following professional specializations in the job market: • Specialized electronic accounting. • Creation, analysis, and design of accounting and administrative systems in various activities and fields. • Creation of specialized databases. • Creation and design of websites. • Virtual and digital institutions. • Structuring and designing information networks for business organizations. • Electronic knowledge economics for business institutions and local and regional stock exchanges. • Activating the concept of software engineering for the development of business institutions in all business aspects.";

  
  
  static String get creditHoursContent {
    return language == 'ar' ? _creditHoursContentAr : _creditHoursContentEn;
  }
 static const String _creditHoursContentAr = 
    '	•	تعتمد الدراسة بالبرنامج على نظام الساعات المعتمدة.\n\n•	يقسم العام الدراسي إلى فصلين دراسيين ويمكن إضافة فصل صيفي.\n\n•	يتطلب الحصول على البكالوريوس أن يجتاز الطالب بنجاح (129) ساعة معتمدة وذلك على مدى ثمانية فصول دراسية على الأقل لا تشمل الفصول الدراسية الصيفية.\n\n•	يقوم الطالب بإعداد مشروع التخرج (يحتسب بستة ساعات معتمدة) في أحد مجالات استخدام نظم المعلومات في قطاع الأعمال.\n\n•	لا يسمح للطالب بتسجيل أي مقرر دراسي إلا بعد اجتيازه للمتطلبات السابقة لهذا المقرر في حالة وجودها.\n\n•	قبل بداية كل فصل دراسي يقوم الطالب بتسجيل المقررات الدراسية التي يختارها في المواعيد المعلنة لذلك.\n\n•	الحد الأدنى للساعات المعتمدة للتسجيل في كل فصل دراسي (9) ساعات، والحد الأقصى (18) ساعة. ويجوز التجاوز عن هذين الحدين في حالات التخرج فقط وبموافقة المشرف على البرنامج';

  static const String _creditHoursContentEn =
"• The program is based on the credit hour system.\n\n• The academic year is divided into two semesters, and a summer semester can be added.\n\n• To obtain a bachelor's degree, the student must successfully complete (129) credit hours over a minimum of eight academic semesters, not including summer semesters.\n\n• The student prepares a graduation project (counted as six credit hours) in one of the fields of information systems application in the business sector.\n\n• The student is not allowed to register for any course unless they have passed the prerequisites for that course if applicable.\n\n• Before the start of each academic semester, the student registers for the courses they choose at the announced times.\n\n• The minimum number of credit hours for registration in each academic semester is (9) hours, and the maximum is (18) hours. Exceeding these limits is only allowed in graduation cases with the approval of the program supervisor.";

static List<List<List<String>>> get subjects {
  if (language == 'ar') {
    return [
      // Arabic list of subjects
      [
        ['مقدمه في الإحصاء','مدخل للحاسبات الآلية','أصول المحاسبة','اللغة الإنجليزية','أصول الإدارة والتنظيم', 'طرق البحث وكتابة التقارير'],
        ['السلوك التنظيمي','الرياضيات','مبادئ الاقتصاد','الأخلاقيات وحقوق الانسان','مهارات الاتصال', 'مدخل الى القانون'],
      ],
      [
        ['أصول التكاليف','محاسبة الشركات','رياضيات الاعمال','التطبيقات المكتبية للحاسب الالي','ريادة الأعمال', 'مبادئ التسويق'],
        ['أصول المراجعة','مبادئ التامين ','قانون تجاري', 'مبادئ التمويل والاستثمار','الإحصاء التطبيقي','-:مقرر اختياري \n   المحاسبة الإدارية\nإدارة المشروعات']
      ],
      [
        ['لغة برمجة(1)','التجارة الإلكترونية','تحليل اقتصادي جزئي','البرامج والحزم الجاهزة في مجالات الاعمال','-:مقرر اختياري\n  المحاسبة الإدارية\nإدارة المشروعات'],
        ['نظم دعم القرار','تحليل وتنظيم النظم','البرمجة الهيكلية','مراجعه الحسابات الإلكترونية','انشاء وصيانة شبكات الحاسب']
      ],
      [
        ['نظم المحاسبة الإلكترونية','تطوير المواقع على الشبكة العنكبوتية','قواعد البيانات','نظم الخبرة في تطبيقات الاعمال','اقتصاديات المعلومات'],
        ['امن نظم المعلومات','استخدام الوسائط المتعددة في مجالات الاعمال']
      ]
    ];
  } else {
    return [
      // English list of subjects
      [
        ['Introduction to Statistics','Introduction to Computers','Principles of Accounting','English Language','Principles of Management and Organization','Research Methods and Report Writing'],
        ['Organizational Behavior','Mathematics','Principles of Economics','Ethics and Human Rights','Communication Skills','Introduction to Law'],
      ],
      [
        ['Cost Principles','Corporate Accounting','Business Mathematics','Office Applications for Computers','Entrepreneurship','Principles of Marketing'],
        ['Audit Principles','Insurance Principles','Commercial Law','Finance and Investment Principles','Applied Statistics','- Optional Course\n   Managerial Accounting\n   Project Management']
      ],
      [
        ['Programming Language (1)','E-Commerce','Partial Economic Analysis','Software and Ready-made Packages in Business Fields','- Optional Course\n   Managerial Accounting\n   Project Management'],
        ['Decision Support Systems','System Analysis and Organization','Structural Programming','Electronic Accounting Review','Creation and Maintenance of Computer Networks']
      ],
      [
        ['Electronic Accounting Systems','Web Development','Database Systems','Experience Systems in Business Applications','Information Economics'],
        ['Information Systems Security','Use of Multimedia in Business Fields']
      ]
    ];
  }
}




static List<String> get fees {
  if (language == 'ar') {
    return [
      "1: يتم تسجيل المواد من خلال هذا اللينك :",
      "\nhttps://tdb.tanta.edu.eg/regart/\n",
      "وهذا الفيديو التوضيحي لطريقة التسجيل : ",
      "2: يتم دفع المصاريف من خلال بعض التطبيقات مثل تطبيق أمان قم ب اختيار خانة تعليم ثم اختيار جامعة طنطا وتسجيل الرقم القومي سيظهر لك الرسوم المحملة قم بالرفع من خلال البطاقة الائتمانية او التوجه الى أقرب فرع من فروع امان",
      "3: يتم استخراج وصل المدفوعات وتسليمه في شئون الطلبة.\n\t•\tملاحظات\nمراعاة دفع المصاريف في الموعد المحدد حتى لا يترتب عليك دفع غرامة على التأخير. 1-\nمراعاة تسجيل المواد في الموعد المحدد قبل غلق الموقع. 2-\nعند حدوث أي مشكلة في تسجيل المواد يرجى التوجه الى وحدة تكنولوجيا المعلومات. 3-\n4-يتم تطبيق خصم بنسبة (25%)للطلاب الحاصلون على معدل امتياز ,وخصم (15%)للطلاب الحاصلون على معدل جيد جدا"
    ];
  } else {
    return [
      "1: Courses registration is done through this link:",
      "\nhttps://tdb.tanta.edu.eg/regart/\n",
      "And here's the instructional video for the registration process:",
      "2: Fees can be paid through some applications like Aman app. Select the education category, then choose Tanta University, and enter your national ID. The fees you owe will appear, you can pay using a credit card or by visiting the nearest Aman branch.",
      "3: Payment receipts are issued and delivered at the Student Affairs Department.\n\t•\tNotes:\nEnsure timely payment of fees to avoid late payment penalties. 1-\nEnsure registration of courses before the specified deadline before the website closes. 2-\nIn case of any issues with course registration, please contact the Information Technology Unit. 3-\n4- A discount of (25%) is applied for students with distinction grades, and a discount of (15%) for students with very good grades."
    ];
  }
}

static List<String> get booksFees {
  if (language == 'ar') {
    return [
      "1-يتم الدخول الى منصة الكتاب الالكتروني ومليء البيانات المطلوبةمن خلال هذا الرابط ",
      "2-بعد تسجيل الدخول للموقع قم بالضغط على زر(شراء جميع الكتب)",
      "3-يتم الدخول الى منصة التحصيل الالكتروني وملء البيانات المطلوبة من خلال هذا الرابط ",
      "4-بعد تسجيل الدخول قم بالضغط على زر (أوامر الدفع المحملة على الطالب) ثم الموافقة ودفع المبلغ المطلوب من خلال البطاقة الائتمانية",
      "1-فيديو توضيحي لطريقة شراء الكتب الدراسية : ",
      "2- عند حدوث أي مشكلة خلال تحصيل الكتب يتم التوجه الى وحدة تكنولوجيا المعلومات",
      "الايميل الجامعي: يتم الحصول على الايميل الجامعي من خلال هذا الرابط "
    ];
  } else {
    return [
      "1- Access the e-book platform and fill in the required information through this link:",
      "2- After logging in to the website, click on the (Buy All Books) button.",
      "3- Access the electronic payment platform and fill in the required information through this link:",
      "4- After logging in, click on the (Orders Charged to Student) button, then approve and pay the required amount using a credit card.",
      "1- Instructional video on how to purchase textbooks:",
      "2- In case of any issues during book payment, please contact the Information Technology Unit.",
      "University Email: Obtain the university email through this link:"
    ];
  }
}


static String get requiredDocumentsForNewStudents {
  if (language == 'ar') {
    return """
    • أصل شهادة الثانوية العامة
    
    • 6 صور شخصية حديثة وكتابة الاسم رباعي على كل صورة 

    • أصل شهادة الميلاد كمبيوتر (بها الرقم الثلاثي للذكور + صورة منها) 

    • صورة البطاقة الشخصية (الرقم القومي)

    • نموذج 2 جند للطلاب الذكور

    • ايصال الرسوم الدراسية

    • 40 جنية طوابع جامعة تدفع بخزينة الكلية

    • افادة من جهة العمل لأبناء العاملين بجامعة طنطا ووحداتها التابعة لها
    """;
  } else {
    return """
    • Original high school certificate
    
    • 6 recent passport-sized photos with full name written on each photo

    • Original computerized birth certificate (for males: with the triple number + a copy)

    • National ID card copy

    • 2 military conscription forms for male students

    • Proof of tuition fee payment

    • 40 EGP worth of university stamps purchased from the college treasury

    • Certificate from the employer for children of Tanta University and its affiliated units employees
    """;
  }
}


static String get requiredDocumentsForGraduation {
  if (language == 'ar') {
    return """
    • اخلاء طرف تربية عسكرية للذكور

    • محو الامية

    • سداد الرسوم والمصروفات المقررة
    """;
  } else {
    return """
    • Military service clearance for males

    • Literacy certificate

    • Payment of the prescribed fees and expenses
    """;
  }
}

static String get StudentActivityIntro {
  if (language == 'ar') {
    return """
تنبع أهمية الأنشطة الطلابية في الجامعة من دورها الكبير في تنمية شخصيات ومهارات الطلاب كما أنها تساعدهم بشكل كبير في دخول سوق العمل بعد التخرج، إليك أهم فوائد الأنشطة الطلابية في المرحلة الجامعية:
- العمل الجماعي :
يعمل الطالب مع مجموعة من الأشخاص ضمن فريق وبشكل تطوعي بكامل رغبتهم.
- العلاقات الاجتماعية :
تساعد الأنشطة الطلابية في بناء علاقات اجتماعية مع الكثير من الأشخاص وكسب عادات جيدة والاستفادة منها في مجالات متعددة.
- حلقة وصل بين مرحلة الدراسة الجامعية وسوق العمل :
فهي تساعد في تعزيز وتنمية الكثير من المهارات العملية المطلوبة في سوق العمل.
- تساعد في اكتساب الدبلوماسية :
تساعد الأنشطة الطلابية الطالب الجامعي بتعلم طرق فعالة للتفاهم مع الآخرين وعدم التشبث بالرأي وتنمية مهارات التواصل بشكلٍ فعال.
""";
  } else {
    return """
The importance of student activities in the university stems from their significant role in developing students' personalities and skills, as well as greatly assisting them in entering the job market after graduation. Here are the main benefits of student activities at the university level:
- Teamwork:
Students work with a group of people as a team, volunteering willingly.
- Social relationships:
Student activities help build social relationships with many people, develop good habits, and benefit from them in various fields.
- Bridge between university studies and the job market:
They help enhance and develop many practical skills required in the job market.
- Diplomacy acquisition:
Student activities help university students learn effective ways to communicate with others, avoid clinging to opinions, and develop effective communication skills.
""";
  }
}


static String get activities {
  if (language == 'ar') {
    return """
🎖️مدرسة طنطا الحرفية
- تهتم المدرسة بتعليم الحرف والمهن اليدوية التقليدية والحديثة للشباب، بهدف تنمية مهاراتهم وتشجيعهم على الإبداع والابتكار في مجالات متنوعة مثل النجارة والحدادة والخياطة وغيرها.

🎖️الشبكة الطلابية
- تعتبر الشبكة الطلابية ملتقى للطلاب المبدعين والمهتمين بتطوير أنشطتهم الشخصية والمهنية، حيث تقدم ورش عمل ومحاضرات وفعاليات متنوعة تهدف إلى تنمية مهاراتهم وتطوير قدراتهم القيادية والتواصلية.

🎖️النادي الرياضي
- يوفر النادي الرياضي برامج تدريبية وأنشطة رياضية متنوعة للطلاب، مثل كرة القدم وكرة السلة والتنس وغيرها، بهدف تعزيز اللياقة البدنية وتشجيع ثقافة الرياضة بين الطلاب.

🎖️النادي الثقافي
- ينظم النادي الثقافي فعاليات وأنشطة تثقيفية وثقافية متنوعة، مثل المحاضرات والندوات والمعارض الفنية، بهدف نشر الوعي والمعرفة وتعزيز التفاعل الثقافي بين الطلاب.
""";
  } else {
    return """
🎖️Insider Tanta
- Insider Tanta is considered the first independent student newspaper in the Middle East, spread across many universities, including Tanta University since 2013. It covers news and events from everywhere, especially those related to Tanta University (events, exhibitions, seminars).

🎖️LifeMaker Tanta
- LifeMakers are a charitable and developmental non-profit organization, aiming to spread cooperation, deliver goodness, and help others. Their goals include human development and assisting individuals in developing their capabilities.

🎖️ETL Academy
- ETL Academy is a volunteer organization, non-profit, aiming to assist young people and provide them with the skills needed for the job market, through training and preparing them with a high level of awareness capable of community development. They provide all the required courses for the job market for free and offer assistance to those in need through initiatives and charity activities.

🎖️Hult Prize
- The Hult Prize is an international organization present worldwide, founded in 2009, with the aim of enhancing youth skills in entrepreneurship. It offers an annual competition, one of the largest student competitions globally, to solve social problems based on sustainable development goals and transform young people's ideas into innovative projects.
""";
  }
}
static String get families {
  if (language == 'ar') {
    return """
🎖️لجان الطلاب:
- تشكل لجان الطلاب جزءًا أساسيًا من الحياة الطلابية في الجامعة، حيث تعمل على تنظيم الفعاليات والأنشطة المختلفة التي تهدف إلى خدمة الطلاب وتعزيز التفاعل والتواصل بينهم.

🎖️لجنة الجوالة والخدمات العامة:
- تهتم بتنظيم معسكرات الخدمة العامة والاستقبال والإعداد واختيار عشائر الجوالة، بهدف تعزيز روح الانتماء والتطوع وخدمة المجتمع.

🎖️لجنة الرحلات والنشاطات:
- تعنى بتنظيم رحلات ثقافية ورياضية ومسابقات متنوعة، بهدف تنشيط الحياة الطلابية وتوفير فرص الترفيه والتعلم خارج القاعات الدراسية.

🎖️لجنة الثقافة والفنون:
- تسعى إلى تنظيم فعاليات ثقافية وفنية متنوعة مثل مسابقات القرآن الكريم والأحاديث النبوية والندوات الثقافية والمعارض الفنية، بهدف تنمية مواهب الطلاب وتعزيز الوعي الثقافي.

🎖️لجنة الرياضة واللياقة:
- تهتم بتنظيم الأنشطة والفعاليات الرياضية المختلفة مثل البطولات والمسابقات والتدريبات، بهدف تعزيز اللياقة البدنية وتشجيع الطلاب على ممارسة الرياضة.
""";
  } else {
    return """
🎖️Student Committees:
- Student committees are an essential part of university life, organizing various events and activities aimed at serving students and enhancing interaction and communication among them.

🎖️Youth and Public Services Committee:
- It is responsible for organizing public service camps, reception, preparation, and selecting mobile tribes, aiming to enhance a sense of belonging, volunteering, and community service.

🎖️Trips and Activities Committee:
- It organizes cultural and sports trips, as well as various competitions, to stimulate student life and provide opportunities for entertainment and learning outside the classrooms.

🎖️Culture and Arts Committee:
- It aims to organize various cultural and artistic events such as competitions in Quran and Hadith, cultural seminars, and art exhibitions, to develop students' talents and enhance cultural awareness.

🎖️Sports and Fitness Committee:
- It focuses on organizing various sports activities and events such as tournaments, competitions, and training sessions, aiming to promote physical fitness and encourage students to engage in sports.
""";
  }
}
static String get trainingsIntro {
  if (language == 'ar') {
    return '''
تعتبر الدورات التدريبية أحد الوسائل الفعالة لرفع مستوى الأداء الوظيفي وتطوير المهارات الشخصية والمهنية، حيث تسهم في تنمية الذات وتحسين القدرات والمعرفة للمتدربين. كما توفر الدورات التدريبية فرصة للمتدربين لتعلم أحدث الأساليب والتقنيات في مجال عملهم وتحسين أدائهم في المهام المختلفة.
وتوفر الجامعة مجموعة متنوعة من الدورات التدريبية في مجالات مختلفة، بما في ذلك:
''';
  } else {
    return '''
Training courses play a significant role in enhancing individual performance by developing skills, self-improvement, and providing employees with more confidence in their ability to enhance their professional level. They allow trainees to learn the latest training skills and update their old job skills.

The university provides several centers for offering training courses, including:
''';
  }
}
static List<String> get centerDescriptions {
  if (language == 'ar') {
    return [
      "يقدم المركز بعض من الدورات التدريبية الهامة مع نخبة من الأساتذة الكبار في مختلف المجالات ومن أهم الدورات المتاحة بالمركز:\n\n- اوراكل المسار المالي\n\n- الامن السيبراني\n\n- التسويق الالكتروني\n\n- المحاسب المالي المحترف\n\n- البرمجة\n\n- ايلتس\n\n- مايكروسوفت اوفيس\n\n- التحليل الاحصائي\n\n- الحاسب الالي\n\n- شهادة العمليات المصرفية",
      "وهي مراكز خدمية مجانية بالكامل للطلاب والخريجين في الجامعات المصرية.\n\nهدفها: تأهيل الطالب لسوق العمل وتقديم دورات مجانية في مجالات سوق العمل الأكثر انتشارا وخدمات الدعم المهني للتوظيف وتقديم ورش عمل مجانية في كتابه السيرة الذاتية ومهارات المقابلات الوظيفية والتخطيط المهني وتطوير اللغة الإنجليزية.\n\nويقدم المركز نوعين من الدورات:\n\n1- مهارات التوظيف:\n\nوهو برنامج تدريبي مكثف على مهارات التوظيف، مدته خمس ايام متصلين ، يركز على المهارات التي يكتسبها الطلاب والاتصال والتخطيط وحل المشاكل والعروض التقديمية وبالإضافة لتطوير الوعي الذاتي والتحليل والابتكار ، ومن ميزات التدريب الانشطة التفاعلية، واحتياجاتك، ونموك الشخصي ،ومهاراتك.\n\n2- التدريب الفني:\n\n- المبيعات\n\n- التسويق\n\n- خدمة العملاء\n\n- الموارد البشرية\n\n- إدارة سلسلة التوريدات\n\n- التكنولوجيا المالية\n\n- التسويق الرقمي",
      "يقوم بتقديم بعض الدورات المتخصصة لمختلف المجالات ومن أهمها:\n\n- معايير التقارير المالية الدولية\n\n- المحاسب المالي المحترف\n\n- إدارة الموارد البشرية\n\n- اللغة الانجليزية\n\n- التأهيل لعمل في البنوك\n\n- التأهيل للعمل في البورصة وأسواق المال\n\n- دورات خاصة بالمعهد المصرفي المصري\n\n- المحاسب الاداري المعتمد"
    ];
  } else {
    return [
      "The center offers some important training courses with a distinguished group of professors in various fields. Some of the available courses at the center include:\n\n- Oracle Financial Path\n\n- Cybersecurity\n\n- Digital Marketing\n\n- Certified Financial Accountant\n\n- Programming\n\n- IELTS\n\n- Microsoft Office\n\n- Statistical Analysis\n\n- Computer Skills\n\n- Banking Operations Certificate",
      "These are fully free service centers for students and graduates in Egyptian universities.\n\nTheir goal is to qualify students for the job market and provide free courses in the most common fields of work, professional support services for employment, and provide free workshops in writing resumes, job interview skills, career planning, and English language development.\n\nThe center offers two types of courses:\n\n1- Employment Skills:\n\nIt is an intensive training program on employment skills, lasting for five consecutive days. It focuses on the skills that students acquire in communication, planning, problem-solving, presentations, as well as developing self-awareness, analysis, and innovation. The training features interactive activities, your needs, personal growth, and your skills.\n\n2- Technical Training:\n\n- Sales\n\n- Marketing\n\n- Customer Service\n\n- Human Resources\n\n- Supply Chain Management\n\n- Financial Technology\n\n- Digital Marketing",
      "It offers some specialized courses in various fields, including:\n\n- International Financial Reporting Standards\n\n- Certified Financial Accountant\n\n- Human Resources Management\n\n- English Language\n\n- Qualification for work in banks\n\n- Qualification for work in the stock exchange and financial markets\n\n- Special courses at the Egyptian Banking Institute\n\n- Certified Management Accountant"
    ];
  }
}
static String get mainTitle {
  if (language == 'ar'){
    return 'الرئيسية';
  }else {
return 'Main';
  }
}
static String get about {
  if (language == 'ar'){
    return 'عن الكلية';
  }else {
return 'About';
  }
}
static String get fileds {
  if (language == 'ar'){
    return 'مجالات العمل';
  }else {
return 'Workin fields';
  }
}
static String get credithrs {
  if (language == 'ar'){
    return 'الساعات المعتمدة';
  }else {
return 'Credit Hours';
  }
}
static String get buildings {
  if (language == 'ar'){
    return 'مباني الكلية';
  }else {
return 'Buildings';
  }
}
static String get studySubjects {
  if (language == 'ar'){
    return  'المواد الدراسية';
  }else {
return 'Subjects';
  }
}
static String get chooseSimester {
  if (language == 'ar'){
    return 'اختر الفصل الدراسي';
  }else {
return 'Choose semester';
  }
}
static String get subList {
  if (language == 'ar'){
    return 'قائمة المواد';
  }else {
return 'Subjects List';
  }
}
static String get calcgpa {
  if (language == 'ar'){
    return 'حساب المعدل التراكمي';
  }else {
return 'Calculate GPA';
  }
}
static String get feesAndPayments {
  if (language == 'ar'){
    return 'المصروفات ودفع الكتب';
  }else {
return 'Fees & Payments';
  }
}
static String get fee {
  if (language == 'ar'){
    return 'المصروفات';
  }else {
return 'Fees';
  }
}
static String get booksPayments {
  if (language == 'ar'){
    return 'دفع الكتب';
  }else {
return 'Books Payments';
  }
}
static String get paperWorks {
  if (language == 'ar'){
    return 'الأعمال الورقية';
  }else {
return 'Paper Works';
  }
}
static String get stactivities {
  if (language == 'ar'){
    return 'الأنشطة الطلابية';
  }else {
return 'Student Activities';
  }
}
static String get trainings {
  if (language == 'ar'){
    return 'الدورات التدريبية';
  }else {
return 'Training Courses';
  }
}
static String get creditSys {
  if (language == 'ar'){
    return 'نظام الساعات المعتمدة';
  }else {
return 'Credit Hours';
  }
}
static String get reqPapers {
  if (language == 'ar'){
    return 'الاوراق المطلوبة';
  }else {
return 'Required Papers';
  }
}

}


class studyYear {
  final int year;
  final int simester;
  studyYear(this.year,this.simester);
}