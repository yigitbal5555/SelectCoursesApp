import 'package:flutter/material.dart';

void main() {
  runApp(LoginScreen());
}

class Student {
  String firstName;
  String lastName;
  String email;
  double gpa;

  Student(this.firstName, this.lastName, this.email, this.gpa);
}

class LoginScreen extends StatelessWidget {
  List<Student> students = [
    //
  ];

  List<Student> sortedStudents = [];
  List<double> sortedGPAs = [];

  LoginScreen() {
    sortedStudents = List.from(students)
      ..sort((a, b) => b.gpa.compareTo(a.gpa));

    sortedGPAs = List.from(sortedStudents.map((student) => student.gpa))
      ..sort((a, b) => b.compareTo(a));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Öğrenci Girişi'),
        ),
        body: Container(
          padding: EdgeInsets.all(16.0),
          child: LoginForm(sortedStudents, sortedGPAs),
        ),
      ),
    );
  }
}

class LoginForm extends StatefulWidget {
  final List<Student> students;
  final List<double> studentGPAs;

  LoginForm(this.students, this.studentGPAs);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController gpaController = TextEditingController();

  void login() {
    //
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => LessonsPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: firstNameController,
          decoration: InputDecoration(
            labelText: 'İsim',
          ),
        ),
        TextField(
          controller: lastNameController,
          decoration: InputDecoration(
            labelText: 'Soyisim',
          ),
        ),
        TextField(
          controller: emailController,
          decoration: InputDecoration(
            labelText: 'E-posta',
          ),
        ),
        TextField(
          controller: gpaController,
          decoration: InputDecoration(
            labelText: 'GPA',
          ),
        ),
        SizedBox(height: 16.0),
        for (int i = 0; i < widget.students.length; i++)
          Text(
              '${widget.students[i].firstName} ${widget.students[i].lastName}: ${widget.studentGPAs[i]}'),
        SizedBox(height: 16.0),
        ElevatedButton(
          onPressed: login,
          child: Text('Giriş Yap'),
        ),
      ],
    );
  }
}

class LessonsPage extends StatelessWidget {
  List<String> lessons = [
    'Biyomedikal Mühendisliği / Biomedical Engineering',
    'Elektrik-Elektronik Mühendisliği / Electrical and Electronics Engineering',
    'Harita Mühendisliği / Geomatics Engineering',
    'İnşaat Mühendisliği / Civil Engineering',
    'Makine Mühendisliği / Mechanical Engineering',
    'Mekatronik Mühendisliği / Mechatronics Engineering',
    'Metalurji ve Malzeme Mühendisliği / Metalurgical and Material Engineering',
    'Petrol ve Doğalgaz Mühendisliği / Petroleum and Natural Gas Engineering',
    //
  ];

  void handleEvetButton(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => LessonsSelectionPage(),
      ),
    );
  }

  void handleHayirButton(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
              'Ders Seçimi için 150 AKTS\'yi Tamamlamanız Gerekmektedir !'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Tamam'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ders Seçimi'),
      ),
      body: Column(
        children: [
          ListTile(
            title: Text('150 AKTS\'yi Tamamladınız mı?'),
          ),
          ElevatedButton(
            onPressed: () => handleEvetButton(context),
            child: Text('Evet'),
          ),
          ElevatedButton(
            onPressed: () => handleHayirButton(context),
            child: Text('Hayır'),
          ),
        ],
      ),
    );
  }
}

