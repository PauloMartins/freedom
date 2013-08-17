<?php
	$this->registerScript('login', "placeholder();");
?>

<div id="content">
	<div class="form login">
	<?php $form=$this->beginWidget('CActiveForm', array(
		'id'=>'login',
		'htmlOptions'=>array('name'=>'login')
	)); ?>
		<h2>Login</h2>

		<fieldset>
			<label data-placeholder="true">username</label>
			<?php echo $form->textField($model,'username'); ?>
			<?php echo $form->error($model,'username'); ?>
		</fieldset>

		<fieldset>
			<label data-placeholder="true">password</label>
			<?php echo $form->passwordField($model,'password'); ?>
			<?php echo $form->error($model,'password'); ?>
		</fieldset>

		<fieldset>
			<?php echo CHtml::submitButton('Login', array('class'=>'btn')); ?>
		</fieldset>
	<?php $this->endWidget(); ?>
	</div>
</div>