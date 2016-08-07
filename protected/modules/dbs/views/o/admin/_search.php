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

<?php $form=$this->beginWidget('CActiveForm', array(
	'action'=>Yii::app()->createUrl($this->route),
	'method'=>'get',
)); ?>
	<ul>
		<li>
			<?php echo $model->getAttributeLabel('student_id'); ?><br/>
			<?php echo $form->textField($model,'student_id',array('size'=>11,'maxlength'=>11)); ?>
		</li>

		<li>
			<?php echo $model->getAttributeLabel('status'); ?><br/>
			<?php echo $form->textField($model,'status'); ?>
		</li>

		<li>
			<?php echo $model->getAttributeLabel('register_id'); ?><br/>
			<?php echo $form->textField($model,'register_id',array('size'=>11,'maxlength'=>11)); ?>
		</li>

		<li>
			<?php echo $model->getAttributeLabel('student_nik'); ?><br/>
			<?php echo $form->textField($model,'student_nik',array('size'=>32,'maxlength'=>32)); ?>
		</li>

		<li>
			<?php echo $model->getAttributeLabel('student_name'); ?><br/>
			<?php echo $form->textField($model,'student_name',array('size'=>32,'maxlength'=>32)); ?>
		</li>

		<li>
			<?php echo $model->getAttributeLabel('student_nickname'); ?><br/>
			<?php echo $form->textField($model,'student_nickname',array('size'=>32,'maxlength'=>32)); ?>
		</li>

		<li>
			<?php echo $model->getAttributeLabel('birth_city'); ?><br/>
			<?php echo $form->textField($model,'birth_city',array('size'=>10,'maxlength'=>10)); ?>
		</li>

		<li>
			<?php echo $model->getAttributeLabel('birth_date'); ?><br/>
			<?php echo $form->textField($model,'birth_date'); ?>
		</li>

		<li>
			<?php echo $model->getAttributeLabel('gender'); ?><br/>
			<?php echo $form->textField($model,'gender',array('size'=>6,'maxlength'=>6)); ?>
		</li>

		<li>
			<?php echo $model->getAttributeLabel('status_social'); ?><br/>
			<?php echo $form->textField($model,'status_social'); ?>
		</li>

		<li>
			<?php echo $model->getAttributeLabel('colloquial'); ?><br/>
			<?php echo $form->textField($model,'colloquial',array('size'=>32,'maxlength'=>32)); ?>
		</li>

		<li>
			<?php echo $model->getAttributeLabel('transfer_status'); ?><br/>
			<?php echo $form->textField($model,'transfer_status'); ?>
		</li>

		<li>
			<?php echo $model->getAttributeLabel('transfer_from'); ?><br/>
			<?php echo $form->textArea($model,'transfer_from',array('rows'=>6, 'cols'=>50)); ?>
		</li>

		<li>
			<?php echo $model->getAttributeLabel('transfer_reason'); ?><br/>
			<?php echo $form->textArea($model,'transfer_reason',array('rows'=>6, 'cols'=>50)); ?>
		</li>

		<li>
			<?php echo $model->getAttributeLabel('email'); ?><br/>
			<?php echo $form->textField($model,'email',array('size'=>60,'maxlength'=>64)); ?>
		</li>

		<li>
			<?php echo $model->getAttributeLabel('kps_status'); ?><br/>
			<?php echo $form->textField($model,'kps_status'); ?>
		</li>

		<li>
			<?php echo $model->getAttributeLabel('kps_number'); ?><br/>
			<?php echo $form->textField($model,'kps_number',array('size'=>32,'maxlength'=>32)); ?>
		</li>

		<li>
			<?php echo $model->getAttributeLabel('creation_date'); ?><br/>
			<?php echo $form->textField($model,'creation_date'); ?>
		</li>

		<li>
			<?php echo $model->getAttributeLabel('creation_id'); ?><br/>
			<?php echo $form->textField($model,'creation_id',array('size'=>11,'maxlength'=>11)); ?>
		</li>

		<li>
			<?php echo $model->getAttributeLabel('modified_date'); ?><br/>
			<?php echo $form->textField($model,'modified_date'); ?>
		</li>

		<li>
			<?php echo $model->getAttributeLabel('modified_id'); ?><br/>
			<?php echo $form->textField($model,'modified_id',array('size'=>11,'maxlength'=>11)); ?>
		</li>

		<li class="submit">
			<?php echo CHtml::submitButton(Yii::t('phrase', 'Search')); ?>
		</li>
	</ul>
<?php $this->endWidget(); ?>
