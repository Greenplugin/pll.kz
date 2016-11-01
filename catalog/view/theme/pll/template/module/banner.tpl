<!-- VIDEO SECTION -->
<?php if(count($banners) > 0){

?>
<div class="video-section white-text">
    <div class="container">
        <h2 class="text-uppercase"><?=$banners[0]['name']?></h2>
        <br>
        <div class="row">
            <div class="col-sm-5">
                <ul class="text-uppercase">
                    <?php foreach ($banners as $key => $banner) { ?>
                        <?php if ($banner['link']) {
                            $banner['link'] = str_replace('watch?v=', 'embed/', $banner['link']);
                            $banners[$key]['link']= $banner['link'];
                            ?>
                            <li><a data-href="<?php echo $banner['link']; ?>" href="#"><?php echo $banner['title']; ?></a></li>
                        <?php } ?>
                    <?php } ?>
                </ul>
            </div>
            <div class="col-sm-7">
                <div class="video">
                    <iframe id="video-frame" width="100%" height="100%" src="<?=$banners[0]['link']?>" frameborder="0" allowfullscreen></iframe>
                    <!--<iframe width="100%" height="100%"
                            src="<?=$banners[0]['link']?>" allowfullscreen frameborder="0">
                    </iframe>-->
                </div><!--video-->
            </div><!--col-sm-9-->
        </div><!--row-->
    </div><!--container-->
</div>
    <script >
            $('.video-section li a').click(function () {
                $('#video-frame').attr('src',$(this).data('href'));
                return false;
            });
    </script>
<?php } ?>
<!-- конец VIDEO SECTION -->