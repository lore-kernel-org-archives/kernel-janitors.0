From: maximilian attems <janitor@sternwelten.at>
Date: Mon, 19 Apr 2004 16:57:42 +0000
Subject: [Kernel-janitors] [patch] use schedule() instead of yield()
Message-Id: <20040419165742.GD1393@sputnik.stro.at>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============74293514299597918=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============74293514299597918==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

patch is on top of 2.6.6-rc1.

yield() removes process from active array into expired array,
better just preempt with schedule().
as belows timeout is set to 5 seconds, 
schedule() may be better than to use a schedule_timeout(1).

tested on my laptop, but maybe my card never reach this path.


a++ maks


diff -ruN a/drivers/net/sis900.c b/drivers/net/sis900.c
--- a/drivers/net/sis900.c	2004-03-16 08:47:07.000000000 +0100
+++ b/drivers/net/sis900.c	2004-03-12 11:19:29.000000000 +0100
@@ -600,7 +600,7 @@
 
 	if(status & MII_STAT_LINK){
 		while (poll_bit) {
-			yield();
+			schedule();
 
 			poll_bit ^= (mdio_read(net_dev, sis_priv->cur_phy, MII_STATUS) & poll_bit);
 			if (time_after_eq(jiffies, timeout)) {

--===============74293514299597918==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============74293514299597918==--
