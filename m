From: Javier Martinez Canillas <martinez.javier@gmail.com>
Date: Fri, 30 Apr 2010 20:30:07 +0000
Subject: [PATCH 1/7] drivers/staging/comedi: dev_node removal (cb_das16_cs)
Message-Id: <1272659407.14356.32.camel@lenovo>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

This is the first patch of a patch series that removes dev_node in comedi drivers.

I got a build error trying to compile comedi drivers due dev_node removal in struct pcmcia_device.

I first generated a patch against linux-next tree to solve the issue. But then was told that this change has to go through pcmcia tree.

So I generate the patches against pcmcia-2.6 git tree and also split the patch in seven small patches so it would be easier to review.

Thanks a lot.

Signed-off-by: Javier Martinez Canillas <martinez.javier@gmail.com>
---
 drivers/staging/comedi/drivers/cb_das16_cs.c |   19 +++----------------
 1 files changed, 3 insertions(+), 16 deletions(-)

diff --git a/drivers/staging/comedi/drivers/cb_das16_cs.c b/drivers/staging/comedi/drivers/cb_das16_cs.c
index e0352c6..30b522c 100644
--- a/drivers/staging/comedi/drivers/cb_das16_cs.c
+++ b/drivers/staging/comedi/drivers/cb_das16_cs.c
@@ -671,7 +671,6 @@ static dev_info_t dev_info = "cb_das16_cs";
 
 struct local_info_t {
 	struct pcmcia_device *link;
-	dev_node_t node;
 	int stop;
 	struct bus_operations *bus;
 };
@@ -716,10 +715,8 @@ static void das16cs_pcmcia_detach(struct pcmcia_device *link)
 {
 	dev_dbg(&link->dev, "das16cs_pcmcia_detach\n");
 
-	if (link->dev_node) {
-		((struct local_info_t *)link->priv)->stop = 1;
-		das16cs_pcmcia_release(link);
-	}
+	((struct local_info_t *)link->priv)->stop = 1;
+	das16cs_pcmcia_release(link);
 	/* This points to the parent struct local_info_t struct */
 	if (link->priv)
 		kfree(link->priv);
@@ -764,7 +761,6 @@ static int das16cs_pcmcia_config_loop(struct pcmcia_device *p_dev,
 
 static void das16cs_pcmcia_config(struct pcmcia_device *link)
 {
-	struct local_info_t *dev = link->priv;
 	int ret;
 
 	dev_dbg(&link->dev, "das16cs_pcmcia_config\n");
@@ -787,17 +783,8 @@ static void das16cs_pcmcia_config(struct pcmcia_device *link)
 	if (ret)
 		goto failed;
 
-	/*
-	   At this point, the dev_node_t structure(s) need to be
-	   initialized and arranged in a linked list at link->dev.
-	 */
-	sprintf(dev->node.dev_name, "cb_das16_cs");
-	dev->node.major = dev->node.minor = 0;
-	link->dev_node = &dev->node;
-
 	/* Finally, report what we've done */
-	printk(KERN_INFO "%s: index 0x%02x",
-	       dev->node.dev_name, link->conf.ConfigIndex);
+	dev_info(&link->dev, "index 0x%02x", link->conf.ConfigIndex);
 	if (link->conf.Attributes & CONF_ENABLE_IRQ)
 		printk(", irq %u", link->irq);
 	if (link->io.NumPorts1)
-- 
1.6.0.4