class LessonsSelectionPage extends StatelessWidget {
  List<String> lessons = [
    'Biyomedikal Mühendisliği / Biomedical Engineering',
    'Elektrik-Elektronik Mühendisliği / Electrical and Electronics Engineering',
    'Harita Mühendisliği / Geomatics Engineering',
    'İnşaat Mühendisliği / Civil Engineering',
    'Makine Mühendisliği / Mechanical Engineering',
    'Mekatronik Mühendisliği / Mechatronics Engineering',
    'Metalurji ve Malzeme Mühendisliği / Metalurgical and Material Engineering',
    'Petrol ve Doğalgaz Mühendisliği / Petroleum and Natural Gas Engineering',
    // Add other lessons here.
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ders Seçimi'),
      ),
      body: ListView.builder(
        itemCount: lessons.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(lessons[index]),
            onTap: () {
              if (lessons[index] ==
                  'Biyomedikal Mühendisliği / Biomedical Engineering') {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BiomedicalEngineeringPage(),
                  ),
                );
              } else if (lessons[index] ==
                  'Elektrik-Elektronik Mühendisliği / Electrical and Electronics Engineering') {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ElectricalEngineeringPage(),
                  ),
                );
              } else if (lessons[index] ==
                  'Harita Mühendisliği / Geomatics Engineering') {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => GeomaticsEngineeringPage(),
                  ),
                );
              } else if (lessons[index] ==
                  'İnşaat Mühendisliği / Civil Engineering') {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CivilEngineeringPage(),
                  ),
                );
              } else if (lessons[index] ==
                  'Makine Mühendisliği / Mechanical Engineering') {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MechanicalEngineeringPage(),
                  ),
                );
              } else if (lessons[index] ==
                  'Mekatronik Mühendisliği / Mechatronics Engineering') {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MechatronicsEngineeringPage(),
                  ),
                );
              } else if (lessons[index] ==
                  'Metalurji ve Malzeme Mühendisliği / Metalurgical and Material Engineering') {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MetalurgicalEngineeringPage(),
                  ),
                );
              } else if (lessons[index] ==
                  'Petrol ve Doğalgaz Mühendisliği / Petroleum and Natural Gas Engineering') {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PetroleumEngineeringPage(),
                  ),
                );
              } else {
                //
                //
              }
            },
          );
        },
      ),
    );
  }
}

class BiomedicalEngineeringPage extends StatelessWidget {
  List<String> ahmetHocaLessons = [
    'Şube1: Doç. Dr. Yalçın İşler (40/40)',
    'Açıklama:',
    'Grup#1: Doç. Dr. Yalçın İŞLER, Fiziksel İnsan Robot Etkileşimi İçin İstek Tanımlama ve Robot Manipülatörler Üzerinde Uygulanması',
  ];

  List<String> mehmetHocaLessons = [
    'Şube7: Dr. Öğr. Üyesi Serkan KARAKIŞ (40/40)',
    'Açıklama:',
    'Grup#7: Dr. Öğr. Üyesi Serkan KARAKIŞ, Sensörler ve programlama kullanılarak mesafe ve yön tayini',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Biyomedikal Mühendisliği / Biomedical Engineering'),
      ),
      body: Column(
        children: [
          ListTile(
            title: Text('1.Seçenek'),
          ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: ahmetHocaLessons.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(ahmetHocaLessons[index]),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FinalPage(),
                    ),
                  );
                  //
                },
              );
            },
          ),
          ListTile(
            title: Text('2.Seçenek'),
          ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: mehmetHocaLessons.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(mehmetHocaLessons[index]),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FinalPage(),
                    ),
                  );
                  //
                },
              );
            },
          ),
        ],
      ),
    );
  }
}

class ElectricalEngineeringPage extends StatelessWidget {
  List<String> huseyinHocaLessons = [
    'Şube8: Dr. Öğr. Üyesi Hüseyin YEŞİLYURT (40/40)',
    'Açıklama:',
    'Grup#8: Dr. Öğr. Üyesi Hüseyin YEŞİLYURT, Sensörler ve programlama kullanılarak mesafe ve yön tayini',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            'Elektrik-Elektronik Mühendisliği / Electrical and Electronics Engineering'),
      ),
      body: ListView.builder(
        itemCount: huseyinHocaLessons.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(huseyinHocaLessons[index]),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FinalPage(),
                ),
              );
              //
            },
          );
        },
      ),
    );
  }
}

