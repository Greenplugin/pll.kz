<?php
if(isset($banners[0])) {
    $banner = $banners[0];
    unset($banners[0]);
?>

<!--MAIN SECTION -->
<div id="carousel-example-generic" class="carousel slide main-section" style="background-image: url(<?=$banner['image']?>);"  data-ride="carousel" data-interval="4000">
    <!-- Indicators -->
<!--    <ol class="carousel-indicators">
        <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
        <li data-target="#carousel-example-generic" data-slide-to="1"></li>
        <li data-target="#carousel-example-generic" data-slide-to="2"></li>
    </ol>-->
    <!-- Wrapper for slides -->
    <div class="carousel-inner" role="listbox">
        <div class="item active">
            <?php $banner['link'] = explode('<newparagraph>',$banner['link']) ?>
            <div class="carousel-content container">
                <div>
                    <?php if(isset($banner['link'][1])) { ?>
                    <div class="animated bounceInDown">
                    <?=$banner['link'][0];?>
                    </div>

                    <div class="animated bounceInRight">
                        <?=$banner['link'][1];?>
                    </div>
                    <a class="btn btn-orange animated bounceInUp" href="<?=$banner['title']?>">Подробнее</a>
                    <?php } ?>
                </div>
            </div>
        </div>
        <?php foreach ($banners as $banner){ ?>
        <div class="item">
            <?php $banner['link'] = explode('<newparagraph>',$banner['link']) ?>
            <div class="carousel-content container">
                <div>
                    <?php if(isset($banner['link'][1])) { ?>
                        <div class="animated bounceInDown">
                            <?=$banner['link'][0];?>
                        </div>

                        <div class="animated bounceInRight">
                            <?=$banner['link'][1];?>
                        </div>
                        <button class="btn btn-orange animated bounceInUp" href="<?=$banner['title']?>">Подробнее</button>
                    <?php } ?>
                </div>
            </div>
        </div>
        <?php } ?> 
    </div>
</div>

<!--MAIN SECTION -->
<!--<div class="main-section white-text text-uppercase" style="background-image: url(<?/*=$banner['image']*/?>);">
    <div class="container">
        <?/*=$banner['link']*/?>
        <a class="btn btn-orange" type="button" href="<?php /*echo $banner['title']; */?>" name="button">Подробнее</a>
    </div>
</div>-->
<!-- конец MAIN SECTION -->

<?php } ?>