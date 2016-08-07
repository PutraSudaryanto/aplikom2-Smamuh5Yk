<?php
/**
 * DbsStudents
 * version: 0.0.1
 *
 * @author Putra Sudaryanto <putra@sudaryanto.id>
 * @copyright Copyright (c) 2016 Ommu Platform (ommu.co)
 * @created date 27 July 2016, 02:49 WIB
 * @link http://company.ommu.co
 * @contact (+62)856-299-4114
 *
 * This is the template for generating the model class of a specified table.
 * - $this: the ModelCode object
 * - $tableName: the table name for this class (prefix is already removed if necessary)
 * - $modelClass: the model class name
 * - $columns: list of table columns (name=>CDbColumnSchema)
 * - $labels: list of attribute labels (name=>label)
 * - $rules: list of validation rules
 * - $relations: list of relations (name=>relation declaration)
 *
 * --------------------------------------------------------------------------------------
 *
 * This is the model class for table "ommu_dbs_students".
 *
 * The followings are the available columns in table 'ommu_dbs_students':
 * @property string $student_id
 * @property integer $status
 * @property string $register_id
 * @property string $student_nik
 * @property string $student_name
 * @property string $student_nickname
 * @property string $birth_city
 * @property string $birth_date
 * @property string $gender
 * @property integer $status_social
 * @property string $colloquial
 * @property integer $transfer_status
 * @property string $transfer_from
 * @property string $transfer_reason
 * @property string $email
 * @property integer $kps_status
 * @property string $kps_number
 * @property string $creation_date
 * @property string $creation_id
 * @property string $modified_date
 * @property string $modified_id
 */
class DbsStudents extends CActiveRecord
{
	public $defaultColumns = array();

	/**
	 * Returns the static model of the specified AR class.
	 * Please note that you should have this exact method in all your CActiveRecord descendants!
	 * @param string $className active record class name.
	 * @return DbsStudents the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}

	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'ommu_dbs_students';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('register_id, student_nik, student_name, student_nickname, birth_city, birth_date, gender, status_social, colloquial, transfer_status, transfer_from, transfer_reason, email, kps_status, kps_number, creation_date, creation_id, modified_id', 'required'),
			array('status, status_social, transfer_status, kps_status', 'numerical', 'integerOnly'=>true),
			array('register_id, creation_id, modified_id', 'length', 'max'=>11),
			array('student_nik, student_name, student_nickname, colloquial, kps_number', 'length', 'max'=>32),
			array('birth_city', 'length', 'max'=>10),
			array('gender', 'length', 'max'=>6),
			array('email', 'length', 'max'=>64),
			array('modified_date', 'safe'),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('student_id, status, register_id, student_nik, student_name, student_nickname, birth_city, birth_date, gender, status_social, colloquial, transfer_status, transfer_from, transfer_reason, email, kps_status, kps_number, creation_date, creation_id, modified_date, modified_id', 'safe', 'on'=>'search'),
		);
	}

	/**
	 * @return array relational rules.
	 */
	public function relations()
	{
		// NOTE: you may need to adjust the relation name and the related
		// class name for the relations automatically generated below.
		return array(
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'student_id' => Yii::t('attribute', 'Student'),
			'status' => Yii::t('attribute', 'Status'),
			'register_id' => Yii::t('attribute', 'Register'),
			'student_nik' => Yii::t('attribute', 'Student Nik'),
			'student_name' => Yii::t('attribute', 'Student Name'),
			'student_nickname' => Yii::t('attribute', 'Student Nickname'),
			'birth_city' => Yii::t('attribute', 'Birth City'),
			'birth_date' => Yii::t('attribute', 'Birth Date'),
			'gender' => Yii::t('attribute', 'Gender'),
			'status_social' => Yii::t('attribute', 'Status Social'),
			'colloquial' => Yii::t('attribute', 'Colloquial'),
			'transfer_status' => Yii::t('attribute', 'Transfer Status'),
			'transfer_from' => Yii::t('attribute', 'Transfer From'),
			'transfer_reason' => Yii::t('attribute', 'Transfer Reason'),
			'email' => Yii::t('attribute', 'Email'),
			'kps_status' => Yii::t('attribute', 'Kps Status'),
			'kps_number' => Yii::t('attribute', 'Kps Number'),
			'creation_date' => Yii::t('attribute', 'Creation Date'),
			'creation_id' => Yii::t('attribute', 'Creation'),
			'modified_date' => Yii::t('attribute', 'Modified Date'),
			'modified_id' => Yii::t('attribute', 'Modified'),
		);
		/*
			'Student' => 'Student',
			'Status' => 'Status',
			'Register' => 'Register',
			'Student Nik' => 'Student Nik',
			'Student Name' => 'Student Name',
			'Student Nickname' => 'Student Nickname',
			'Birth City' => 'Birth City',
			'Birth Date' => 'Birth Date',
			'Gender' => 'Gender',
			'Status Social' => 'Status Social',
			'Colloquial' => 'Colloquial',
			'Transfer Status' => 'Transfer Status',
			'Transfer From' => 'Transfer From',
			'Transfer Reason' => 'Transfer Reason',
			'Email' => 'Email',
			'Kps Status' => 'Kps Status',
			'Kps Number' => 'Kps Number',
			'Creation Date' => 'Creation Date',
			'Creation' => 'Creation',
			'Modified Date' => 'Modified Date',
			'Modified' => 'Modified',
		
		*/
	}

