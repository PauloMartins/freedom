<?php $this->registerScript('login', "init();"); ?>

<div id="header">
	<div class="wrap cleafix">
		<div class="brand">
			<!-- Freedom -->
		</div>
		<div class="user cleafix">
			<div class="data">
				<p class="name"><?php echo Yii::app()->user->name ?></p>
				<p class="local"><?php echo Yii::app()->user->unit ?></p>
			</div>
			<div class="photo">
				<img src="<?php echo Yii::app()->request->baseUrl; ?>/public/images/tmp-user-header.jpg" alt="Paulo Martins" width="45">
			</div>
		</div>
	</div>
</div>

<div id="content">
	<div class="wrap">
		<div class="grid clearfix">
			<!-- <div class="alert">
				<p>Hoje às 10:00 ocorrerá uma manutenção preventiva nos elevadores das torres A e B</p>
			</div> -->
			<div class="box discussion">
				<h2>Reforma da quadra <i class="icon discussion" title="Discussão"></i></h2>

				<div class="item">
					<div class="clearfix">
						<div class="photo">
							<img src="<?php echo Yii::app()->request->baseUrl; ?>/public/images/tmp-user.jpg" alt="Paulo Martins">
						</div>
						<div class="data">
							<p class="name">Paulo Martins</p>
							<p class="message">Quais serão as melhorias?</p>
						</div>
					</div>

					<div class="separator"></div>
				</div>
				<div class="item inverted">
					<div class="clearfix">
						<div class="data">
							<p class="name">Luiz Bacellar</p>
							<p class="message">Acho que vai ser a pintura e a troca dos traves e das barras de suporte da rede de vôlei</p>
						</div>
						<div class="photo">
							<img src="<?php echo Yii::app()->request->baseUrl; ?>/public/images/tmp-user.jpg" alt="Paulo Martins">
						</div>
					</div>

					<div class="separator"></div>
				</div>
			</div>
			<div class="box discussion l2">
				<h2>Troca do portão <i class="icon discussion" title="Discussão"></i></h2>

				<div class="item">
					<div class="clearfix">
						<div class="photo">
							<img src="<?php echo Yii::app()->request->baseUrl; ?>/public/images/tmp-user.jpg" alt="Paulo Martins">
						</div>
						<div class="data">
							<p class="name">José Alencar</p>
							<p class="message">Este portão precisa ser substituído urgentemente, porque se não ele vai cair em cima de alguém.</p>
						</div>
					</div>

					<div class="separator"></div>
				</div>
				<div class="item inverted">
					<div class="clearfix">
						<div class="data">
							<p class="name">Pedro Reaça</p>
							<p class="message">Que caia, não vou pagar por nada!</p>
						</div>
						<div class="photo">
							<img src="<?php echo Yii::app()->request->baseUrl; ?>/public/images/tmp-user.jpg" alt="Paulo Martins">
						</div>
					</div>

					<div class="separator"></div>
				</div>
			</div>

			<!-- <div class="box info order">
				<div class="content">
					<p>Nova encomenda</p>
					<span>Hoje ás 12:30</span>
				</div>
				<div class="image">
				</div>
			</div>

			<div class="box info second archive">
				<div class="content">
					<p>Novo arquivo</p>
					<span>Ontem ás 23:00</span>
				</div>
				<div class="image">
				</div>
			</div> -->

			<div class="box photos">
				<div class="title">Festa do Somélia <i class="icon photo"></i></div>

				<ul class="clearfix unstyled">
					<li>
						<a href="#"><img src="<?php echo Yii::app()->request->baseUrl; ?>/public/images/people-party.jpg" alt="Aniverário da Somélia"></a>
					</li>
					<li>
						<a href="#"><img src="<?php echo Yii::app()->request->baseUrl; ?>/public/images/people-party-2.jpg" alt="Aniverário da Somélia"></a>
					</li>
				</ul>

				<div class="controls clearfix">
					<a href="#" class="prev" title="Anterior"><i class="icon prev"></i></a>
					<a href="" class="next" title="Próxima"><i class="icon next"></i></a>
				</div>
			</div>

			<div class="box notifications clearfix">
				<div class="item first">
					<div class="text">Nova encomenda</div>
				</div>
				<div class="item last">
					<div class="text">Novo arquivo</div>
				</div>
			</div>
		</div>
	</div>
</div>