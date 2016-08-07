<?php
/**
 * Dbs Students (dbs-students)
 * @var $this AdminController
 * @var $data DbsStudents
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

<div class="view">

	<b><?php echo CHtml::encode($data->getAttributeLabel('student_id')); ?>:</b>
	<?php echo CHtml::link(CHtml::encode($data->student_id), array('view', 'id'=>$data->student_id)); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('status')); ?>:</b>
	<?php echo CHtml::encode($data->status); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('register_id')); ?>:</b>
	<?php echo CHtml::encode($data->register_id); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('student_nik')); ?>:</b>
	<?php echo CHtml::encode($data->student_nik); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('student_name')); ?>:</b>
	<?php echo CHtml::encode($data->student_name); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('student_nickname')); ?>:</b>
	<?php echo CHtml::encode($data->student_nickname); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('birth_city')); ?>:</b>
	<?php echo CHtml::encode($data->birth_city); ?>
	<br />

	<?php /*
	<b><?php echo CHtml::encode($data->getAttributeLabel('birth_date')); ?>:</b>
	<?php echo CHtml::encode($data->birth_date); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('gender')); ?>:</b>
	<?php echo CHtml::encode($data->gender); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('status_social')); ?>:</b>
	<?php echo CHtml::encode($data->status_social); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('colloquial')); ?>:</b>
	<?php echo CHtml::encode($data->colloquial); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('transfer_status')); ?>:</b>
	<?php echo CHtml::encode($data->transfer_status); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('transfer_from')); ?>:</b>
	<?php echo CHtml::encode($data->transfer_from); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('transfer_reason')); ?>:</b>
	<?php echo CHtml::encode($data->transfer_reason); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('email')); ?>:</b>
	<?php echo CHtml::encode($data->email); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('kps_status')); ?>:</b>
	<?php echo CHtml::encode($data->kps_status); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('kps_number')); ?>:</b>
	<?php echo CHtml::encode($data->kps_number); ?>
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