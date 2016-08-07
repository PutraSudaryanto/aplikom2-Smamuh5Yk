<?php
/**
 * Dbs Student Healths (dbs-student-health)
 * @var $this HealthController
 * @var $model DbsStudentHealth
 * version: 0.0.1
 *
 * @author Putra Sudaryanto <putra@sudaryanto.id>
 * @copyright Copyright (c) 2016 Ommu Platform (ommu.co)
 * @created date 27 July 2016, 02:53 WIB
 * @link http://company.ommu.co
 * @contect (+62)856-299-4114
 *
 */

	$this->breadcrumbs=array(
		'Dbs Student Healths'=>array('manage'),
		$model->health_id,
	);
?>

<?php //begin.Messages ?>
<?php
if(Yii::app()->user->hasFlash('success'))
	echo Utility::flashSuccess(Yii::app()->user->getFlash('success'));
?>
<?php //end.Messages ?>

<?php $this->widget('application.components.system.FDetailView', array(
	'data'=>$model,
	'attributes'=>array(
		array(
			'name'=>'health_id',
			'value'=>$model->health_id,
			//'value'=>$model->health_id != '' ? $model->health_id : '-',
		),
		array(
			'name'=>'publish',
			'value'=>$model->publish == '1' ? Chtml::image(Yii::app()->theme->baseUrl.'/images/icons/publish.png') : Chtml::image(Yii::app()->theme->baseUrl.'/images/icons/unpublish.png'),
			//'value'=>$model->publish,
		),
		array(
			'name'=>'student_id',
			'value'=>$model->student_id,
			//'value'=>$model->student_id != '' ? $model->student_id : '-',
		),
		array(
			'name'=>'blood_type',
			'value'=>$model->blood_type,
			//'value'=>$model->blood_type != '' ? $model->blood_type : '-',
		),
		array(
			'name'=>'disease_ever',
			'value'=>$model->disease_ever != '' ? $model->disease_ever : '-',
			//'value'=>$model->disease_ever != '' ? CHtml::link($model->disease_ever, Yii::app()->request->baseUrl.'/public/visit/'.$model->disease_ever, array('target' => '_blank')) : '-',
			'type'=>'raw',
		),
		array(
			'name'=>'disease_frequently',
			'value'=>$model->disease_frequently != '' ? $model->disease_frequently : '-',
			//'value'=>$model->disease_frequently != '' ? CHtml::link($model->disease_frequently, Yii::app()->request->baseUrl.'/public/visit/'.$model->disease_frequently, array('target' => '_blank')) : '-',
			'type'=>'raw',
		),
		array(
			'name'=>'disease_physical',
			'value'=>$model->disease_physical != '' ? $model->disease_physical : '-',
			//'value'=>$model->disease_physical != '' ? CHtml::link($model->disease_physical, Yii::app()->request->baseUrl.'/public/visit/'.$model->disease_physical, array('target' => '_blank')) : '-',
			'type'=>'raw',
		),
		array(
			'name'=>'height_and_weight',
			'value'=>$model->height_and_weight != '' ? $model->height_and_weight : '-',
			//'value'=>$model->height_and_weight != '' ? CHtml::link($model->height_and_weight, Yii::app()->request->baseUrl.'/public/visit/'.$model->height_and_weight, array('target' => '_blank')) : '-',
			'type'=>'raw',
		),
		array(
			'name'=>'creation_date',
			'value'=>!in_array($model->creation_date, array('0000-00-00 00:00:00','1970-01-01 00:00:00')) ? Utility::dateFormat($model->creation_date, true) : '-',
		),
		array(
			'name'=>'creation_id',
			'value'=>$model->creation_id,
			//'value'=>$model->creation_id != 0 ? $model->creation_id : '-',
		),
		array(
			'name'=>'modified_date',
			'value'=>!in_array($model->modified_date, array('0000-00-00 00:00:00','1970-01-01 00:00:00')) ? Utility::dateFormat($model->modified_date, true) : '-',
		),
		array(
			'name'=>'modified_id',
			'value'=>$model->modified_id,
			//'value'=>$model->modified_id != 0 ? $model->modified_id : '-',
		),
	),
)); ?>

<div class="dialog-content">
</div>
<div class="dialog-submit">
	<?php echo CHtml::button(Yii::t('phrase', 'Close'), array('id'=>'closed')); ?>
</div>