class GeomaticsEngineeringPage extends StatelessWidget {
  List<String> ermanHocaLessons = [
    'Şube3: Dr. Öğr. Üyesi Erman YÜCEER (40/40)',
    'Açıklama:',
  ];

  List<String> serkanHocaLessons = [
    'Şube5: Dr. Öğr. Üyesi Serkan GÜNEŞ (40/40)',
    'Açıklama:',
    'Grup#5: Dr. Öğr. Üyesi Serkan GÜNEŞ, Yükseklik Modelleri ve Dijital Yüzey Analizi',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Harita Mühendisliği / Geomatics Engineering'),
      ),
      body: Column(
        children: [
          ListTile(
            title: Text('1.Seçenek'),
          ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: ermanHocaLessons.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(ermanHocaLessons[index]),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FinalPage(),
                    ),
                  );
                  //
                },
              );
            },
          ),
          ListTile(
            title: Text('2.Seçenek'),
          ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: serkanHocaLessons.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(serkanHocaLessons[index]),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FinalPage(),
                    ),
                  );
                  //
                },
              );
            },
          ),
        ],
      ),
    );
  }
}

class CivilEngineeringPage extends StatelessWidget {
  List<String> ermanHocaLessons = [
    'Şube2: Dr. Öğr. Üyesi Erman ÜLKER (40/40)',
    'Açıklama:',
    'Grup#2: Dr. Öğr. Üyesi Erman ÜLKER, Yapı Staj Raporu Hazırlama ve Sunum Teknikleri',
  ];

  List<String> serkanHocaLessons = [
    'Şube4: Dr. Öğr. Üyesi Serkan KARAKIŞ (40/40)',
    'Açıklama:',
    'Grup#4: Dr. Öğr. Üyesi Serkan KARAKIŞ, Yapı Dinamiği ve Deprem Analizi',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('İnşaat Mühendisliği / Civil Engineering'),
      ),
      body: Column(
        children: [
          ListTile(
            title: Text('1.Seçenek'),
          ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: ermanHocaLessons.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(ermanHocaLessons[index]),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FinalPage(),
                    ),
                  );
                  //
                },
              );
            },
          ),
          ListTile(
            title: Text('2.Seçenek'),
          ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: serkanHocaLessons.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(serkanHocaLessons[index]),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FinalPage(),
                    ),
                  );
                  //
                },
              );
            },
          ),
        ],
      ),
    );
  }
}

class MechanicalEngineeringPage extends StatelessWidget {
  List<String> ebubekirHocaLessons = [
    'Şube6: Dr. Öğr. Üyesi Ebubekir ATAN (40/40)',
    'Açıklama:',
    'Grup#6: Dr. Öğr. Üyesi Ebubekir ATAN, Termodinamik Uygulamaları',
  ];

  List<String> serkanHocaLessons = [
    'Şube8: Dr. Öğr. Üyesi Serkan KARAKIŞ (40/40)',
    'Açıklama:',
    'Grup#8: Dr. Öğr. Üyesi Serkan KARAKIŞ, Akışkanlar Mekaniği ve Pompa Seçimi',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Makine Mühendisliği / Mechanical Engineering'),
      ),
      body: Column(
        children: [
          ListTile(
            title: Text('1.Seçenek'),
          ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: ebubekirHocaLessons.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(ebubekirHocaLessons[index]),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FinalPage(),
                    ),
                  );
                  //
                },
              );
            },
          ),
          ListTile(
            title: Text('2.Seçenek'),
          ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: serkanHocaLessons.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(serkanHocaLessons[index]),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FinalPage(),
                    ),
                  );
                  //
                },
              );
            },
          ),
        ],
      ),
    );
  }
}

class MechatronicsEngineeringPage extends StatelessWidget {
  List<String> erkinHocaLessons = [
    'Şube2: Doç. Dr. Erkin GEZGİN (40/40)',
    'Açıklama:',
    'Grup#2: Doç. Dr. Erkin GEZGİN, Otomasyon Sistemleri ve Endüstriyel Robotlar',
  ];

