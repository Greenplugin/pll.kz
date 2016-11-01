<!DOCTYPE html>
<!--[if IE]><![endif]-->
<!--[if IE 8 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie8"><![endif]-->
<!--[if IE 9 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie9"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">
<!--<![endif]-->
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title><?php echo $title; ?></title>
  <base href="<?php echo $base; ?>" />
  <?php if ($description) { ?>
    <meta name="description" content="<?php echo $description; ?>" />
  <?php } ?>
  <?php if ($keywords) { ?>
    <meta name="keywords" content= "<?php echo $keywords; ?>" />
  <?php } ?>

  <script src="/catalog/view/javascript/prefix.js" type="text/javascript"></script>
  <link href='https://fonts.googleapis.com/css?family=PT+Sans:400,400italic,700,700italic' rel='stylesheet' type='text/css'>
  
  <link href="/catalog/view/theme/pll/stylesheet/bootstrap.min.css" rel="stylesheet" media="screen" />
  <link href="/catalog/view/theme/pll/stylesheet/styles.css" rel="stylesheet" media="screen" />

  <?php foreach ($styles as $style) { ?>
    <link href="<?php echo $style['href']; ?>" type="text/css" rel="<?php echo $style['rel']; ?>" media="<?php echo $style['media']; ?>" />
  <?php } ?>

  <?php foreach ($links as $link) { ?>
    <link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>" />
  <?php } ?>

  <script src="/catalog/view/javascript/jquery-2.2.3.min.js" type="text/javascript"></script>
  <script src="/catalog/view/javascript/bootstrap.min.js" type="text/javascript"></script>
  <script src="/catalog/view/javascript/scripts.js" type="text/javascript"></script>
  
  <?php foreach ($scripts as $script) { ?>
    <script src="<?php echo $script; ?>" type="text/javascript"></script>
  <?php } ?>

  <!--[if lt IE 9]>
  <!--<script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>-->
  <![endif]-->
</head>
<body class="<?php echo $class; ?>">

<header>
  <!-- ШАПКА -->
  <?php
  $telephone = explode(';',$telephone);
  ?>
  <div class="upperrow white-text">
    <div class="container">

      <div class="logo">
      <?php if ($logo) { ?>
        <a href="/">
          <img class="img-responsive" src="<?php echo $logo; ?>" alt="<?php echo $name; ?>">
        </a>
      <?php } ?>
    </div>
    <div class="phone_smartphone_section">
        <?php if(isset($telephone[1])){ ?>
        <a href="tel:<?=$telephone[1]?>"><img src="images/phone_smartphont_icon.png" alt="Иконка телефона">  <?=$telephone[1]?></a>
          <br>
        <?php }?>
        <?php if(isset($telephone[2])){ ?>
        <a href="tel:<?=$telephone[2]?>" ><img src="images/phone_smartphont_icon.png" alt="Иконка телефона">  <?=$telephone[2]?></a>
        <?php }?>
      </div>
      <?php if(isset($telephone[0])){ ?>
      <div class="phone_classic_section">
        <a href="tel:<?=$telephone[0]?>" ><img src="images/phone_classic_icon.png" alt="Иконка телефона"> <?=$telephone[0]?></a>
      </div>
      <?php }?>
    </div>
  </div>
  <!-- конец ШАПКА -->
<?php
$class = ['','','','','','',''];
switch ($route){
  case 'about':
        $class[1] = 'active';
        break;
  case 'about':
    $class[1] = 'active';
    break;
  case 'lising':
    $class[2] = 'active';
    break;
  case 'categories':
    $class[3] = 'active';
    break;
  case 'news':
    $class[4] = 'active';
    break;
  case 'contact':
    $class[5] = 'active';
    break;
  case '':
    $class[0] = 'active';
  default:
    $class[0] = '';
    break;
}
?>
  <!-- НАВИГАЦИЯ -->
  <nav class="navbar navbar-default">
    <div class="container">
      <div class="navbar-header">
        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
          <span class="sr-only">Toggle navigation</span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
        </button>
      </div>

      <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
        <ul class="nav navbar-nav text-center text-uppercase">
          <li class="<?=$class[0];?>"><a href="/">Главная <span class="sr-only">(current)</span></a></li>
          <li class="<?=$class[1];?>"><a href="/about">О нас</a></li>
          <li class="<?=$class[2];?>"><a href="/lising">Лизинг</a></li>
          <li class="<?=$class[3];?>"><a href="/categories">Каталог техники</a></li>
          <li class="<?=$class[4];?>"><a href="/news">Новости</a></li>
          <li class="<?=$class[5];?>"><a href="/contact">Контакты</a></li>
        </ul>
      </div>
    </div>
  </nav>
  <!-- конец НАВИГАЦИЯ -->
</header>

