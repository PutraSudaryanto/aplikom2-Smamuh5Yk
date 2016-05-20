<?php
/**
 * Psb Registers (psb-registers)
 * @var $this AdminController
 * @var $model PsbRegisters
 * version: 0.0.1
 *
 * @author Putra Sudaryanto <putra.sudaryanto@gmail.com>
 * @copyright Copyright (c) 2016 Ommu Platform (ommu.co)
 * @created date 28 April 2016, 10:52 WIB
 * @link https://github.com/Ommu/Ommu-PSB
 * @contect (+62)856-299-4114
 *
 */

	$this->breadcrumbs=array(
		'Psb Registers'=>array('manage'),
		$model->register_id,
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
			'name'=>'register_id',
			'value'=>$model->register_id,
			//'value'=>$model->register_id != '' ? $model->register_id : '-',
		),
		array(
			'name'=>'author_id',
			'value'=>$model->author_id,
			//'value'=>$model->author_id != '' ? $model->author_id : '-',
		),
		array(
			'name'=>'status',
			'value'=>$model->status == '1' ? Chtml::image(Yii::app()->theme->baseUrl.'/images/icons/publish.png') : Chtml::image(Yii::app()->theme->baseUrl.'/images/icons/unpublish.png'),
			//'value'=>$model->status,
		),
		array(
			'name'=>'nisn',
			'value'=>$model->nisn,
			//'value'=>$model->nisn != '' ? $model->nisn : '-',
		),
		array(
			'name'=>'batch_id',
			'value'=>$model->batch_id,
			//'value'=>$model->batch_id != '' ? $model->batch_id : '-',
		),
		array(
			'name'=>'register_name',
			'value'=>$model->register_name,
			//'value'=>$model->register_name != '' ? $model->register_name : '-',
		),
		array(
			'name'=>'birth_city',
			'value'=>$model->birth_city,
			//'value'=>$model->birth_city != '' ? $model->birth_city : '-',
		),
		array(
			'name'=>'birth_date',
			'value'=>!in_array($model->birth_date, array('0000-00-00','1970-01-01')) ? Utility::dateFormat($model->birth_date) : '-',
		),
		array(
			'name'=>'gender',
			'value'=>$model->gender,
			//'value'=>$model->gender != '' ? $model->gender : '-',
		),
		array(
			'name'=>'religion',
			'value'=>$model->religion,
			//'value'=>$model->religion != '' ? $model->religion : '-',
		),
		array(
			'name'=>'address',
			'value'=>$model->address != '' ? $model->address : '-',
			//'value'=>$model->address != '' ? CHtml::link($model->address, Yii::app()->request->baseUrl.'/public/visit/'.$model->address, array('target' => '_blank')) : '-',
			'type'=>'raw',
		),
		array(
			'name'=>'register_phone',
			'value'=>$model->register_phone,
			//'value'=>$model->register_phone != '' ? $model->register_phone : '-',
		),
		array(
			'name'=>'parent_phone',
			'value'=>$model->parent_phone,
			//'value'=>$model->parent_phone != '' ? $model->parent_phone : '-',
		),
		array(
			'name'=>'register_request',
			'value'=>$model->register_request,
			//'value'=>$model->register_request != '' ? $model->register_request : '-',
		),
		array(
			'name'=>'school_id',
			'value'=>$model->school_id,
			//'value'=>$model->school_id != '' ? $model->school_id : '-',
		),
		array(
			'name'=>'school_un_rank',
			'value'=>$model->school_un_rank != '' ? $model->school_un_rank : '-',
			//'value'=>$model->school_un_rank != '' ? CHtml::link($model->school_un_rank, Yii::app()->request->baseUrl.'/public/visit/'.$model->school_un_rank, array('target' => '_blank')) : '-',
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
	),
)); ?>

<div class="dialog-content">
</div>
<div class="dialog-submit">
	<?php echo CHtml::button(Yii::t('phrase', 'Close'), array('id'=>'closed')); ?>
</div>
