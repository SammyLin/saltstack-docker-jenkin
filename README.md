## Install Docker Jenkins Through SaltStack

First Build Your Server (Master & Minion)

` $ vagrant up`

` $ vagrant ssh salt-master`

` salt-master $ sudo salt '*' state.highstate`

OK Done You got Jenkin in docker 

Open Your Browser [http://192.168.33.102:8080/](http://192.168.33.102:8080/)


