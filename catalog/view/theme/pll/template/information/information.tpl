<?php echo $header; ?>
<div class="content"><!--CONTENT - общий див для контента ниже хедера и выше футера -->
    <div class="container articles">
        <article>
            <h4 class="orange-text"><?=$heading_title?></h4>
                <div class="article-image-left">
                    <img class="img-responsive" src="<?php echo $image; ?>" alt="<?=$heading_title?>">
                </div>
                <p>
                    <?php echo $description; ?>
                </p>
        </article>
    </div>
</div><!-- конец CONTENT -->
<?php echo $footer; ?>