  List<String> serkanHocaLessons = [
    'Şube4: Dr. Öğr. Üyesi Serkan KARAKIŞ (40/40)',
    'Açıklama:',
    'Grup#4: Dr. Öğr. Üyesi Serkan KARAKIŞ, Endüstriyel Otomasyon Uygulamalarında PLC Programlama',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mekatronik Mühendisliği / Mechatronics Engineering'),
      ),
      body: Column(
        children: [
          ListTile(
            title: Text('1.Seçenek'),
          ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: erkinHocaLessons.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(erkinHocaLessons[index]),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FinalPage(),
                    ),
                  );
                  //
                },
              );
            },
          ),
          ListTile(
            title: Text('2.Seçenek'),
          ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: serkanHocaLessons.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(serkanHocaLessons[index]),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FinalPage(),
                    ),
                  );
                  //
                },
              );
            },
          ),
        ],
      ),
    );
  }
}

class MetalurgicalEngineeringPage extends StatelessWidget {
  List<String> mucahitHocaLessons = [
    'Şube5: Dr. Öğr. Üyesi Mücahit SÜTÇÜ (40/40)',
    'Açıklama:',
    'Grup#5: Dr. Öğr. Üyesi Mücahit SÜTÇÜ, Metalurji ve Malzeme Mühendisliğinde Isıl İşlem Uygulamaları',
  ];

  List<String> serkanHocaLessons = [
    'Şube7: Dr. Öğr. Üyesi Serkan KARAKIŞ (40/40)',
    'Açıklama:',
    'Grup#7: Dr. Öğr. Üyesi Serkan KARAKIŞ, Metalurji ve Malzeme Mühendisliğinde Kompozit Malzemeler',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            'Metalurji ve Malzeme Mühendisliği / Metalurgical and Material Engineering'),
      ),
      body: Column(
        children: [
          ListTile(
            title: Text('1.Seçenek'),
          ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: mucahitHocaLessons.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(mucahitHocaLessons[index]),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FinalPage(),
                    ),
                  );

                  //
                },
              );
            },
          ),
          ListTile(
            title: Text('2.Seçenek'),
          ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: serkanHocaLessons.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(serkanHocaLessons[index]),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FinalPage(),
                    ),
                  );
                  //
                },
              );
            },
          ),
        ],
      ),
    );
  }
}

class PetroleumEngineeringPage extends StatelessWidget {
  List<String> canHocaLessons = [
    'Şube 5 (Doç. Dr. Can POLAT) (40/40)',
    'Açıklama:',
    'Grup#5: Doç. Dr. Can POLAT,  Sondaj Akışkanlarının Reolojik Özelliklerinin Belirlenmesi ve Sirkülasyon sistemindeki Basınç Kayıplarının Hesaplanması',
  ];

  List<String> serkanHocaLessons = [
    'Şube 7 (Dr. Öğr. Üyesi Serkan KARAKIŞ) (40/40)',
    'Açıklama:',
    'Grup#7: Dr. Öğr. Üyesi Serkan KARAKIŞ, Sensörler ve programlama kullanılarak mesafe ve yön tayini',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            'Petrol ve Doğalgaz Mühendisliği / Petroleum and Natural Gas Engineering'),
      ),
      body: Column(
        children: [
          ListTile(
            title: Text('1.Seçenek'),
          ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: canHocaLessons.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(canHocaLessons[index]),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FinalPage(),
                    ),
                  );
                  //
                },
              );
            },
          ),
          ListTile(
            title: Text('2.Seçenek'),
          ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: serkanHocaLessons.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(serkanHocaLessons[index]),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FinalPage(),
                    ),
                  );
                  //
                },
              );
            },
          ),
        ],
      ),
    );
  }
}

class FinalPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Final Page'),
      ),
      body: Center(
        child: Text(
          'Tebrikler, Ders Seçiminiz Tamamladınız.',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
