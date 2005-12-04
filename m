From: Marcin Slusarz <marcin.slusarz@gmail.com>
Date: Sun, 04 Dec 2005 00:17:03 +0000
Subject: [KJ] [PATCH 7/21] polling loops: change exit condition to
Message-Id: <4392357F.30209@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

IEEE 1394 SBP2
P:	Ben Collins
M:	bcollins@debian.org
P:	Stefan Richter
M:	stefanr@s5r6.in-berlin.de

Signed-off-by: Marcin Slusarz <marcin.slusarz@gmail.com>
diff -upr -X linux-2.6.15-rc4/Documentation/dontdiff linux-2.6.15-rc4-orig/drivers/ieee1394/sbp2.c linux-2.6.15-rc4/drivers/ieee1394/sbp2.c
--- linux-2.6.15-rc4-orig/drivers/ieee1394/sbp2.c	2005-12-03 15:22:32.000000000 +0100
+++ linux-2.6.15-rc4/drivers/ieee1394/sbp2.c	2005-12-03 16:53:10.000000000 +0100
@@ -360,13 +360,14 @@ static void sbp2util_packet_dump(void *b
  */
 static int sbp2util_down_timeout(atomic_t *done, int timeout)
 {
-	int i;
+	unsigned long end_time;
 
-	for (i = timeout; (i > 0 && atomic_read(done) = 0); i-= HZ/10) {
+	end_time = jiffies + msecs_to_jiffies(timeout);
+	while (time_before(jiffies, end_time) && atomic_read(done) = 0) {
 		if (msleep_interruptible(100))	/* 100ms */
-			return(1);
+			return 1;
 	}
-	return ((i > 0) ? 0:1);
+	return (time_before(jiffies, end_time) ? 0 : 1);
 }
 
 /* Free's an allocated packet */
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
