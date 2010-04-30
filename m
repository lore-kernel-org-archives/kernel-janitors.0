From: Javier Martinez Canillas <martinez.javier@gmail.com>
Date: Fri, 30 Apr 2010 20:31:10 +0000
Subject: [PATCH 4/7] drivers/staging/comedi: dev_node removal (ni_daq_dio24)
Message-Id: <1272659470.14356.35.camel@lenovo>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Signed-off-by: Javier Martinez Canillas <martinez.javier@gmail.com>
---
 drivers/staging/comedi/drivers/ni_daq_dio24.c |   21 ++++-----------------
 1 files changed, 4 insertions(+), 17 deletions(-)

diff --git a/drivers/staging/comedi/drivers/ni_daq_dio24.c b/drivers/staging/comedi/drivers/ni_daq_dio24.c
index 2259fb4..0f9f22d 100644
--- a/drivers/staging/comedi/drivers/ni_daq_dio24.c
+++ b/drivers/staging/comedi/drivers/ni_daq_dio24.c
@@ -221,7 +221,6 @@ static const dev_info_t dev_info = "ni_daq_dio24";
 
 struct local_info_t {
 	struct pcmcia_device *link;
-	dev_node_t node;
 	int stop;
 	struct bus_operations *bus;
 };
@@ -286,11 +285,9 @@ static void dio24_cs_detach(struct pcmcia_device *link)
 
 	dev_dbg(&link->dev, "dio24_cs_detach\n");
 
-	if (link->dev_node) {
-		((struct local_info_t *)link->priv)->stop = 1;
-		dio24_release(link);
-	}
-
+	((struct local_info_t *)link->priv)->stop = 1;
+	dio24_release(link);
+
 	/* This points to the parent local_info_t struct */
 	if (link->priv)
 		kfree(link->priv);
@@ -371,7 +368,6 @@ static int dio24_pcmcia_config_loop(struct pcmcia_device *p_dev,
 
 static void dio24_config(struct pcmcia_device *link)
 {
-	struct local_info_t *dev = link->priv;
 	int ret;
 	win_req_t req;
 
@@ -397,17 +393,8 @@ static void dio24_config(struct pcmcia_device *link)
 	if (ret)
 		goto failed;
 
-	/*
-	   At this point, the dev_node_t structure(s) need to be
-	   initialized and arranged in a linked list at link->dev.
-	 */
-	sprintf(dev->node.dev_name, "ni_daq_dio24");
-	dev->node.major = dev->node.minor = 0;
-	link->dev_node = &dev->node;
-
 	/* Finally, report what we've done */
-	printk(KERN_INFO "%s: index 0x%02x",
-	       dev->node.dev_name, link->conf.ConfigIndex);
+	dev_info(&link->dev, "index 0x%02x", link->conf.ConfigIndex);
 	if (link->conf.Attributes & CONF_ENABLE_IRQ)
 		printk(", irq %d", link->irq);
 	if (link->io.NumPorts1)
-- 
1.6.0.4




