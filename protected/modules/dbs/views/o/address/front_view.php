<?php
/**
 * Dbs Student Addresses (dbs-student-address)
 * @var $this AddressController
 * @var $model DbsStudentAddress
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
		'Dbs Student Addresses'=>array('manage'),
		$model->address_id,
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
			'name'=>'address_id',
			'value'=>$model->address_id,
			//'value'=>$model->address_id != '' ? $model->address_id : '-',
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
			'name'=>'address_from',
			'value'=>$model->address_from != '' ? $model->address_from : '-',
			//'value'=>$model->address_from != '' ? CHtml::link($model->address_from, Yii::app()->request->baseUrl.'/public/visit/'.$model->address_from, array('target' => '_blank')) : '-',
			'type'=>'raw',
		),
		array(
			'name'=>'address_home',
			'value'=>$model->address_home != '' ? $model->address_home : '-',
			//'value'=>$model->address_home != '' ? CHtml::link($model->address_home, Yii::app()->request->baseUrl.'/public/visit/'.$model->address_home, array('target' => '_blank')) : '-',
			'type'=>'raw',
		),
		array(
			'name'=>'address_home_status',
			'value'=>$model->address_home_status != '' ? $model->address_home_status : '-',
			//'value'=>$model->address_home_status != '' ? CHtml::link($model->address_home_status, Yii::app()->request->baseUrl.'/public/visit/'.$model->address_home_status, array('target' => '_blank')) : '-',
			'type'=>'raw',
		),
		array(
			'name'=>'address_phone',
			'value'=>$model->address_phone,
			//'value'=>$model->address_phone != '' ? $model->address_phone : '-',
		),
		array(
			'name'=>'address_distance',
			'value'=>$model->address_distance,
			//'value'=>$model->address_distance != '' ? $model->address_distance : '-',
		),
		array(
			'name'=>'school_transportation',
			'value'=>$model->school_transportation != '' ? $model->school_transportation : '-',
			//'value'=>$model->school_transportation != '' ? CHtml::link($model->school_transportation, Yii::app()->request->baseUrl.'/public/visit/'.$model->school_transportation, array('target' => '_blank')) : '-',
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
