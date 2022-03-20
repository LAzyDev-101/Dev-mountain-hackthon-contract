import jsPDF from "jspdf";

const transcriptData = [
  {
    term: "1",
    year: "2017",
    grade: [
      {
        subjectID: "01123412",
        subjectName: "aaaasfasf",
        grade: "A",
        credit: 3,
      },
      {
        subjectID: "01123412",
        subjectName: "aaa",
        grade: "A",
        credit: 3,
      },
      {
        subjectID: "01123412",
        subjectName: "aaaasfasf",
        grade: "A",
        credit: 3,
      },
      {
        subjectID: "01123412",
        subjectName: "aaa",
        grade: "A",
        credit: 3,
      },
    ],
  },
  {
    term: "2",
    year: "2017",
    grade: [
      {
        subjectID: "01123412",
        subjectName: "aaa",
        grade: "A",
        credit: 3,
      },
      {
        subjectID: "01123412",
        subjectName: "aaa",
        grade: "A",
        credit: 3,
      },
    ],
  },
  {
    term: "1",
    year: "2018",
    grade: [
      {
        subjectID: "01123412",
        subjectName: "aaaasfasf",
        grade: "A",
        credit: 3,
      },
      {
        subjectID: "01123412",
        subjectName: "aaa",
        grade: "A",
        credit: 3,
      },
      {
        subjectID: "01123412",
        subjectName: "aaaasfasf",
        grade: "A",
        credit: 3,
      },
      {
        subjectID: "01123412",
        subjectName: "aaa",
        grade: "A",
        credit: 3,
      },
    ],
  },
  {
    term: "2",
    year: "2018",
    grade: [
      {
        subjectID: "01123412",
        subjectName: "aaaasfasf",
        grade: "A",
        credit: 3,
      },
      {
        subjectID: "01123412",
        subjectName: "aaa",
        grade: "A",
        credit: 3,
      },
      {
        subjectID: "01123412",
        subjectName: "aaaasfasf",
        grade: "A",
        credit: 3,
      },
      {
        subjectID: "01123412",
        subjectName: "aaa",
        grade: "A",
        credit: 3,
      },
      {
        subjectID: "01123412",
        subjectName: "aaaasfasf",
        grade: "A",
        credit: 3,
      },
      {
        subjectID: "01123412",
        subjectName: "aaa",
        grade: "A",
        credit: 3,
      },
    ],
  },
  {
    term: "1",
    year: "2019",
    grade: [
      {
        subjectID: "01123412",
        subjectName: "aaaasfasf",
        grade: "A",
        credit: 3,
      },
      {
        subjectID: "01123412",
        subjectName: "aaa",
        grade: "A",
        credit: 3,
      },
      {
        subjectID: "01123412",
        subjectName: "aaaasfasf",
        grade: "A",
        credit: 3,
      },
      {
        subjectID: "01123412",
        subjectName: "aaa",
        grade: "A",
        credit: 3,
      },
    ],
  },
  {
    term: "2",
    year: "2019",
    grade: [
      {
        subjectID: "01123412",
        subjectName: "aaaasfasf",
        grade: "A",
        credit: 3,
      },
      {
        subjectID: "01123412",
        subjectName: "aaa",
        grade: "A",
        credit: 3,
      },
      {
        subjectID: "01123412",
        subjectName: "aaaasfasf",
        grade: "A",
        credit: 3,
      },
      {
        subjectID: "01123412",
        subjectName: "aaa",
        grade: "A",
        credit: 3,
      },
      {
        subjectID: "01123412",
        subjectName: "aaaasfasf",
        grade: "A",
        credit: 3,
      },
      {
        subjectID: "01123412",
        subjectName: "aaa",
        grade: "A",
        credit: 3,
      },
    ],
  },
  {
    term: "1",
    year: "2020",
    grade: [
      {
        subjectID: "01123412",
        subjectName: "aaaasfasf",
        grade: "A",
        credit: 3,
      },
      {
        subjectID: "01123412",
        subjectName: "aaa",
        grade: "A",
        credit: 3,
      },
    ],
  },
  {
    term: "2",
    year: "2020",
    grade: [
      {
        subjectID: "01123412",
        subjectName: "aaaasfasf",
        grade: "A",
        credit: 3,
      },
      {
        subjectID: "01123412",
        subjectName: "aaa",
        grade: "A",
        credit: 3,
      },
      {
        subjectID: "01123412",
        subjectName: "aaaasfasf",
        grade: "A",
        credit: 3,
      },
      {
        subjectID: "01123412",
        subjectName: "aaa",
        grade: "A",
        credit: 3,
      },
      {
        subjectID: "01123412",
        subjectName: "aaaasfasf",
        grade: "A",
        credit: 3,
      },
      {
        subjectID: "01123412",
        subjectName: "aaa",
        grade: "A",
        credit: 3,
      },
      {
        subjectID: "01123412",
        subjectName: "aaaasfasf",
        grade: "A",
        credit: 3,
      },
      {
        subjectID: "01123412",
        subjectName: "aaa",
        grade: "A",
        credit: 3,
      },
    ],
  },
];

const objOne = {
  id: obj.id,
  issuer: {
    name: obj.issuer,
    publicKey: obj.issuerPublicKey,
  },
  verificationType: "onChain",
  student: {
    name: obj.studentName,
  },
  educuation: {
    type: obj.transcriptType,
    data: obj.transcriptData,
  }
};

const generatePDF = (obj) => {
  var doc = new jsPDF();

  doc.setFont("times", "normal");
  doc.text("Faculty of ... .", 100, 15, null, null);
  doc.setFontSize(14);
  doc.text("Name: Mr.A ABC", 25, 25, null, null);
  doc.text("Date of Birth: April,0,1999", 25, 30, null, null);
  doc.text("Student ID: 1212312121", 100, 30, null, null);
  doc.text("Date of Admission: 2017", 25, 35, null, null);
  doc.text("Date of Graduation: 2020", 100, 35, null, null);
  doc.text("Degree: Bachelor Of Engineering", 25, 40, null, null);
  doc.text("Major: Computer Engineering", 25, 45, null, null);

  const lineHeight = 6;
  let startXS1 = 25;
  let startYS1 = 55;
  const smallLineHeight = 4;
  const smallSpace = 25;
  for (var i = 0; i < 8; i++) {
    if (startYS1 >= 230) {
      startXS1 = 110;
      startYS1 = 55;
    }

    doc.setFontSize(14);
    doc.text(
      `${transcriptData[i].term} Semester, Years, ${transcriptData[i].year}`,
      startXS1,
      startYS1,
      null,
      null
    );

    doc.setFontSize(12);
    startYS1 += smallLineHeight;
    var startSmallY = startYS1;
    var startSmallX = startXS1;
    var count = 0;
    transcriptData[i].grade.map((v) => {
      var startSmallX = startXS1;
      startSmallY += smallLineHeight;

      doc.text(`${v.subjectID}`, startSmallX, startSmallY);
      startSmallX += 20;
      doc.text(`${v.subjectName}`, startSmallX, startSmalY);
      startSmallX += 35;
      doc.text(`${v.credit}`, startSmallX, startSmallY);
      startSmallX += 5;
      doc.text(`${v.grade}`, startSmallX, startSmallY);
    });
    startYS1 = startSmallY + 10;
  }
};
