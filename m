From: maximilian attems <janitor@sternwelten.at>
Date: Wed, 21 Apr 2004 14:37:54 +0000
Subject: [Kernel-janitors] [patch] use schedule_timeout() instead of yield()
Message-Id: <20040421143754.GA1571@sputnik.stro.at>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============27540260132352445=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============27540260132352445==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

thanks to Felipe W Damasio hint rediffed.
patch is on top of linux-2.6.6-rc2

yield() removes process from active array into expired array,
better just yield the CPU for a bit.
tested on my laptop with a sis900.

a++ maks

diff -ruN a/drivers/net/sis900.c b/drivers/net/sis900.c
--- a/drivers/net/sis900.c	2004-04-05 22:56:21.000000000 +0200
+++ b/drivers/net/sis900.c	2004-04-21 15:54:23.000000000 +0200
@@ -600,7 +600,8 @@
 
 	if(status & MII_STAT_LINK){
 		while (poll_bit) {
-			yield();
+			set_current_state (TASK_UNINTERRUPTIBLE);
+			schedule_timeout(HZ/100);
 
 			poll_bit ^= (mdio_read(net_dev, sis_priv->cur_phy, MII_STATUS) & poll_bit);
 			if (time_after_eq(jiffies, timeout)) {

--===============27540260132352445==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============27540260132352445==--
