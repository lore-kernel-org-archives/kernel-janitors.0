From: Alexey Dobriyan <adobriyan@mail.ru>
Date: Wed, 09 Mar 2005 23:05:22 +0000
Subject: [KJ] [PATCH] drivers/atm/nicstar.c: fix some sparse warnings
Message-Id: <200503100157.43792.adobriyan@mail.ru>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============36228854364313912=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============36228854364313912==
Content-Disposition: inline
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit

Signed-off-by: Alexey Dobriyan <adobriyan@mail.ru>

Index: linux-2.6.11-bk4-sparse/drivers/atm/nicstar.c
===================================================================
--- linux-2.6.11-bk4-sparse.orig/drivers/atm/nicstar.c	2005-03-08 17:32:15.000000000 +0200
+++ linux-2.6.11-bk4-sparse/drivers/atm/nicstar.c	2005-03-10 00:25:39.000000000 +0200
@@ -350,7 +350,7 @@ static void __devexit nicstar_remove_one
    kfree(card->rsq.org);
    kfree(card->tsq.org);
    free_irq(card->pcidev->irq, card);
-   iounmap((void *) card->membase);
+   iounmap(card->membase);
    kfree(card);
 }
 
@@ -976,7 +976,7 @@ static void __devinit ns_init_card_error
    }
    if (error >= 4)
    {
-      iounmap((void *) card->membase);
+      iounmap(card->membase);
    }
    if (error >= 3)
    {
Index: linux-2.6.11-bk4-sparse/drivers/atm/nicstar.h
===================================================================
--- linux-2.6.11-bk4-sparse.orig/drivers/atm/nicstar.h	2005-03-08 17:32:15.000000000 +0200
+++ linux-2.6.11-bk4-sparse/drivers/atm/nicstar.h	2005-03-10 00:19:54.000000000 +0200
@@ -739,8 +739,8 @@ typedef struct skb_pool
 
 typedef struct vc_map
 {
-   volatile int tx:1;				/* TX vc? */
-   volatile int rx:1;				/* RX vc? */
+   volatile unsigned int tx:1;				/* TX vc? */
+   volatile unsigned int rx:1;				/* RX vc? */
    struct atm_vcc *tx_vcc, *rx_vcc;
    struct sk_buff *rx_iov;		/* RX iovector skb */
    scq_info *scq;			/* To keep track of the SCQ */

--===============36228854364313912==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============36228854364313912==--
