From: Eric Sesterhenn / snakebyte <snakebyte@gmx.de>
Date: Sun, 18 Dec 2005 23:20:40 +0000
Subject: Re: [KJ] [Patch 1/5] Cleanup LINUX_VERSION_CODE in drivers/net
Message-Id: <1134948041.7813.0.camel@alice>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============0016297475109410264=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <1134946371.7394.5.camel@alice>
In-Reply-To: <1134946371.7394.5.camel@alice>
To: kernel-janitors@vger.kernel.org

--===============0016297475109410264==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit


sorry for the linebreaks in the patch, here is it
again.

Signed-of-by: Eric Sesterhenn <snakebyte@gmx.de>

--- linux-2.6.15-rc5-git5/drivers/net/typhoon.c.orig	2005-12-18 23:42:15.000000000 +0100
+++ linux-2.6.15-rc5-git5/drivers/net/typhoon.c	2005-12-19 00:13:32.000000000 +0100
@@ -333,12 +333,6 @@ enum state_values {
 #define TYPHOON_RESET_TIMEOUT_NOSLEEP	((6 * 1000000) / TYPHOON_UDELAY)
 #define TYPHOON_WAIT_TIMEOUT		((1000000 / 2) / TYPHOON_UDELAY)
 
-#if LINUX_VERSION_CODE < KERNEL_VERSION(2, 5, 28)
-#define typhoon_synchronize_irq(x) synchronize_irq()
-#else
-#define typhoon_synchronize_irq(x) synchronize_irq(x)
-#endif
-
 #if defined(NETIF_F_TSO)
 #define skb_tso_size(x)		(skb_shinfo(x)->tso_size)
 #define TSO_NUM_DESCRIPTORS	2
@@ -2172,7 +2166,7 @@ typhoon_close(struct net_device *dev)
 		printk(KERN_ERR "%s: unable to stop runtime\n", dev->name);
 
 	/* Make sure there is no irq handler running on a different CPU. */
-	typhoon_synchronize_irq(dev->irq);
+	synchronize_irq(dev->irq);
 	free_irq(dev->irq, dev);
 
 	typhoon_free_rx_rings(tp);



--===============0016297475109410264==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============0016297475109410264==--
