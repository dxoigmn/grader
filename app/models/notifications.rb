class Notifications < ActionMailer::Base
  def grade_email(student, assignment)
    subject     "#{assignment.name} grade"
    recipients  student.email
    from        "Cory T. Cornelius <Cory.T.Cornelius@dartmouth.edu>"
    body        :assignment => assignment
    attachment "application/pdf" { |a|
          a.body = generate_your_pdf_here()
        end
  end
end
