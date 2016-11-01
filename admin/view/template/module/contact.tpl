<?php echo $header; ?><?php echo $column_left; ?>
    <div id="content">
        <div class="page-header">
            <div class="container-fluid">
                <div class="pull-right">
                    <button type="submit" form="form-contact" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
                    <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a></div>
                <h1><?php echo $heading_title; ?></h1>
                <ul class="breadcrumb">
                    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
                        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
                    <?php } ?>
                </ul>
            </div>
        </div>
        <div class="container-fluid">
            <?php if ($error_warning) { ?>
                <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
                    <button type="button" class="close" data-dismiss="alert">&times;</button>
                </div>
            <?php } ?>

            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_edit; ?></h3>
                </div>
                <div class="panel-body">
                    <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-contact" class="form-horizontal">
                        <div class="form-group">
                            <label class="col-sm-2 control-label" for="input-status"><?php echo $entry_status; ?></label>
                            <div class="col-sm-10">
                                <select name="contact_status" id="input-status" class="form-control">
                                    <?php if ($contact_status) { ?>
                                        <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                                        <option value="0"><?php echo $text_disabled; ?></option>
                                    <?php } else { ?>
                                        <option value="1"><?php echo $text_enabled; ?></option>
                                        <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                                    <?php } ?>
                                </select>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
            <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
                <?php $ds = 0;  foreach ($contacts as $contact) {;?>
                <div class="panel panel-default">
                    <div class="panel-heading" role="tab" id="heading<?=$contact['id'];?>" data-toggle="collapse" data-parent="#accordion" href="#collapse<?=$contact['id'];?>" aria-expanded="true" aria-controls="collapse<?=$contact['id'];?>">
                        <h4 class="panel-title">
                            <a role="button">
                                <?=$contact['name'];?>
                            </a>
                        </h4>
                    </div>
                    <div id="collapse<?=$contact['id'];?>" class="panel-collapse collapse" role="tabpanel" aria-labelledby="heading<?=$contact['id'];?>">
                        <div class="panel-body">
                            <form id="form-contact-<?=$contact['id'];?>" action="<?=$save_action;?>">
                                <div class="row">
                                    <div class="col-lg-12">
                                        <label class="" for="contact-name">Название</label>
                                        <div class="input-group">
                                            <input id="contact-name" name="name" type="text" class="form-control" value="<?=$contact['name'];?>" placeholder="Название контакта">
                                          <span class="input-group-btn">
                                            <button data-target="form-contact-<?=$contact['id'];?>" class="btn btn-primary pull-right saveform" ><i class="fa fa-save"></i></button>
                                          </span>
                                        </div><!-- /input-group -->
                                    </div><!-- /.col-lg-6 -->
                                </div><!-- /.row -->
                                <br/>
                                <div class="row">
                                    <div class="col-md-12">
                                        <label class="" for="contact-description">Описание, телефоны</label>
                                        <textarea id="contact-description" name="description" class="form-control" rows="6"><?=$contact['description'];?></textarea>
                                    </div>
                                </div>
                                <br/>
                                <div class="row">
                                    <div class="col-md-4">
                                        <label class="" for="contact-geo">Геопозиция</label>
                                        <input id="contact-geo" name="geodata" type="text" class="form-control" value="<?=$contact['geodata'];?>" placeholder="Название контакта">
                                    </div>
                                    <div class="col-md-4">
                                        <label class="" for="contact-class">CSS класс</label>
                                        <input id="contact-class" name="class" type="text" class="form-control" value="<?=$contact['class'];?>" placeholder="Название контакта">

                                    </div>
                                    <div class="col-md-4">
                                        <label class="" for="contact-ordering">Порядок сортировки</label>
                                        <input id="contact-ordering" name="ordering" type="text" class="form-control" value="<?=$contact['ordering'];?>" placeholder="Название контакта">
                                    </div>
                                            <?php $ds = $contact['ordering'] + 1; ?>
                                </div>
                                <br/>
                                <div class="row">
                                    <div class="col-md-6">
                                        <label class="" for="contact-add">Дополнительно</label>
                                        <textarea id="contact-add" name="phpkey" class="form-control" rows="6"><?=$contact['phpkey'];?></textarea>
                                    </div>
                                    <div class="col-md-6">
                                        <label class="" for="contact-css">CSS стиль</label>
                                        <textarea id="contact-css" name="style" class="form-control" rows="6"><?=$contact['style'];?></textarea>
                                    </div>
                                </div>
                                <input hidden name="id" value="<?=$contact['id'];?>">
                                <br/>
                                <div class="row">
                                    <div class="col-md-12">
                                        <button data-target="form-contact-<?=$contact['id'];?>" class="btn btn-primary pull-right saveform" ><i class="fa fa-save"></i></button> &nbsp;
                                        <button data-delete="<?=$delete_action;?>&id=<?=$contact['id'];?>" style="margin-right: 10px;" data-id="<?=$contact['id'];?>" class="btn btn-danger pull-right delete" ><i class="fa fa-remove"></i></button>
                                    </div>

                                </div>
                            </form>

                        </div>
                    </div>
                </div>
                <?php } ?>
                <br/>
                <button data-example="#example-contact" data-target="#accordion" class="btn btn-primary pull-right add_form" ><i class="fa fa-plus"></i></button>
            </div>
            <!--Образец для добавления контакта-->
            <div id="example-contact" class="panel panel-default hidden">
                <div class="panel-heading" role="tab" id="headingOne">
                    <h4 class="panel-title">
                        <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseone" aria-expanded="true" aria-controls="collapseOne">
                            Новый контакт
                        </a>
                    </h4>
                </div>
                <div id="collapseone" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
                    <div class="panel-body">
                        <form id="form-contact-one" action="<?=$save_action;?>">
                            <div class="row">
                                <div class="col-lg-12">
                                    <label class="" for="contact-name">Название</label>
                                    <div class="input-group">
                                        <input id="contact-name" name="name" type="text" class="form-control" value='' placeholder="Название контакта">
                                          <span class="input-group-btn">
                                            <button data-target="form-contact-one" class="btn btn-primary pull-right saveform" ><i class="fa fa-save"></i></button>
                                          </span>
                                    </div><!-- /input-group -->
                                </div><!-- /.col-lg-6 -->
                            </div><!-- /.row -->
                            <br/>
                            <div class="row">
                                <div class="col-md-12">
                                    <label class="" for="contact-description">Описание, телефоны</label>
                                    <textarea id="contact-description" name="description" class="form-control" rows="6"></textarea>
                                </div>
                            </div>
                            <br/>
                            <div class="row">
                                <div class="col-md-4">
                                    <label class="" for="contact-geo">Геопозиция</label>
                                    <input id="contact-geo" name="geodata" type="text" class="form-control" placeholder="Например: 1230123,6547895 " value="" >
                                </div>
                                <div class="col-md-4">
                                    <label class="" for="contact-class">CSS класс</label>
                                    <input id="contact-class" name="class" type="text" class="form-control" value="" placeholder="CSS класс без точки">

                                </div>
                                <div class="col-md-4">
                                    <label class="" for="contact-ordering">Порядок сортировки</label>
                                    <input id="contact-ordering" name="ordering" type="text" class="form-control" value="<?=$ds?>" placeholder="Порядок сортировки">
                                </div>

                            </div>
                            <br/>
                            <div class="row">
                                <div class="col-md-6">
                                    <label class="" for="contact-add">Дополнительно</label>
                                    <textarea id="contact-add" name="phpkey" class="form-control" placeholder="Данные предусмотренные Вашим шаблоном" rows="6"></textarea>
                                </div>
                                <div class="col-md-6">
                                    <label class="" for="contact-css">CSS стиль</label>
                                    <textarea id="contact-css" name="style" class="form-control" placeholder="Стили каждого блока контактов, или любые другие данные, предусмотренные Вашим шаблоном" rows="6"></textarea>
                                </div>
                            </div>
                        </form>

                    </div>
                </div>
            </div>

            <div class="modal fade bs-example-modal-sm dialog-modal-main" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel">
                <div class="modal-dialog modal-sm">
                    <div class="modal-content">

                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                            <h4 class="modal-title dialog-modal-title"></h4>
                        </div>
                        <div style="padding: 10px;" class="dialog-modal-content">

                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-success" data-dismiss="modal">Отмена</button>
                            <button type="button" class="btn btn-danger dialog-modal-button-ok">Удалить</button>
                        </div>
                    </div>
                </div>
            </div>



            <script>
                $(document).ready(function () {

                    $('.saveform').click(function () {
                       var form;
                        form = $('#' + $(this).data('target'));
                        //console.info(form);
                        $('#accordion').prop('disabled','disabled');
                        $.ajax({
                            url: form.attr('action'),
                            type: "POST",
                            dataType: 'json',
                            data: form.serialize(),
                            success: function(data) {
                                console.info(data);
                                if(data.status.result.num_rows > 0) {
                                    $('#accordion').removeProp('disabled');
                                    location.reload();
                                }else {
                                    alert('Ничего не было обновлено');
                                    $('#accordion').removeProp('disabled');
                                }
                            }
                        });
                        return false;
                    });

                    $('.add_form').click(function () {
                        var element = $($(this).data('example'));
                        element.removeClass('hidden');
                        $($(this).data('target')).append(element);
                    });

                    $('.delete').click(function () {
                        if($(this).data('delete')){
                            var link = $(this).data('delete');
                            console.log(link);
                            question(
                              'Данное действие необратимо',
                              'Вы собираетесь удалить контакт, Вы уверены? эту опреацию невозможно отменить!',
                                function () {
                                    $('#accordion').prop('disabled','disabled');
                                    $.ajax({
                                        url: link,
                                        type: "GET",
                                        dataType: 'json',
                                        success: function(data) {
                                            console.info(data);
                                            if(data.status.result.num_rows > 0) {
                                                $('#accordion').removeProp('disabled');
                                                location.reload();
                                            }else {
                                                alert('Ничего не было удалено');
                                                $('#accordion').removeProp('disabled');
                                            }
                                        }
                                    });
                                }
                            );
                        }
                        return false;
                    });

                    function question(question_header, question_text, callback){
                        $('.dialog-modal-title').html(question_header);
                        $('.dialog-modal-content').html(question_text);
                        $('.dialog-modal-button-ok').unbind('click').bind('click',function () {
                            callback();
                        });
                        $('.dialog-modal-main').modal();
                    }

                });

            </script>

        </div>
    </div>
<?php echo $footer; ?>