<?php
/**
 * Dbs Student Addresses (dbs-student-address)
 * @var $this AddressController
 * @var $data DbsStudentAddress
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

	<b><?php echo CHtml::encode($data->getAttributeLabel('address_id')); ?>:</b>
	<?php echo CHtml::link(CHtml::encode($data->address_id), array('view', 'id'=>$data->address_id)); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('publish')); ?>:</b>
	<?php echo CHtml::encode($data->publish); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('student_id')); ?>:</b>
	<?php echo CHtml::encode($data->student_id); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('address_from')); ?>:</b>
	<?php echo CHtml::encode($data->address_from); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('address_home')); ?>:</b>
	<?php echo CHtml::encode($data->address_home); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('address_home_status')); ?>:</b>
	<?php echo CHtml::encode($data->address_home_status); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('address_phone')); ?>:</b>
	<?php echo CHtml::encode($data->address_phone); ?>
	<br />

	<?php /*
	<b><?php echo CHtml::encode($data->getAttributeLabel('address_distance')); ?>:</b>
	<?php echo CHtml::encode($data->address_distance); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('school_transportation')); ?>:</b>
	<?php echo CHtml::encode($data->school_transportation); ?>
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