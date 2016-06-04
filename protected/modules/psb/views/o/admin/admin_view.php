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

<?php $this->widget('application.components.system.FDetailView', array(
	'data'=>$model,
	'attributes'=>array(
		array(
			'name'=>'register_id',
			'value'=>$model->register_id,
		),
		array(
			'name'=>'author_id',
			'value'=>$model->author_id != 0 ? $model->author->name : '-',
		),
		/*
		array(
			'name'=>'status',
			'value'=>$model->status == '1' ? Chtml::image(Yii::app()->theme->baseUrl.'/images/icons/publish.png') : Chtml::image(Yii::app()->theme->baseUrl.'/images/icons/unpublish.png'),
			//'value'=>$model->status,
		),
		*/
		array(
			'name'=>'nisn',
			'value'=>$model->nisn != '' ? $model->nisn : '-',
		),
		array(
			'name'=>Yii::t('phrase', 'Year'),
			'value'=>$model->batch_id != 0 ? $model->batch_relation->year->years : '-',
		),
		array(
			'name'=>'batch_id',
			'value'=>$model->batch_id != 0 ? $model->batch_relation->batch_name : '-',
		),
		array(
			'name'=>'register_name',
			'value'=>$model->register_name != '' ? $model->register_name : '-',
		),
		array(
			'name'=>'birth_city',
			'value'=>$model->birth_city != 0 ? $model->city_relation->city : '-',
		),
		array(
			'name'=>'birth_date',
			'value'=>!in_array($model->birth_date, array('0000-00-00','1970-01-01')) ? Utility::dateFormat($model->birth_date) : '-',
		),
		array(
			'name'=>'gender',
			'value'=>$model->gender == 'male' ? Yii::t('phrase', 'Laki-laki') : Yii::t('phrase', 'Perempuan'),
		),
		array(
			'name'=>'religion',
			'value'=>Phrase::trans($model->religion_relation->religion_name, 2),
		),
		array(
			'name'=>'address',
			'value'=>$model->address != '' ? $model->address : '-',
		),
		array(
			'name'=>'register_phone',
			'value'=>$model->register_phone != '' ? $model->register_phone : '-',
		),
		array(
			'name'=>'parent_phone',
			'value'=>$model->parent_phone != '' ? $model->parent_phone : '-',
		),
		array(
			'name'=>'register_request',
			'value'=>$model->register_request == 'ipa' ? Yii::t('phrase', 'IPA') : Yii::t('phrase', 'IPS'),
		),
		array(
			'name'=>'school_id',
			'value'=>$model->school_id != 0 ? 'Name: '.($model->school->school_name ? $model->school->school_name : '-').'<br/>Address: '.($model->school->school_address ? $model->school->school_address : '-').'<br/>Phone: '.($model->school->school_phone ? $model->school->school_phone : '-').'<br/> Status: '.($model->school->school_status == 1 ? Yii::t('phrase', 'Negeri') : Yii::t('phrase', 'Swasta')) : '-',
			'type'=>'raw',
		),
		array(
			'name'=>'school_un_rank',
			'value'=>$model->school_un_rank != '' ? $model->school_un_rank : '-',
		),
		array(
			'name'=>'school_un_detail',
			'value'=>$model->school_un_detail != '' ? $model->school_un_detail : '-',
		),
		array(
			'name'=>'creation_date',
			'value'=>!in_array($model->creation_date, array('0000-00-00 00:00:00','1970-01-01 00:00:00')) ? Utility::dateFormat($model->creation_date, true) : '-',
		),
		array(
			'name'=>'creation_id',
			'value'=>$model->creation_id != 0 ? $model->creation->displayname : '-',
		),
	),
)); ?>