
        var hansocket=new WebSocket("ws://localhost:8080/groupchat");
        function wait_websocket_conn(inf){
			if(hansocket.readyState){

				hansocket.send(inf.userid);
				hansocket.send(inf.date+' '+inf.time);
				hansocket.send('shiyanzu');
				hansocket.send(inf.mima);
				hansocket.send(inf.username);
				hansocket.send(inf.student_group);
			}
			else{
				alert(hansocket.readyState+"连接有问题");
			}
        }
