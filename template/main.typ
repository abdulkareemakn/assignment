#import "@local/assignment:0.1.0": report

#show: report.with(
  course_code: "",
  course_name: "",
  assignment_no: "",
  assignment_title: "",
  doc_type: "",
  authors: ((name: "Abdul Kareem", reg: "FA24-BSE-123"),),
  instructor: "",
  date: datetime.today().display("[month repr:long] [day], [year]"),
  show_toc: false,
)
