class Notifications < ActionMailer::Base
  def grade_email(grade, gradesheet)
    subject     "#{grade.assignment.name} grade"
    recipients  grade.student.email
    from        "Cory T. Cornelius <Cory.T.Cornelius@dartmouth.edu>"
    body        :assignment => grade.assignment
    attachment  "application/pdf" do |pdf|
      pdf.filename = "#{grade.student.name} - #{grade.assignment.name}.pdf"
      pdf.body = gradesheet
    end
  end
end
