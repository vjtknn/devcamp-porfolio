jQuery(document).on 'turbolinks:load', ->
  comments = $('#comments')
  if comments.length > 0
    App.global_chat = App.cable.subscriptions.create {
      channel: "PostsChannel"
      post_id: comments.data('post-id')
    },
    connected: ->
    disconnected: ->
    received: (data) ->
      comments.append data['comment']
    send_comment: (comment, post_id) ->
      @perform 'send_comment', comment: comment, post_id: post_id
  $('#new_comment').submit (e) ->
    $this = $(this)
    text_area = $this.find('#comment_content')
    if $.trim(text_area.val()).length > 1
      App.global_chat.send_comment text_area.val(),
      comments.data('post-id')
      text_area.val('')
    e.preventDefault()
    return false  
