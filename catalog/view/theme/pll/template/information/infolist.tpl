<?php echo $header; ?>
<div class="content"><!--CONTENT - общий див для контента ниже хедера и выше футера -->
    <div class="container articles">
<?php
$i = 0;
$month = [
    'null',
    'Января',
    'Февраля',
    'Марта',
    'Апреля',
    'Мая',
    'Июня',
    'Июля',
    'Августа',
    'Сентября',
    'Октября',
    'Ноября',
    'Декабря'
];
foreach($informations as $information){
    $information['date'] = date_parse($information['date']);
    $i++;
    $count = 1800;
    $information['content'] = explode('[@more;]', $information['content'])[0];
    $information['content'] = str_replace('</div><br/>','[@br;]', $information['content']);
    $information['content'] = str_replace("</div>\r<br/>",'[@br;]', $information['content']);
    $information['content'] = str_replace("</div>\n<br/>",'[@br;]', $information['content']);
    $information['content'] = str_replace("</div>\r\n<br/>",'[@br;]', $information['content']);
    $information['content'] = str_replace('<p>','', $information['content']);
    $information['content'] = str_replace('<div>','', $information['content']);
    $information['content'] = str_replace('</p>','[@br;]', $information['content']);
    $information['content'] = str_replace('</div>','[@br;]', $information['content']);
    $information['content'] = str_replace('<br/>','[@br;]', $information['content']);
    $information['content'] = str_replace('<br>','[@br;]', $information['content']);
    $information['content'] = strip_tags($information['content']);
   /* $information['content'] = str_replace("\r",'', $information['content']);
    $information['content'] = str_replace("\n",'', $information['content']);*/
    $information['content'] = explode('[@br;]', $information['content']);
    $content = [];
    $c =0;$d =0;$r =0;
    foreach ($information['content'] as $paragraph){
        $r++;
        $c += strlen($paragraph);
        if($c >= $count){
            if (($c - $count) < ($count - $d)){
                if($r == 1){
                    $content[] = mb_substr($paragraph,0,$count);
                    break;
                }else{
                    $content[] = $paragraph;
                    break;
                }
            }else{
                break;
            }
        } else {
            $content[] = $paragraph;
            $d += strlen($paragraph);
        }
    }


    $information['content'] = implode('<br/>',$content);

    $addClass = ['',''];
    if ($i%2==0) $addClass = ['col-md-push-7','col-md-pull-5']
    ?>
        <article>
            <a href="<?=$information['href'];?>"><h4 class="orange-text"><?=$information['title']?></h4></a>
            <div class="row">
                <div class="col-md-5 <?=$addClass[0];?>">
                    <div class="article-date">
                        <p><?=$information['date']['day'];?></p>
                        <p><?=$month[$information['date']['month']];?></p>
                        <p><?=$information['date']['year'];?></p>
                    </div>
                    <img class="img-responsive" src="<?=$information['image'];?>" alt="Трактор">
                </div>
                <div class="col-md-7  <?=$addClass[1];?>" style="text-align: justify">
                    <?=$information['content']; ?>
                </div>
            </div>
        </article>
<?php }?>

    </div>
</div><!-- конец CONTENT -->
<?php echo $footer; ?>