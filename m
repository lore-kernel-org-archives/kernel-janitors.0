From: Markus Elfring <Markus.Elfring@web.de>
Date: Wed, 21 Aug 2019 20:00:16 +0000
Subject: =?UTF-8?Q?=5bPATCH=5d_hamradio=3a_Delete_unnecessary_checks_before_?= =?UTF-8?B?dGhlIG1hY3JvIGNhbGwg
Message-Id: <61fc7b82-dbc0-93e4-bf43-9856eb4c6688@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org, netdev@vger.kernel.org, Allison Randal <allison@lohutok.net>, "David S. Miller" <davem@davemloft.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Kate Stewart <kstewart@linuxfoundation.org>, Richard Fontana <rfontana@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, Thomas Sailer <t.sailer@alumni.ethz.ch>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 21 Aug 2019 21:48:46 +0200

The dev_kfree_skb() function performs also input parameter validation.
Thus the test around the shown calls is not needed.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/net/hamradio/baycom_epp.c | 3 +--
 drivers/net/hamradio/hdlcdrv.c    | 3 +--
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/net/hamradio/baycom_epp.c b/drivers/net/hamradio/baycom_epp.c
index 9303aeb2595f..4476491b58f9 100644
--- a/drivers/net/hamradio/baycom_epp.c
+++ b/drivers/net/hamradio/baycom_epp.c
@@ -961,8 +961,7 @@ static int epp_close(struct net_device *dev)
 	parport_write_control(pp, 0); /* reset the adapter */
         parport_release(bc->pdev);
         parport_unregister_device(bc->pdev);
-	if (bc->skb)
-		dev_kfree_skb(bc->skb);
+	dev_kfree_skb(bc->skb);
 	bc->skb = NULL;
 	printk(KERN_INFO "%s: close epp at iobase 0x%lx irq %u\n",
 	       bc_drvname, dev->base_addr, dev->irq);
diff --git a/drivers/net/hamradio/hdlcdrv.c b/drivers/net/hamradio/hdlcdrv.c
index c6f83e0df0a3..df495b5595f5 100644
--- a/drivers/net/hamradio/hdlcdrv.c
+++ b/drivers/net/hamradio/hdlcdrv.c
@@ -475,8 +475,7 @@ static int hdlcdrv_close(struct net_device *dev)

 	if (s->ops && s->ops->close)
 		i = s->ops->close(dev);
-	if (s->skb)
-		dev_kfree_skb(s->skb);
+	dev_kfree_skb(s->skb);
 	s->skb = NULL;
 	s->opened = 0;
 	return i;
--
2.23.0
