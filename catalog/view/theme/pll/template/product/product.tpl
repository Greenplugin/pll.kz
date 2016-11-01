<?php echo $header; ?>

<?php
$attr = [];
$attr_count = 10;
foreach ($attribute_groups as $attributes) {
  foreach ($attributes['attribute'] as $attribute) {
    $attr[] = $attribute;
  }
}
if($attr_count > count($attr)){
  $attr_count = count($attr);
}
?>


<div class="content"><!--CONTENT - общий див для контента ниже хедера и выше футера -->
<!--Хлебные крошки-->
<br>
<div class="container">
  <ol class="breadcrumb pull-right">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
      <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ol>

  <!-- ФОТО И ОПИСАНИЕ ТЕХНИКИ -->
  <div class="container vehicles-summary">
    <div class="row">
      <!--Image-->
      <?php if ($thumb) { ?>
      <div class="col-sm-6 vehicle-image">
        <div class="my-gallery">
          <div class="images">

            <a href="<?php echo $popup; ?>" itemprop="image" class="woocommerce-main-image zoom" >
              <img src="<?php echo $popup; ?>" alt="<?php echo $heading_title; ?>" class="attachment-shop_single size-shop_single wp-post-image img-responsive">
            </a>

            <div class="thumbnails">
              <a href="<?php echo $popup; ?>" class="zoom first" data-rel="prettyPhoto[product-gallery]">
                <img src="<?php echo $popup; ?>" alt="<?php echo $heading_title; ?>" class="attachment-shop_thumbnail size-shop_thumbnail">
              </a>
              <?php foreach ($images as $image) { ?>
                <a href="<?php echo $image['popup']; ?>" class="zoom first" data-rel="prettyPhoto[product-gallery]">
                  <img src="<?php echo $image['thumb']; ?>" title="<?php echo $heading_title; ?>" class="attachment-shop_thumbnail size-shop_thumbnail" srcset="<?php echo $image['popup']; ?>" alt="<?php echo $heading_title; ?>">
                </a>
              <?php } ?>
            </div>

          </div>
        </div>
      </div>
      <!--Summary-->
      <div class="col-sm-6">
      <?php } else {?>
      <div class="col-sm-12">
      <?php }  ?>
        <h2 class="orange-text"><?php echo $heading_title; ?></h2>
        <div class="table-responsive">
          <table class="table product-sumary">
            <?php for($i = 0; $i<$attr_count; $i++){ ?>
              <tr>
                <td><?=$attr[$i]['name']?></td>
                <td><?=$attr[$i]['text']?></td>
              </tr>
            <?php } ?>
          </table>
        </div>
      </div>
    </div>
  </div>
  <!-- конец ФОТО И ОПИСАНИЕ ТЕХНИКИ -->

  <div class="container vehicles-menu text-center"><!-- Меню -->
    <ul class="nav nav-tabs" role="tablist">
      <li role="presentation" class="active"><p><a href="#home" aria-controls="home" role="tab" data-toggle="tab">Описание</a></p></li>
      <li role="presentation"><p><a href="#profile" aria-controls="profile" role="tab" data-toggle="tab">Характеристики</a></p></li>
      <li role="presentation"><p><a href="#messages" aria-controls="messages" role="tab" data-toggle="tab">Отзывы</a></p></li>
    </ul>
  </div>
    <div class="tab-content container"><!-- Содержимое табов -->
      <div role="tabpanel" class="tab-pane active" id="home">
        <?=$description ?>
      </div>
      <div role="tabpanel" class="tab-pane" id="profile">
        <div class="table-responsive">
          <table class="table table-striped">
            <thead>
            <tr>
              <th>Параметр</th>
              <th>Значение</th>
            </tr>
            </thead>
            <tbody>
            <?php foreach ($attr as $attribute) { ?>
              <tr>
                <td><?=$attribute['name']?></td>
                <td><?=$attribute['text']?></td>
              </tr>
            <?php }?>
            </tbody>
          </table>
        </div>
      </div>
      <div role="tabpanel" class="tab-pane" id="messages">
        <?php if ($review_status) { ?>
          <div class="tab-pane" id="tab-review">
            <form class="form-horizontal" id="form-review">
              <div id="review"></div>
              <h2><?php echo $text_write; ?></h2>
              <?php if ($review_guest) { ?>
                <div class="form-group required">
                  <div class="col-sm-12">
                    <label class="control-label" for="input-name"><?php echo $entry_name; ?></label>
                    <input type="text" name="name" value="<?php echo $customer_name; ?>" id="input-name" class="form-control" />
                  </div>
                </div>
                <div class="form-group required">
                  <div class="col-sm-12">
                    <label class="control-label" for="input-review"><?php echo $entry_review; ?></label>
                    <textarea name="text" rows="5" id="input-review" class="form-control"></textarea>
                    <!--<div class="help-block"><?php /*echo $text_note; */?></div>-->
                  </div>
                </div>
                <div class="form-group required">
                  <div class="col-sm-12">
                    <label class="control-label"><?php echo $entry_rating; ?></label>
                    &nbsp;&nbsp;&nbsp; <?php echo $entry_bad; ?>&nbsp;
                    <input type="radio" name="rating" value="1" />
                    &nbsp;
                    <input type="radio" name="rating" value="2" />
                    &nbsp;
                    <input type="radio" name="rating" value="3" />
                    &nbsp;
                    <input type="radio" name="rating" value="4" />
                    &nbsp;
                    <input type="radio" name="rating" value="5" />
                    &nbsp;<?php echo $entry_good; ?></div>
                </div>
                <?php echo $captcha; ?>
                <div class="buttons clearfix">
                  <div class="pull-right">
                    <button type="button" id="button-review" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-primary"><?php echo $button_continue; ?></button>
                  </div>
                </div>
              <?php } else { ?>
                <?php echo $text_login; ?>
              <?php } ?>
            </form>
          </div>
        <?php } ?>
      </div>
    </div>
    <!--конец Меню каталога техники и табы -->



