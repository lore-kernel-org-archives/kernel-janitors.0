From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Mon, 27 Sep 2004 16:42:55 +0000
Subject: [Kernel-janitors] [PATCH 2.6.9-rc2 1/5] pcmcia/cs: replace
Message-Id: <20040927164255.GC1676@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============75639319965099938=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============75639319965099938==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Any comments would be appreciated.

Description: Use msleep() instead of schedule_timeout()
to guarantee the task delays as expected. Remove the unused macro
cs_to_timeout().

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- 2.6.9-rc2-vanilla/drivers/pcmcia/cs.c	2004-09-13 17:16:07.000000000 -0700
+++ 2.6.9-rc2/drivers/pcmcia/cs.c	2004-09-15 10:00:07.000000000 -0700
@@ -427,8 +427,6 @@ static int send_event(struct pcmcia_sock
     return ret;
 } /* send_event */
 
-#define cs_to_timeout(cs) (((cs) * HZ + 99) / 100)
-
 static void socket_remove_drivers(struct pcmcia_socket *skt)
 {
 	client_t *client;
@@ -448,8 +446,7 @@ static void socket_shutdown(struct pcmci
 
 	socket_remove_drivers(skt);
 	skt->state &= SOCKET_INUSE|SOCKET_PRESENT;
-	set_current_state(TASK_UNINTERRUPTIBLE);
-	schedule_timeout(cs_to_timeout(shutdown_delay));
+	msleep(shutdown_delay * 10);
 	skt->state &= SOCKET_INUSE;
 	shutdown_socket(skt);
 }

 
-	set_current_state(TASK_UNINTERRUPTIBLE);
-	schedule_timeout(cs_to_timeout(unreset_delay));
+	msleep(unreset_delay * 10);
 	for (i = 0; i < unreset_limit; i++) {
 		skt->ops->get_status(skt, &status);
 
@@ -478,8 +474,7 @@ static int socket_reset(struct pcmcia_so
 		if (status & SS_READY)
 			return CS_SUCCESS;
 
-		set_current_state(TASK_UNINTERRUPTIBLE);
-		schedule_timeout(cs_to_timeout(unreset_check));
+		msleep(unreset_check * 10);
 	}
 
 	cs_err(skt, "time out after reset.\n");
@@ -496,8 +491,7 @@ static int socket_setup(struct pcmcia_so
 	if (!(status & SS_DETECT))
 		return CS_NO_CARD;
 
-	set_current_state(TASK_UNINTERRUPTIBLE);
-	schedule_timeout(cs_to_timeout(initial_delay));
+	msleep(initial_delay * 10);
 
 	for (i = 0; i < 100; i++) {
 		skt->ops->get_status(skt, &status);
@@ -507,8 +501,7 @@ static int socket_setup(struct pcmcia_so
 		if (!(status & SS_PENDING))
 			break;
 
-		set_current_state(TASK_UNINTERRUPTIBLE);
-		schedule_timeout(cs_to_timeout(10));
+		msleep(100);
 	}
 
 	if (status & SS_PENDING) {
@@ -541,8 +534,7 @@ static int socket_setup(struct pcmcia_so
 	/*
 	 * Wait "vcc_settle" for the supply to stabilise.
 	 */
-	set_current_state(TASK_UNINTERRUPTIBLE);
-	schedule_timeout(cs_to_timeout(vcc_settle));
+	msleep(vcc_settle * 10);
 
 	skt->ops->get_status(skt, &status);
 	if (!(status & SS_POWERON)) {
@@ -660,8 +652,7 @@ static void socket_detect_change(struct 
 		int status;
 
 		if (!(skt->state & SOCKET_PRESENT)) {
-			set_current_state(TASK_UNINTERRUPTIBLE);
-			schedule_timeout(cs_to_timeout(2));
+			msleep(20);
 		}
 
 		skt->ops->get_status(skt, &status);

--===============75639319965099938==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============75639319965099938==--
