<?php

/**
 * This is the model class for table "user".
 *
 * The followings are the available columns in table 'user':
 * @property integer $id
 * @property integer $unit_id
 * @property string $username
 * @property string $password
 * @property string $name
 * @property string $photo
 * @property integer $user_type_id
 * @property string $register
 *
 * The followings are the available model relations:
 * @property Album[] $albums
 * @property AlbumItem[] $albumItems
 * @property Alert[] $alerts
 * @property Discussion[] $discussions
 * @property DiscussionUser[] $discussionUsers
 * @property Event[] $events
 * @property Feedback[] $feedbacks
 * @property Login[] $logins
 * @property Message[] $messages
 * @property Reservation[] $reservations
 * @property Unit $unit
 * @property UserType $userType
 */
class User extends CActiveRecord
{
	/**
	 * Returns the static model of the specified AR class.
	 * @param string $className active record class name.
	 * @return User the static model class
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
		return 'user';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('unit_id, username, password, name, user_type_id, register', 'required'),
			array('unit_id, user_type_id', 'numerical', 'integerOnly'=>true),
			array('username, password, name, photo', 'length', 'max'=>125),
			// The following rule is used by search().
			// Please remove those attributes that should not be searched.
			array('id, unit_id, username, password, name, photo, user_type_id, register', 'safe', 'on'=>'search'),
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
			'albums' => array(self::HAS_MANY, 'Album', 'user_id'),
			'albumItems' => array(self::HAS_MANY, 'AlbumItem', 'user_id'),
			'alerts' => array(self::HAS_MANY, 'Alert', 'user_id'),
			'discussions' => array(self::HAS_MANY, 'Discussion', 'owner'),
			'discussionUsers' => array(self::HAS_MANY, 'DiscussionUser', 'user_id'),
			'events' => array(self::HAS_MANY, 'Event', 'owner'),
			'feedbacks' => array(self::HAS_MANY, 'Feedback', 'user_id'),
			'logins' => array(self::HAS_MANY, 'Login', 'user_id'),
			'messages' => array(self::HAS_MANY, 'Message', 'user_id'),
			'reservations' => array(self::HAS_MANY, 'Reservation', 'user_id'),
			'unit' => array(self::BELONGS_TO, 'Unit', 'unit_id'),
			'userType' => array(self::BELONGS_TO, 'UserType', 'user_type_id'),
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'id' => 'ID',
			'unit_id' => 'Unit',
			'username' => 'Username',
			'password' => 'Password',
			'name' => 'Name',
			'photo' => 'Photo',
			'user_type_id' => 'User Type',
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
		$criteria->compare('unit_id',$this->unit_id);
		$criteria->compare('username',$this->username,true);
		$criteria->compare('password',$this->password,true);
		$criteria->compare('name',$this->name,true);
		$criteria->compare('photo',$this->photo,true);
		$criteria->compare('user_type_id',$this->user_type_id);
		$criteria->compare('register',$this->register,true);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}
}