</div>
<!--конец Хлебные крошки-->

</div>

  <script type="text/javascript"><!--
    $('#review').delegate('.pagination a', 'click', function(e) {
      e.preventDefault();

      $('#review').fadeOut('slow');

      $('#review').load(this.href);

      $('#review').fadeIn('slow');
    });

    $('#review').load('index.php?route=product/product/review&product_id=<?php echo $product_id; ?>');

    $('#button-review').on('click', function() {
      $.ajax({
        url: 'index.php?route=product/product/write&product_id=<?php echo $product_id; ?>',
        type: 'post',
        dataType: 'json',
        data: $("#form-review").serialize(),
        beforeSend: function() {
          $('#button-review').button('loading');
        },
        complete: function() {
          $('#button-review').button('reset');
        },
        success: function(json) {
          $('.alert-success, .alert-danger').remove();

          if (json['error']) {
            $('#review').after('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '</div>');
          }

          if (json['success']) {
            $('#review').after('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '</div>');

            $('input[name=\'name\']').val('');
            $('textarea[name=\'text\']').val('');
            $('input[name=\'rating\']:checked').prop('checked', false);
          }
        }
      });
    });

    $(document).ready(function() {

      /* код для переключения картинок на странице одного товара */
      var gallery = document.getElementsByClassName('my-gallery')[0],
          galleryAnchor = gallery.getElementsByClassName('zoom'),
          mainImg = gallery.getElementsByClassName('woocommerce-main-image')[0].children;

      for(var i =0; i < galleryAnchor.length; i++) {
        galleryAnchor[i].addEventListener('click', function (event) {
          event.preventDefault();

          mainImg[0].removeAttribute('srcset');

          var image = this.getAttribute('href');
          mainImg[0].src = image;

          return false;
        });
      }
      /* конец код для переключения картинок на странице одного товара */
    });
    //--></script>

<?php echo $footer; ?>