	/**
	 * Retrieves a list of models based on the current search/filter conditions.
	 *
	 * Typical usecase:
	 * - Initialize the model fields with values from filter form.
	 * - Execute this method to get CActiveDataProvider instance which will filter
	 * models according to data in model fields.
	 * - Pass data provider to CGridView, CListView or any similar widget.
	 *
	 * @return CActiveDataProvider the data provider that can return the models
	 * based on the search/filter conditions.
	 */
	public function search()
	{
		// @todo Please modify the following code to remove attributes that should not be searched.

		$criteria=new CDbCriteria;

		$criteria->compare('t.student_id',strtolower($this->student_id),true);
		$criteria->compare('t.status',$this->status);
		$criteria->compare('t.register_id',strtolower($this->register_id),true);
		$criteria->compare('t.student_nik',strtolower($this->student_nik),true);
		$criteria->compare('t.student_name',strtolower($this->student_name),true);
		$criteria->compare('t.student_nickname',strtolower($this->student_nickname),true);
		$criteria->compare('t.birth_city',strtolower($this->birth_city),true);
		if($this->birth_date != null && !in_array($this->birth_date, array('0000-00-00 00:00:00', '0000-00-00')))
			$criteria->compare('date(t.birth_date)',date('Y-m-d', strtotime($this->birth_date)));
		$criteria->compare('t.gender',strtolower($this->gender),true);
		$criteria->compare('t.status_social',$this->status_social);
		$criteria->compare('t.colloquial',strtolower($this->colloquial),true);
		$criteria->compare('t.transfer_status',$this->transfer_status);
		$criteria->compare('t.transfer_from',strtolower($this->transfer_from),true);
		$criteria->compare('t.transfer_reason',strtolower($this->transfer_reason),true);
		$criteria->compare('t.email',strtolower($this->email),true);
		$criteria->compare('t.kps_status',$this->kps_status);
		$criteria->compare('t.kps_number',strtolower($this->kps_number),true);
		if($this->creation_date != null && !in_array($this->creation_date, array('0000-00-00 00:00:00', '0000-00-00')))
			$criteria->compare('date(t.creation_date)',date('Y-m-d', strtotime($this->creation_date)));
		if(isset($_GET['creation']))
			$criteria->compare('t.creation_id',$_GET['creation']);
		else
			$criteria->compare('t.creation_id',$this->creation_id);
		if($this->modified_date != null && !in_array($this->modified_date, array('0000-00-00 00:00:00', '0000-00-00')))
			$criteria->compare('date(t.modified_date)',date('Y-m-d', strtotime($this->modified_date)));
		if(isset($_GET['modified']))
			$criteria->compare('t.modified_id',$_GET['modified']);
		else
			$criteria->compare('t.modified_id',$this->modified_id);

		if(!isset($_GET['DbsStudents_sort']))
			$criteria->order = 't.student_id DESC';

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
			'pagination'=>array(
				'pageSize'=>30,
			),
		));
	}


	/**
	 * Get column for CGrid View
	 */
	public function getGridColumn($columns=null) {
		if($columns !== null) {
			foreach($columns as $val) {
				/*
				if(trim($val) == 'enabled') {
					$this->defaultColumns[] = array(
						'name'  => 'enabled',
						'value' => '$data->enabled == 1? "Ya": "Tidak"',
					);
				}
				*/
				$this->defaultColumns[] = $val;
			}
		} else {
			//$this->defaultColumns[] = 'student_id';
			$this->defaultColumns[] = 'status';
			$this->defaultColumns[] = 'register_id';
			$this->defaultColumns[] = 'student_nik';
			$this->defaultColumns[] = 'student_name';
			$this->defaultColumns[] = 'student_nickname';
			$this->defaultColumns[] = 'birth_city';
			$this->defaultColumns[] = 'birth_date';
			$this->defaultColumns[] = 'gender';
			$this->defaultColumns[] = 'status_social';
			$this->defaultColumns[] = 'colloquial';
			$this->defaultColumns[] = 'transfer_status';
			$this->defaultColumns[] = 'transfer_from';
			$this->defaultColumns[] = 'transfer_reason';
			$this->defaultColumns[] = 'email';
			$this->defaultColumns[] = 'kps_status';
			$this->defaultColumns[] = 'kps_number';
			$this->defaultColumns[] = 'creation_date';
			$this->defaultColumns[] = 'creation_id';
			$this->defaultColumns[] = 'modified_date';
			$this->defaultColumns[] = 'modified_id';
		}

		return $this->defaultColumns;
	}

	/**
	 * Set default columns to display
	 */
	protected function afterConstruct() {
		if(count($this->defaultColumns) == 0) {
			/*
			$this->defaultColumns[] = array(
				'class' => 'CCheckBoxColumn',
				'name' => 'id',
				'selectableRows' => 2,
				'checkBoxHtmlOptions' => array('name' => 'trash_id[]')
			);
			*/
			$this->defaultColumns[] = array(
				'header' => 'No',
				'value' => '$this->grid->dataProvider->pagination->currentPage*$this->grid->dataProvider->pagination->pageSize + $row+1'
			);
			if(!isset($_GET['type'])) {
				$this->defaultColumns[] = array(
					'name' => 'status',
					'value' => 'Utility::getPublish(Yii::app()->controller->createUrl("status",array("id"=>$data->student_id)), $data->status, 1)',
					'htmlOptions' => array(
						'class' => 'center',
					),
					'filter'=>array(
						1=>Yii::t('phrase', 'Yes'),
						0=>Yii::t('phrase', 'No'),
					),
					'type' => 'raw',
				);
			}
			$this->defaultColumns[] = 'register_id';
			$this->defaultColumns[] = 'student_nik';
			$this->defaultColumns[] = 'student_name';
			$this->defaultColumns[] = 'student_nickname';
			$this->defaultColumns[] = 'birth_city';
			$this->defaultColumns[] = array(
				'name' => 'birth_date',
				'value' => 'Utility::dateFormat($data->birth_date)',
				'htmlOptions' => array(
					'class' => 'center',
				),
				'filter' => Yii::app()->controller->widget('zii.widgets.jui.CJuiDatePicker', array(
					'model'=>$this,
					'attribute'=>'birth_date',
					'language' => 'ja',
					'i18nScriptFile' => 'jquery.ui.datepicker-en.js',
					//'mode'=>'datetime',
					'htmlOptions' => array(
						'id' => 'birth_date_filter',
					),
					'options'=>array(
						'showOn' => 'focus',
						'dateFormat' => 'dd-mm-yy',
						'showOtherMonths' => true,
						'selectOtherMonths' => true,
						'changeMonth' => true,
						'changeYear' => true,
						'showButtonPanel' => true,
					),
				), true),
			);
			$this->defaultColumns[] = 'gender';
			if(!isset($_GET['type'])) {
				$this->defaultColumns[] = array(
					'name' => 'status_social',
					'value' => 'Utility::getPublish(Yii::app()->controller->createUrl("status_social",array("id"=>$data->student_id)), $data->status_social, 1)',
					'htmlOptions' => array(
						'class' => 'center',
					),
					'filter'=>array(
						1=>Yii::t('phrase', 'Yes'),
						0=>Yii::t('phrase', 'No'),
					),
					'type' => 'raw',
				);
			}
			$this->defaultColumns[] = 'colloquial';
			if(!isset($_GET['type'])) {
				$this->defaultColumns[] = array(
					'name' => 'transfer_status',
					'value' => 'Utility::getPublish(Yii::app()->controller->createUrl("transfer_status",array("id"=>$data->student_id)), $data->transfer_status, 1)',
					'htmlOptions' => array(
						'class' => 'center',
					),
					'filter'=>array(
						1=>Yii::t('phrase', 'Yes'),
						0=>Yii::t('phrase', 'No'),
					),
					'type' => 'raw',
				);
			}
			$this->defaultColumns[] = 'transfer_from';
			$this->defaultColumns[] = 'transfer_reason';
			$this->defaultColumns[] = 'email';
			if(!isset($_GET['type'])) {
				$this->defaultColumns[] = array(
					'name' => 'kps_status',
					'value' => 'Utility::getPublish(Yii::app()->controller->createUrl("kps_status",array("id"=>$data->student_id)), $data->kps_status, 1)',
					'htmlOptions' => array(
						'class' => 'center',
					),
					'filter'=>array(
						1=>Yii::t('phrase', 'Yes'),
						0=>Yii::t('phrase', 'No'),
					),
					'type' => 'raw',
				);
			}
			$this->defaultColumns[] = 'kps_number';
			$this->defaultColumns[] = array(
				'name' => 'creation_date',
				'value' => 'Utility::dateFormat($data->creation_date)',
				'htmlOptions' => array(
					'class' => 'center',
				),
				'filter' => Yii::app()->controller->widget('zii.widgets.jui.CJuiDatePicker', array(
					'model'=>$this,
					'attribute'=>'creation_date',
					'language' => 'ja',
					'i18nScriptFile' => 'jquery.ui.datepicker-en.js',
					//'mode'=>'datetime',
					'htmlOptions' => array(
						'id' => 'creation_date_filter',
					),
					'options'=>array(
						'showOn' => 'focus',
						'dateFormat' => 'dd-mm-yy',
						'showOtherMonths' => true,
						'selectOtherMonths' => true,
						'changeMonth' => true,
						'changeYear' => true,
						'showButtonPanel' => true,
					),
				), true),
			);
			$this->defaultColumns[] = 'creation_id';
			$this->defaultColumns[] = array(
				'name' => 'modified_date',
				'value' => 'Utility::dateFormat($data->modified_date)',
				'htmlOptions' => array(
					'class' => 'center',
				),
				'filter' => Yii::app()->controller->widget('zii.widgets.jui.CJuiDatePicker', array(
					'model'=>$this,
					'attribute'=>'modified_date',
					'language' => 'ja',
					'i18nScriptFile' => 'jquery.ui.datepicker-en.js',
					//'mode'=>'datetime',
					'htmlOptions' => array(
						'id' => 'modified_date_filter',
					),
					'options'=>array(
						'showOn' => 'focus',
						'dateFormat' => 'dd-mm-yy',
						'showOtherMonths' => true,
						'selectOtherMonths' => true,
						'changeMonth' => true,
						'changeYear' => true,
						'showButtonPanel' => true,
					),
				), true),
			);
			$this->defaultColumns[] = 'modified_id';
		}
		parent::afterConstruct();
	}

	/**
	 * User get information
	 */
	public static function getInfo($id, $column=null)
	{
		if($column != null) {
			$model = self::model()->findByPk($id,array(
				'select' => $column
			));
			return $model->$column;
			
		} else {
			$model = self::model()->findByPk($id);
			return $model;			
		}
	}

	/**
	 * before validate attributes
	 */
	/*
	protected function beforeValidate() {
		if(parent::beforeValidate()) {
			// Create action
		}
		return true;
	}
	*/

	/**
	 * after validate attributes
	 */
	/*
	protected function afterValidate()
	{
		parent::afterValidate();
			// Create action
		return true;
	}
	*/
	
	/**
	 * before save attributes
	 */
	/*
	protected function beforeSave() {
		if(parent::beforeSave()) {
			//$this->birth_date = date('Y-m-d', strtotime($this->birth_date));
		}
		return true;	
	}
	*/
	
	/**
	 * After save attributes
	 */
	/*
	protected function afterSave() {
		parent::afterSave();
		// Create action
	}
	*/

	/**
	 * Before delete attributes
	 */
	/*
	protected function beforeDelete() {
		if(parent::beforeDelete()) {
			// Create action
		}
		return true;
	}
	*/

	/**
	 * After delete attributes
	 */
	/*
	protected function afterDelete() {
		parent::afterDelete();
		// Create action
	}
	*/

}