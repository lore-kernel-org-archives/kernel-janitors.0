From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Tue, 27 Jul 2004 22:02:27 +0000
Subject: [Kernel-janitors] [PATCH] pcmcia/cs: replace schedule_timeout()
Message-Id: <20040727220227.GX3471@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============21003334247724803=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============21003334247724803==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

I would appreciate any comments from the janitors list. 

Applys-to: 2.6.7

Description: Remove unnecessary cs_to_timeout() macro. Use msleep()
instead of schedule_timeout() to guarantee the task delays for the
desired time.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>


--- linux-vanilla/drivers/pcmcia/cs.c	2004-06-16 05:19:02.000000000 +0000
+++ linux-dev/drivers/pcmcia/cs.c	2004-07-08 21:00:48.000000000 +0000
@@ -424,8 +424,6 @@ static int send_event(struct pcmcia_sock
     return ret;
 } /* send_event */
 
-#define cs_to_timeout(cs) (((cs) * HZ + 99) / 100)
-
 static void socket_remove_drivers(struct pcmcia_socket *skt)
 {
 	client_t *client;
@@ -445,8 +443,7 @@ static void socket_shutdown(struct pcmci
 
 	socket_remove_drivers(skt);
 	skt->state &= SOCKET_INUSE|SOCKET_PRESENT;
-	set_current_state(TASK_UNINTERRUPTIBLE);
-	schedule_timeout(cs_to_timeout(shutdown_delay));
+	msleep(shutdown_delay * 10);
 	skt->state &= SOCKET_INUSE;
 	shutdown_socket(skt);
 }
@@ -464,8 +461,7 @@ static int socket_reset(struct pcmcia_so
 	skt->socket.flags &= ~SS_RESET;
 	skt->ops->set_socket(skt, &skt->socket);
 
-	set_current_state(TASK_UNINTERRUPTIBLE);
-	schedule_timeout(cs_to_timeout(unreset_delay));
+	msleep(unreset_delay * 10);
 	for (i = 0; i < unreset_limit; i++) {
 		skt->ops->get_status(skt, &status);
 
@@ -475,8 +471,7 @@ static int socket_reset(struct pcmcia_so
 		if (status & SS_READY)
 			return CS_SUCCESS;
 
-		set_current_state(TASK_UNINTERRUPTIBLE);
-		schedule_timeout(cs_to_timeout(unreset_check));
+		msleep(unreset_check * 10);
 	}
 
 	cs_err(skt, "time out after reset.\n");
@@ -493,8 +488,7 @@ static int socket_setup(struct pcmcia_so
 	if (!(status & SS_DETECT))
 		return CS_NO_CARD;
 
-	set_current_state(TASK_UNINTERRUPTIBLE);
-	schedule_timeout(cs_to_timeout(initial_delay));
+	msleep(initial_delay * 10);
 
 	for (i = 0; i < 100; i++) {
 		skt->ops->get_status(skt, &status);
@@ -504,8 +498,7 @@ static int socket_setup(struct pcmcia_so
 		if (!(status & SS_PENDING))
 			break;
 
-		set_current_state(TASK_UNINTERRUPTIBLE);
-		schedule_timeout(cs_to_timeout(10));
+		msleep(100);
 	}
 
 	if (status & SS_PENDING) {
@@ -538,8 +531,7 @@ static int socket_setup(struct pcmcia_so
 	/*
 	 * Wait "vcc_settle" for the supply to stabilise.
 	 */
-	set_current_state(TASK_UNINTERRUPTIBLE);
-	schedule_timeout(cs_to_timeout(vcc_settle));
+	msleep(vcc_settle * 10);
 
 	skt->ops->get_status(skt, &status);
 	if (!(status & SS_POWERON)) {
@@ -656,10 +648,8 @@ static void socket_detect_change(struct 
 	if (!(skt->state & SOCKET_SUSPEND)) {
 		int status;
 
-		if (!(skt->state & SOCKET_PRESENT)) {
-			set_current_state(TASK_UNINTERRUPTIBLE);
-			schedule_timeout(cs_to_timeout(2));
-		}
+		if (!(skt->state & SOCKET_PRESENT))
+			msleep(20);
 
 		skt->ops->get_status(skt, &status);
 		if ((skt->state & SOCKET_PRESENT) &&

--===============21003334247724803==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============21003334247724803==--
