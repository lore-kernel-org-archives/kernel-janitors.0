From: Marcelo Feitoza Parisi <marcelo@feitoza.com.br>
Date: Sat, 16 Jul 2005 07:19:15 +0000
Subject: [KJ] [PATCH] drivers/net/tokenring/olympic.c : Use of the
Message-Id: <42D8B4F3.7060405@feitoza.com.br>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="------------060300060903090800010402"
List-Id: <kernel-janitors.vger.kernel.org>
References: <42D2CA91.4010307@feitoza.com.br>
In-Reply-To: <42D2CA91.4010307@feitoza.com.br>
To: kernel-janitors@vger.kernel.org

This is a multi-part message in MIME format.
--------------060300060903090800010402
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit


--------------060300060903090800010402
Content-Type: text/x-patch;
 name="olympic.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="olympic.patch"

Use of the time_after() macro, defined at linux/jiffies.h, which deal
with wrapping correctly and are nicer to read.

Signed-off-by: Marcelo Feitoza Parisi <marcelo@feitoza.com.br>

--- linux/drivers/net/tokenring/olympic.c	2005-07-13 17:53:30.000000000 -0300
+++ linux-kj/drivers/net/tokenring/olympic.c	2005-07-16 01:02:47.940921408 -0300
@@ -365,7 +365,7 @@
 		t=jiffies;
 		while (!readl(olympic_mmio+CLKCTL) & CLKCTL_PAUSE) { 
 			schedule() ; 
-			if(jiffies-t > 2*HZ) { 
+			if(time_after(jiffies, t + 2*HZ)) { 
 				printk(KERN_ERR "IBM Cardbus tokenring adapter not responsing.\n") ; 
 				return -ENODEV;
 			}
@@ -379,7 +379,7 @@
 	t=jiffies;
 	while(!((readl(olympic_mmio+SISR_RR)) & SISR_SRB_REPLY)) {
 		schedule();		
-		if(jiffies-t > 15*HZ) {
+		if(time_after(jiffies, t + 15*HZ)) {
 			printk(KERN_ERR "IBM PCI tokenring card not responding.\n");
 			return -ENODEV;
 		}
@@ -525,7 +525,7 @@
             			olympic_priv->srb_queued=0;
             			break;
         		}
-			if ((jiffies-t) > 10*HZ) { 
+			if (time_after(jiffies, t + 10*HZ)) { 
 				printk(KERN_WARNING "%s: SRB timed out. \n",dev->name) ; 
 				olympic_priv->srb_queued=0;
 				break ; 

--------------060300060903090800010402
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--------------060300060903090800010402--
