From: Javier Martinez Canillas <martinez.javier@gmail.com>
Date: Fri, 30 Apr 2010 20:30:40 +0000
Subject: [PATCH 3/7] drivers/staging/comedi: dev_node removal (ni_daq_700)
Message-Id: <1272659440.14356.34.camel@lenovo>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Signed-off-by: Javier Martinez Canillas <martinez.javier@gmail.com>
---
 drivers/staging/comedi/drivers/ni_daq_700.c |   19 +++----------------
 1 files changed, 3 insertions(+), 16 deletions(-)

diff --git a/drivers/staging/comedi/drivers/ni_daq_700.c b/drivers/staging/comedi/drivers/ni_daq_700.c
index 072bc4b..06dd44f 100644
--- a/drivers/staging/comedi/drivers/ni_daq_700.c
+++ b/drivers/staging/comedi/drivers/ni_daq_700.c
@@ -470,7 +470,6 @@ static const dev_info_t dev_info = "ni_daq_700";
 
 struct local_info_t {
 	struct pcmcia_device *link;
-	dev_node_t node;
 	int stop;
 	struct bus_operations *bus;
 };
@@ -535,10 +534,8 @@ static void dio700_cs_detach(struct pcmcia_device *link)
 
 	dev_dbg(&link->dev, "dio700_cs_detach\n");
 
-	if (link->dev_node) {
-		((struct local_info_t *)link->priv)->stop = 1;
-		dio700_release(link);
-	}
+	((struct local_info_t *)link->priv)->stop = 1;
+	dio700_release(link);
 
 	/* This points to the parent struct local_info_t struct */
 	if (link->priv)
@@ -620,7 +617,6 @@ static int dio700_pcmcia_config_loop(struct pcmcia_device *p_dev,
 
 static void dio700_config(struct pcmcia_device *link)
 {
-	struct local_info_t *dev = link->priv;
 	win_req_t req;
 	int ret;
 
@@ -646,17 +642,8 @@ static void dio700_config(struct pcmcia_device *link)
 	if (ret != 0)
 		goto failed;
 
-	/*
-	   At this point, the dev_node_t structure(s) need to be
-	   initialized and arranged in a linked list at link->dev.
-	 */
-	sprintf(dev->node.dev_name, "ni_daq_700");
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





