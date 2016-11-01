
</div><!-- конец CONTENT -->

<footer>
  <div class="container">
    <div class="left-cols">
      <div class="menu">
        <h4>Меню</h4>
        <a href="#">Главная</a>
        <a href="#">О нас</a>
        <a href="#">Лизинг</a>
        <a href="#">Новости</a>
        <a href="#">Контакты</a>
        <a href="#">Каталог</a>
      </div>
      <div class="products-list">
        <h4>Каталог продукции</h4>
          <?php foreach($categories as $category){ ?>
             <a href="<?=$category['href']?>"><?=$category['name']?></a>
          <?php } ?>
      </div>
      <div class="logo-parallel">
        <img src="<?=$p_logo?>" class="img-responsive">
      </div>
    </div>
    <div class="right-cols">
      <div class="address">
        <h4>Адрес</h4>
        <p><?=$address?></p>
      </div>
      <div class="contacts">
        <h4>Свяжитесь с нами</h4>
        <?php
        $telephone = explode(';',$telephone);
        ?>
        <p>Телефоны: <br>
          <?php if(isset($telephone[0])){ ?>
            <?=$telephone[0]?><br>
          <?php }?>
          <?php if(isset($telephone[1])){ ?>
            <?=$telephone[1]?><br>
          <?php }?>
          <?php if(isset($telephone[2])){ ?>
            <?=$telephone[2]?><br>
          <?php }?>
      </div>
    </div>

    <div class="row"><div style="color: #fff; margin: 0;" class="col-md-12 text-center">Разработано <a target="_blank" href="https://b-link.kz">blink</a></div></div>

  </div>
</footer>

<script type="text/javascript">
  $(document).ready(function () {

    /* код для реализации sticky-навбара */
    var menu = $('.navbar');
    var origOffsetY = menu.offset().top;

    function scroll() {
      if ($(window).scrollTop() >= origOffsetY) {
        $('.navbar').addClass('sticky');
        $('.content').addClass('content-padding');
      } else {
        $('.navbar').removeClass('sticky');
        $('.content').removeClass('content-padding');
      }
    }

    document.onscroll = scroll;
    /* конец код для реализации sticky-навбара */
  });
</script>
<script type="text/javascript" src="https://callback.blink.kz/client/script/GET/"></script>

<?php foreach ($analytics as $analytic) { ?>
  <?php echo $analytic; ?>
<?php } ?>
</body></html>