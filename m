From: Javier Martinez Canillas <martinez.javier@gmail.com>
Date: Fri, 30 Apr 2010 20:30:23 +0000
Subject: [PATCH 2/7] drivers/staging/comedi: dev_node removal (das08_cs)
Message-Id: <1272659423.14356.33.camel@lenovo>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Signed-off-by: Javier Martinez Canillas <martinez.javier@gmail.com>
---
 drivers/staging/comedi/drivers/das08_cs.c |   19 +++----------------
 1 files changed, 3 insertions(+), 16 deletions(-)

diff --git a/drivers/staging/comedi/drivers/das08_cs.c b/drivers/staging/comedi/drivers/das08_cs.c
index bd69c4f..896d25b 100644
--- a/drivers/staging/comedi/drivers/das08_cs.c
+++ b/drivers/staging/comedi/drivers/das08_cs.c
@@ -142,7 +142,6 @@ static const dev_info_t dev_info = "pcm-das08";
 
 struct local_info_t {
 	struct pcmcia_device *link;
-	dev_node_t node;
 	int stop;
 	struct bus_operations *bus;
 };
@@ -203,10 +202,8 @@ static void das08_pcmcia_detach(struct pcmcia_device *link)
 
 	dev_dbg(&link->dev, "das08_pcmcia_detach\n");
 
-	if (link->dev_node) {
-		((struct local_info_t *)link->priv)->stop = 1;
-		das08_pcmcia_release(link);
-	}
+	((struct local_info_t *)link->priv)->stop = 1;
+	das08_pcmcia_release(link);
 
 	/* This points to the parent struct local_info_t struct */
 	if (link->priv)
@@ -261,7 +258,6 @@ static int das08_pcmcia_config_loop(struct pcmcia_device *p_dev,
 
 static void das08_pcmcia_config(struct pcmcia_device *link)
 {
-	struct local_info_t *dev = link->priv;
 	int ret;
 
 	dev_dbg(&link->dev, "das08_pcmcia_config\n");
@@ -284,17 +280,8 @@ static void das08_pcmcia_config(struct pcmcia_device *link)
 	if (ret)
 		goto failed;
 
-	/*
-	   At this point, the dev_node_t structure(s) need to be
-	   initialized and arranged in a linked list at link->dev.
-	 */
-	sprintf(dev->node.dev_name, "pcm-das08");
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




