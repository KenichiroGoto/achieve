# ページロード時にCoffeeScriptを読み込ませるコード。
# このコードを入れなかった場合、CoffeeScriptが正しく動作しない場合がある。
# ready = ->
#  処理コード
# $(document).ready(ready)
# $(document).on('page:load', ready)

ready = ->
  $(window).scroll ->                   # <--- JavaScript"function(){}"を、CoffeeSctiptでは"$ ->"で表す。
    element = $('#page-top-btn')        # <--- id:pate-top-btnの要素を取得。
    visible = element.is('.visible')    # <--- 要素の表示・非表示判定。
    height = $(window).scrollTop()      # <--- ページ最上部から何px離れているかを取得
    if height > 400                     # <--- 401px以上離れていたらボタン表示させる。400以下ならボタン非表示。
      element.fadeIn() if !visible
    else
      element.fadeOut()
    
    # blog画面用ページトップボタン処理
    element = $('#blog-page-top-btn')   # <--- id:blog-pate-top-btnの要素を取得。
    visible = element.is('.visible')    # <--- 要素の表示・非表示判定。
    height = $(window).scrollTop()      # <--- ページ最上部から何px離れているかを取得
    if height > 200                     # <--- 201px以上離れていたらボタン表示させる。400以下ならボタン非表示。
      element.fadeIn() if !visible
    else
      element.fadeOut()
    
  $(document).on 'click', '#move-page-top', ->          # <--- クリック時にイベント発生させる書き方 $(document).on 'click' , '#id'はidの要素を取得するコード。
    $('html, body').animate({scrollTop: 0 }, 'slow')
  
  # blog画面用ページトップへ戻る処理   
  $(document).on 'click', '#move-blog-page-top', ->     # <--- クリック時にイベント発生させる書き方 $(document).on 'click' , '#id'はidの要素を取得するコード。
    $('html, body').animate({scrollTop: 0 }, 'slow')
      
$(document).ready(ready)
$(document).on('page:load', ready)