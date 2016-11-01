<!-- VEHICLES LIST -->
<div class="vehicles-list-on-main container">
    <h3 class="text-uppercase text-center orange-text">Каталог техники</h3>
    <?php foreach ($categories as $category) { ?>
        <div class="vehicles-list-col">
            <a href="<?php echo $category['href']; ?>" class="vehicles-list-item">
                <img src="<?php echo $category['image']; ?>" class="img-responsive" alt="<?php echo $category['name']; ?>">
                <h4><?php echo $category['name']; ?></h4>
            </a>
        </div>
    <?php } ?>
</div>
<!-- конец VEHICLES LIST -->

