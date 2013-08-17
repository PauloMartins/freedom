<?php

/**
 * This is the model class for table "unit".
 *
 * The followings are the available columns in table 'unit':
 * @property integer $id
 * @property string $identification
 * @property string $presentation
 * @property integer $residential_id
 * @property string $register
 *
 * The followings are the available model relations:
 * @property Order[] $orders
 * @property Out $out
 * @property Residential $residential
 * @property User[] $users
 */
class Unit extends CActiveRecord
{
	/**
	 * Returns the static model of the specified AR class.
	 * @param string $className active record class name.
	 * @return Unit the static model class
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
		return 'unit';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('identification, presentation, residential_id, register', 'required'),
			array('residential_id', 'numerical', 'integerOnly'=>true),
			array('identification, presentation', 'length', 'max'=>125),
			// The following rule is used by search().
			// Please remove those attributes that should not be searched.
			array('id, identification, presentation, residential_id, register', 'safe', 'on'=>'search'),
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
			'orders' => array(self::HAS_MANY, 'Order', 'unit_id'),
			'out' => array(self::HAS_ONE, 'Out', 'unit_id'),
			'residential' => array(self::BELONGS_TO, 'Residential', 'residential_id'),
			'users' => array(self::HAS_MANY, 'User', 'unit_id'),
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'id' => 'ID',
			'identification' => 'Identification',
			'presentation' => 'Presentation',
			'residential_id' => 'Residential',
			'register' => 'Register',
		);
	}

	/**
	 * Retrieves a list of models based on the current search/filter conditions.
	 * @return CActiveDataProvider the data provider that can return the models based on the search/filter conditions.
	 */
	public function search()
	{
		// Warning: Please modify the following code to remove attributes that
		// should not be searched.

		$criteria=new CDbCriteria;

		$criteria->compare('id',$this->id);
		$criteria->compare('identification',$this->identification,true);
		$criteria->compare('presentation',$this->presentation,true);
		$criteria->compare('residential_id',$this->residential_id);
		$criteria->compare('register',$this->register,true);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}
}