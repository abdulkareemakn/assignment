#import "@local/assignment:0.2.0": report

#show: report.with(
  course_code: "",
  course_name: "",
  doc_type: "",
  assignment_no: "",
  assignment_title: "",
  authors: ((name: "Abdul Kareem", reg: "FA24-BSE-123"),),
  instructor: "",
  date: datetime.today().display("[month repr:long] [day], [year]"),
  show_toc: false,
  show_page_numbers: false,
)
