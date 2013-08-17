<?php

/**
 * This is the model class for table "residential".
 *
 * The followings are the available columns in table 'residential':
 * @property integer $id
 * @property string $name
 * @property string $address
 * @property string $city
 * @property string $state
 * @property string $country
 * @property string $register
 *
 * The followings are the available model relations:
 * @property Document[] $documents
 * @property Unit[] $units
 */
class Residential extends CActiveRecord
{
	/**
	 * Returns the static model of the specified AR class.
	 * @param string $className active record class name.
	 * @return Residential the static model class
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
		return 'residential';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('name, address, city, state, country, register', 'required'),
			array('name, address, city, country', 'length', 'max'=>125),
			array('state', 'length', 'max'=>2),
			// The following rule is used by search().
			// Please remove those attributes that should not be searched.
			array('id, name, address, city, state, country, register', 'safe', 'on'=>'search'),
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
			'documents' => array(self::HAS_MANY, 'Document', 'residential_id'),
			'units' => array(self::HAS_MANY, 'Unit', 'residential_id'),
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'id' => 'ID',
			'name' => 'Name',
			'address' => 'Address',
			'city' => 'City',
			'state' => 'State',
			'country' => 'Country',
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
		$criteria->compare('name',$this->name,true);
		$criteria->compare('address',$this->address,true);
		$criteria->compare('city',$this->city,true);
		$criteria->compare('state',$this->state,true);
		$criteria->compare('country',$this->country,true);
		$criteria->compare('register',$this->register,true);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}
}