From: Marcelo Feitoza Parisi <marcelo@feitoza.com.br>
Date: Sat, 16 Jul 2005 07:22:24 +0000
Subject: [KJ] [PATCH] drivers/net/shaper.c : Use of the time_before() and
Message-Id: <42D8B5B0.7010901@feitoza.com.br>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="------------050305050301080703050308"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

This is a multi-part message in MIME format.
--------------050305050301080703050308
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit


--------------050305050301080703050308
Content-Type: text/x-patch;
 name="shaper.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="shaper.patch"

Use of the time_before() and time_after()  macros, defined at linux/jiffies.h,
which deal with wrapping correctly and are nicer to read.

Signed-off-by: Marcelo Feitoza Parisi <marcelo@feitoza.com.br>

--- linux/drivers/net/shaper.c	2005-07-13 17:52:19.000000000 -0300
+++ linux-kj/drivers/net/shaper.c	2005-07-16 01:46:18.835005176 -0300
@@ -161,7 +161,8 @@
  	while(ptr && ptr!=(struct sk_buff *)&shaper->sendq)
  	{
  		if(ptr->pri<skb->pri 
- 			&& jiffies - SHAPERCB(ptr)->shapeclock < SHAPER_MAXSLIP)
+ 			&& time_before(jiffies, SHAPERCB(ptr)->shapeclock
+			       + SHAPER_MAXSLIP))
  		{
  			struct sk_buff *tmp=ptr->prev;
 
@@ -214,7 +215,8 @@
 		/*
 		 *	Queue over time. Spill packet.
 		 */
-		if(SHAPERCB(skb)->shapeclock-jiffies > SHAPER_LATENCY) {
+		if(time_after(SHAPERCB(skb)->shapeclock, jiffies 
+					+ SHAPER_LATENCY)) {
 			dev_kfree_skb(skb);
 			shaper->stats.tx_dropped++;
 		} else

--------------050305050301080703050308
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--------------050305050301080703050308--
