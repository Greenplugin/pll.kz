<?php echo $header; ?>

<!--КАТАЛОГ ТЕХНИКИ-->
<div class="container vehicles-catalog">
  <h3 class="text-center text-uppercase orange-text">Каталог техники</h3>

  <div class="col-sm-3 vehicle-categories">
    <?php foreach ($catlist as $cat) { ?>
      <?php if($cat['id']==$category_id){ ?>
        <a href="<?=$cat['href']?>" class="category-item selected">
          <img src="<?=$cat['image']?>"> <p><?=$cat['name']?></p>
        </a>
      <?php } else { ?>
        <a href="<?=$cat['href']?>" class="category-item">
          <img src="<?=$cat['image']?>"> <p><?=$cat['name']?></p>
        </a>
      <?php }
    } ?>
  </div>
  <div class="col-sm-9">
    <!-- VEHICLES LIST -->
    <div class="vehicles-list">
      <div class="row">
        <?php foreach ($products as $product) { ?>
        <a href="<?=$product['href']?>" class="vehicle-item text-center">
          <img class="img-responsive" src="<?=$product['thumb']?>" alt="Трактор">
          <h4><?=$product['name']?></h4>
        </a>
        <?php } ?>
      </div>
    </div>
    <!-- конец VEHICLES LIST -->
  </div>
</div>

<!-- конец КАТАЛОГ ТЕХНИКИ-->

<?php echo $footer; ?>
