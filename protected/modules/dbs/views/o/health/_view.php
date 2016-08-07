<?php
/**
 * Dbs Student Healths (dbs-student-health)
 * @var $this HealthController
 * @var $data DbsStudentHealth
 * version: 0.0.1
 *
 * @author Putra Sudaryanto <putra@sudaryanto.id>
 * @copyright Copyright (c) 2016 Ommu Platform (ommu.co)
 * @created date 27 July 2016, 02:53 WIB
 * @link http://company.ommu.co
 * @contect (+62)856-299-4114
 *
 */
?>

<div class="view">

	<b><?php echo CHtml::encode($data->getAttributeLabel('health_id')); ?>:</b>
	<?php echo CHtml::link(CHtml::encode($data->health_id), array('view', 'id'=>$data->health_id)); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('publish')); ?>:</b>
	<?php echo CHtml::encode($data->publish); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('student_id')); ?>:</b>
	<?php echo CHtml::encode($data->student_id); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('blood_type')); ?>:</b>
	<?php echo CHtml::encode($data->blood_type); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('disease_ever')); ?>:</b>
	<?php echo CHtml::encode($data->disease_ever); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('disease_frequently')); ?>:</b>
	<?php echo CHtml::encode($data->disease_frequently); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('disease_physical')); ?>:</b>
	<?php echo CHtml::encode($data->disease_physical); ?>
	<br />

	<?php /*
	<b><?php echo CHtml::encode($data->getAttributeLabel('height_and_weight')); ?>:</b>
	<?php echo CHtml::encode($data->height_and_weight); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('creation_date')); ?>:</b>
	<?php echo CHtml::encode($data->creation_date); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('creation_id')); ?>:</b>
	<?php echo CHtml::encode($data->creation_id); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('modified_date')); ?>:</b>
	<?php echo CHtml::encode($data->modified_date); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('modified_id')); ?>:</b>
	<?php echo CHtml::encode($data->modified_id); ?>
	<br />

	*/ ?>

</div>