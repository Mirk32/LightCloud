module MessagesHelper
  def messages_tree_for(messages)
    #On each iteration, take a message and its children storing it in the message and nested_messages variables
    messages.map do |message, nested_messages| #
      render(message) +
          if nested_messages.size > 0 # heck if there are any more nested comments for current message
            nested_messages = Hash[nested_messages.to_a.reverse] # Comments for message should be reversed,
                                                                # so we convert hash into array, reverse it and convert back into hash
            content_tag(:div, messages_tree_for(nested_messages), class: "replies") # wrap nested comment into div.replies
          else
            nil # stop recursion if there is no more nested comments
          end
    end.join.html_safe
  end
end
