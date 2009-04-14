module AssignmentsHelper
  def add_question_link(text, form_builder)
    link_to_function text do |page|
      form_builder.fields_for :questions, Question.new, :child_index => 'NEW_RECORD' do |f|
        html = render(:partial => 'question', :locals => { :form => f })
        page << "$('#questions').append('#{escape_javascript(html)}'.replace(/NEW_RECORD/g, new Date().getTime()));"
      end
    end
  end
  
  def remove_question_link(form_builder)
    if form_builder.object.new_record?
      # If the question is a new record, we can just remove the div from the dom
      link_to_function("remove", "$(this).parent('.question').remove();");
    else
      # However if it's a "real" record it has to be deleted from the database,
      # for this reason the new fields_for, accept_nested_attributes helpers give us _delete,
      # a virtual attribute that tells rails to delete the child record.
      form_builder.hidden_field(:_delete, :value => '') +
      link_to_function("remove", "$(this).parent('.question').hide(); $(this).prev().attr('value', '1');")
    end
  end 
end
