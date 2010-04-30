From: Javier Martinez Canillas <martinez.javier@gmail.com>
Date: Fri, 30 Apr 2010 20:31:48 +0000
Subject: [PATCH 7/7] drivers/staging/comedi: dev_node removal
Message-Id: <1272659508.14356.38.camel@lenovo>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Signed-off-by: Javier Martinez Canillas <martinez.javier@gmail.com>
---
 drivers/staging/comedi/drivers/quatech_daqp_cs.c |   23 ++-------------------
 1 files changed, 3 insertions(+), 20 deletions(-)

diff --git a/drivers/staging/comedi/drivers/quatech_daqp_cs.c b/drivers/staging/comedi/drivers/quatech_daqp_cs.c
index 7aa17f9..1786db2 100644
--- a/drivers/staging/comedi/drivers/quatech_daqp_cs.c
+++ b/drivers/staging/comedi/drivers/quatech_daqp_cs.c
@@ -60,7 +60,6 @@ Devices: [Quatech] DAQP-208 (daqp), DAQP-308
 
 struct local_info_t {
 	struct pcmcia_device *link;
-	dev_node_t node;
 	int stop;
 	int table_index;
 	char board_name[32];
@@ -1070,10 +1069,8 @@ static void daqp_cs_detach(struct pcmcia_device *link)
 
 	dev_dbg(&link->dev, "daqp_cs_detach\n");
 
-	if (link->dev_node) {
-		dev->stop = 1;
-		daqp_cs_release(link);
-	}
+	dev->stop = 1;
+	daqp_cs_release(link);
 
 	/* Unlink device structure, and free it */
 	dev_table[dev->table_index] = NULL;
@@ -1128,7 +1125,6 @@ static int daqp_pcmcia_config_loop(struct pcmcia_device *p_dev,
 
 static void daqp_cs_config(struct pcmcia_device *link)
 {
-	struct local_info_t *dev = link->priv;
 	int ret;
 
 	dev_dbg(&link->dev, "daqp_cs_config\n");
@@ -1152,21 +1148,8 @@ static void daqp_cs_config(struct pcmcia_device *link)
 	if (ret)
 		goto failed;
 
-	/*
-	   At this point, the dev_node_t structure(s) need to be
-	   initialized and arranged in a linked list at link->dev.
-	 */
-	/* Comedi's PCMCIA script uses this device name (extracted
-	 * from /var/lib/pcmcia/stab) to pass to comedi_config
-	 */
-	/* sprintf(dev->node.dev_name, "daqp%d", dev->table_index); */
-	sprintf(dev->node.dev_name, "quatech_daqp_cs");
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




