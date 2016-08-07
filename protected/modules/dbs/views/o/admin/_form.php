<?php
/**
 * Dbs Students (dbs-students)
 * @var $this AdminController
 * @var $model DbsStudents
 * @var $form CActiveForm
 * version: 0.0.1
 *
 * @author Putra Sudaryanto <putra@sudaryanto.id>
 * @copyright Copyright (c) 2016 Ommu Platform (ommu.co)
 * @created date 27 July 2016, 02:52 WIB
 * @link http://company.ommu.co
 * @contect (+62)856-299-4114
 *
 */
?>

<?php $form=$this->beginWidget('application.components.system.OActiveForm', array(
	'id'=>'dbs-students-form',
	'enableAjaxValidation'=>true,
	//'htmlOptions' => array('enctype' => 'multipart/form-data')
)); ?>

<?php //begin.Messages ?>
<div id="ajax-message">
	<?php echo $form->errorSummary($model); ?>
</div>
<?php //begin.Messages ?>

<fieldset>

	<div class="clearfix publish">
		<?php echo $form->labelEx($model,'status'); ?>
		<div class="desc">
			<?php echo $form->checkBox($model,'status'); ?>
			<?php echo $form->labelEx($model,'status'); ?>
			<?php echo $form->error($model,'status'); ?>
			<?php /*<div class="small-px silent"></div>*/?>
		</div>
	</div>

	<div class="clearfix">
		<?php echo $form->labelEx($model,'register_id'); ?>
		<div class="desc">
			<?php echo $form->textField($model,'register_id',array('size'=>11,'maxlength'=>11)); ?>
			<?php echo $form->error($model,'register_id'); ?>
			<?php /*<div class="small-px silent"></div>*/?>
		</div>
	</div>

	<div class="clearfix">
		<?php echo $form->labelEx($model,'student_nik'); ?>
		<div class="desc">
			<?php echo $form->textField($model,'student_nik',array('size'=>32,'maxlength'=>32)); ?>
			<?php echo $form->error($model,'student_nik'); ?>
			<?php /*<div class="small-px silent"></div>*/?>
		</div>
	</div>

	<div class="clearfix">
		<?php echo $form->labelEx($model,'student_name'); ?>
		<div class="desc">
			<?php echo $form->textField($model,'student_name',array('size'=>32,'maxlength'=>32)); ?>
			<?php echo $form->error($model,'student_name'); ?>
			<?php /*<div class="small-px silent"></div>*/?>
		</div>
	</div>

	<div class="clearfix">
		<?php echo $form->labelEx($model,'student_nickname'); ?>
		<div class="desc">
			<?php echo $form->textField($model,'student_nickname',array('size'=>32,'maxlength'=>32)); ?>
			<?php echo $form->error($model,'student_nickname'); ?>
			<?php /*<div class="small-px silent"></div>*/?>
		</div>
	</div>

	<div class="clearfix">
		<?php echo $form->labelEx($model,'birth_city'); ?>
		<div class="desc">
			<?php echo $form->textField($model,'birth_city',array('size'=>10,'maxlength'=>10)); ?>
			<?php echo $form->error($model,'birth_city'); ?>
			<?php /*<div class="small-px silent"></div>*/?>
		</div>
	</div>

	<div class="clearfix">
		<?php echo $form->labelEx($model,'birth_date'); ?>
		<div class="desc">
			<?php
			!$model->isNewRecord ? ($model->birth_date != '0000-00-00' ? $model->birth_date = date('d-m-Y', strtotime($model->birth_date)) : '') : '';
			//echo $form->textField($model,'birth_date');
			$this->widget('zii.widgets.jui.CJuiDatePicker',array(
				'model'=>$model,
				'attribute'=>'birth_date',
				//'mode'=>'datetime',
				'options'=>array(
					'dateFormat' => 'dd-mm-yy',
				),
				'htmlOptions'=>array(
					'class' => 'span-4',
				 ),
			)); ?>
			<?php echo $form->error($model,'birth_date'); ?>
			<?php /*<div class="small-px silent"></div>*/?>
		</div>
	</div>

	<div class="clearfix">
		<?php echo $form->labelEx($model,'gender'); ?>
		<div class="desc">
			<?php echo $form->textField($model,'gender',array('size'=>6,'maxlength'=>6)); ?>
			<?php echo $form->error($model,'gender'); ?>
			<?php /*<div class="small-px silent"></div>*/?>
		</div>
	</div>

	<div class="clearfix publish">
		<?php echo $form->labelEx($model,'status_social'); ?>
		<div class="desc">
			<?php echo $form->checkBox($model,'status_social'); ?>
			<?php echo $form->labelEx($model,'status_social'); ?>
			<?php echo $form->error($model,'status_social'); ?>
			<?php /*<div class="small-px silent"></div>*/?>
		</div>
	</div>

	<div class="clearfix">
		<?php echo $form->labelEx($model,'colloquial'); ?>
		<div class="desc">
			<?php echo $form->textField($model,'colloquial',array('size'=>32,'maxlength'=>32)); ?>
			<?php echo $form->error($model,'colloquial'); ?>
			<?php /*<div class="small-px silent"></div>*/?>
		</div>
	</div>

	<div class="clearfix publish">
		<?php echo $form->labelEx($model,'transfer_status'); ?>
		<div class="desc">
			<?php echo $form->checkBox($model,'transfer_status'); ?>
			<?php echo $form->labelEx($model,'transfer_status'); ?>
			<?php echo $form->error($model,'transfer_status'); ?>
			<?php /*<div class="small-px silent"></div>*/?>
		</div>
	</div>

	<div class="clearfix">
		<?php echo $form->labelEx($model,'transfer_from'); ?>
		<div class="desc">
			<?php echo $form->textArea($model,'transfer_from',array('rows'=>6, 'cols'=>50)); ?>
			<?php echo $form->error($model,'transfer_from'); ?>
			<?php /*<div class="small-px silent"></div>*/?>
		</div>
	</div>

	<div class="clearfix">
		<?php echo $form->labelEx($model,'transfer_reason'); ?>
		<div class="desc">
			<?php echo $form->textArea($model,'transfer_reason',array('rows'=>6, 'cols'=>50)); ?>
			<?php echo $form->error($model,'transfer_reason'); ?>
			<?php /*<div class="small-px silent"></div>*/?>
		</div>
	</div>

	<div class="clearfix">
		<?php echo $form->labelEx($model,'email'); ?>
		<div class="desc">
			<?php echo $form->textField($model,'email',array('size'=>60,'maxlength'=>64)); ?>
			<?php echo $form->error($model,'email'); ?>
			<?php /*<div class="small-px silent"></div>*/?>
		</div>
	</div>

	<div class="clearfix publish">
		<?php echo $form->labelEx($model,'kps_status'); ?>
		<div class="desc">
			<?php echo $form->checkBox($model,'kps_status'); ?>
			<?php echo $form->labelEx($model,'kps_status'); ?>
			<?php echo $form->error($model,'kps_status'); ?>
			<?php /*<div class="small-px silent"></div>*/?>
		</div>
	</div>

	<div class="clearfix">
		<?php echo $form->labelEx($model,'kps_number'); ?>
		<div class="desc">
			<?php echo $form->textField($model,'kps_number',array('size'=>32,'maxlength'=>32)); ?>
			<?php echo $form->error($model,'kps_number'); ?>
			<?php /*<div class="small-px silent"></div>*/?>
		</div>
	</div>

	<div class="clearfix">
		<?php echo $form->labelEx($model,'creation_date'); ?>
		<div class="desc">
			<?php echo $form->textField($model,'creation_date'); ?>
			<?php echo $form->error($model,'creation_date'); ?>
			<?php /*<div class="small-px silent"></div>*/?>
		</div>
	</div>

	<div class="clearfix">
		<?php echo $form->labelEx($model,'creation_id'); ?>
		<div class="desc">
			<?php echo $form->textField($model,'creation_id',array('size'=>11,'maxlength'=>11)); ?>
			<?php echo $form->error($model,'creation_id'); ?>
			<?php /*<div class="small-px silent"></div>*/?>
		</div>
	</div>

	<div class="clearfix">
		<?php echo $form->labelEx($model,'modified_date'); ?>
		<div class="desc">
			<?php echo $form->textField($model,'modified_date'); ?>
			<?php echo $form->error($model,'modified_date'); ?>
			<?php /*<div class="small-px silent"></div>*/?>
		</div>
	</div>

	<div class="clearfix">
		<?php echo $form->labelEx($model,'modified_id'); ?>
		<div class="desc">
			<?php echo $form->textField($model,'modified_id',array('size'=>11,'maxlength'=>11)); ?>
			<?php echo $form->error($model,'modified_id'); ?>
			<?php /*<div class="small-px silent"></div>*/?>
		</div>
	</div>

	<div class="submit clearfix">
		<label>&nbsp;</label>
		<div class="desc">
			<?php echo CHtml::submitButton($model->isNewRecord ? Yii::t('phrase', 'Create') : Yii::t('phrase', 'Save'), array('onclick' => 'setEnableSave()')); ?>
		</div>
	</div>

</fieldset>
<?php /*
<div class="dialog-content">
</div>
<div class="dialog-submit">
	<?php echo CHtml::submitButton($model->isNewRecord ? Yii::t('phrase', 'Create') : Yii::t('phrase', 'Save') ,array('onclick' => 'setEnableSave()')); ?>
	<?php echo CHtml::button(Yii::t('phrase', 'Cancel'), array('id'=>'closed')); ?>
</div>
*/?>
<?php $this->endWidget(); ?>


