class Notifications < ActionMailer::Base
  def grade_email(student, assignment, gradesheet)
    subject     "#{assignment.name} grade"
    recipients  student.email
    from        "Cory T. Cornelius <Cory.T.Cornelius@dartmouth.edu>"
    body        :assignment => assignment
    attachment  "application/pdf" do |pdf|
      pdf.filename = "#{student.name} - #{assignment.name}.pdf"
      pdf.body = gradesheet
    end
  end
end
