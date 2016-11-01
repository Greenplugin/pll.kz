<?php echo $header; ?>
<div class="content contacts"><!--CONTENT - общий див для контента ниже хедера и выше футера -->
  <h1>Как нас найти</h1>
  <h3>Головной офис и филиалы на карте</h3>
  <div class="map">
    <!--здесь распологается карта, задана как background-image, поэтому этот див нельзя удалять -->
    <?php foreach ($contacts as $contact){ ?>
    <div class="city <?=$contact['class']?>" style="<?=$contact['style'];?>">
      <a href="#" data-map="mapModal" data-name="<?=$contact['phpkey']?>" data-address="<?=$contact['description'];?>" data-position="<?=$contact['geodata']?>" id="<?=$contact['class']?>"><img src="images/contacts/point.png" alt="<?=$contact['name']?>" title="<?=$contact['name']?>"></a>
    </div>
    <?php } ?>
  </div>
  <div class="container">
    <?php $heading_office = $contacts[0]; ?>
    <h2>Контакты:</h2>
    <h4 style="cursor: pointer;" data-map="mapModal" data-name="<?=$heading_office['phpkey']?>" data-address="<?=$heading_office['description'];?>" data-position="<?=$heading_office['geodata']?>"  class="orange-text text-uppercase"><?=$heading_office['name']?></h4>
    <p><?=$heading_office['description']?></p>
    <br>
    <?php unset($contacts[0]); ?>
    <div class="row">
      <?php foreach($contacts as $contact){ ?>
      <div class="col-sm-4 text-left">
        <h4 style="cursor: pointer;" data-map="mapModal" data-name="<?=$contact['phpkey']?>" data-address="<?=$contact['description'];?>" data-position="<?=$contact['geodata']?>" class="orange-text text-uppercase"><?=$contact['name']?></h4>
        <p><?=$contact['description']?></p>
      </div>
      <?php } ?>
    </div>
  </div>
</div><!-- конец CONTENT -->

<!-- Modal -->
<div class="modal fade" id="mapModal" role="dialog">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">Город <span class="city-name-and-phone"></span></h4>
      </div>
      <div class="modal-body">
        <div id="YMapsID" style="height:400px"></div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Закрыть</button>
      </div>
    </div>
  </div>
</div>

<script src="https://api-maps.yandex.ru/1.1/index.xml" type="text/javascript"></script>
<?php echo $footer; ?>
