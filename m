From: Marcin Slusarz <marcin.slusarz@gmail.com>
Date: Sun, 04 Dec 2005 00:21:44 +0000
Subject: [KJ] [PATCH 16/21] polling loops: change exit condition to
Message-Id: <43923698.5080003@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

PCMCIA SUBSYSTEM
P:	Linux PCMCIA Team
L:	http://lists.infradead.org/mailman/listinfo/linux-pcmcia

Signed-off-by: Marcin Slusarz <marcin.slusarz@gmail.com>
diff -upr -X linux-2.6.15-rc4/Documentation/dontdiff linux-2.6.15-rc4-orig/drivers/pcmcia/cs.c linux-2.6.15-rc4/drivers/pcmcia/cs.c
--- linux-2.6.15-rc4-orig/drivers/pcmcia/cs.c	2005-12-03 15:22:33.000000000 +0100
+++ linux-2.6.15-rc4/drivers/pcmcia/cs.c	2005-12-03 16:53:10.000000000 +0100
@@ -396,7 +396,8 @@ static void socket_shutdown(struct pcmci
 
 static int socket_reset(struct pcmcia_socket *skt)
 {
-	int status, i;
+	int status;
+	unsigned long end_time;
 
 	cs_dbg(skt, 4, "reset\n");
 
@@ -408,7 +409,8 @@ static int socket_reset(struct pcmcia_so
 	skt->ops->set_socket(skt, &skt->socket);
 
 	msleep(unreset_delay * 10);
-	for (i = 0; i < unreset_limit; i++) {
+	end_time = jiffies + msecs_to_jiffies(unreset_limit * unreset_check * 10);
+	while (time_before(jiffies, end_time)) {
 		skt->ops->get_status(skt, &status);
 
 		if (!(status & SS_DETECT))
@@ -426,7 +428,8 @@ static int socket_reset(struct pcmcia_so
 
 static int socket_setup(struct pcmcia_socket *skt, int initial_delay)
 {
-	int status, i;
+	int status;
+	unsigned long end_time;
 
 	cs_dbg(skt, 4, "setup\n");
 
@@ -436,7 +439,8 @@ static int socket_setup(struct pcmcia_so
 
 	msleep(initial_delay * 10);
 
-	for (i = 0; i < 100; i++) {
+	end_time = jiffies + msecs_to_jiffies(10000);
+	while (time_before(jiffies, end_time)) {
 		skt->ops->get_status(skt, &status);
 		if (!(status & SS_DETECT))
 			return CS_NO_CARD;
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
