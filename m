From: Javier Martinez Canillas <martinez.javier@gmail.com>
Date: Fri, 30 Apr 2010 20:31:23 +0000
Subject: [PATCH 5/7] drivers/staging/comedi: dev_node removal (ni_labpc_cs)
Message-Id: <1272659483.14356.36.camel@lenovo>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Signed-off-by: Javier Martinez Canillas <martinez.javier@gmail.com>
---
 drivers/staging/comedi/drivers/ni_labpc_cs.c |   19 +++----------------
 1 files changed, 3 insertions(+), 16 deletions(-)

diff --git a/drivers/staging/comedi/drivers/ni_labpc_cs.c b/drivers/staging/comedi/drivers/ni_labpc_cs.c
index 907b2ae..fd8d3e9 100644
--- a/drivers/staging/comedi/drivers/ni_labpc_cs.c
+++ b/drivers/staging/comedi/drivers/ni_labpc_cs.c
@@ -199,7 +199,6 @@ static const dev_info_t dev_info = "daqcard-1200";
 
 struct local_info_t {
 	struct pcmcia_device *link;
-	dev_node_t node;
 	int stop;
 	struct bus_operations *bus;
 };
@@ -265,10 +264,8 @@ static void labpc_cs_detach(struct pcmcia_device *link)
 	   the release() function is called, that will trigger a proper
 	   detach().
 	 */
-	if (link->dev_node) {
-		((struct local_info_t *)link->priv)->stop = 1;
-		labpc_release(link);
-	}
+	((struct local_info_t *)link->priv)->stop = 1;
+	labpc_release(link);
 
 	/* This points to the parent local_info_t struct (may be null) */
 	kfree(link->priv);
@@ -350,7 +347,6 @@ static int labpc_pcmcia_config_loop(struct pcmcia_device *p_dev,
 
 static void labpc_config(struct pcmcia_device *link)
 {
-	struct local_info_t *dev = link->priv;
 	int ret;
 	win_req_t req;
 
@@ -374,17 +370,8 @@ static void labpc_config(struct pcmcia_device *link)
 	if (ret)
 		goto failed;
 
-	/*
-	   At this point, the dev_node_t structure(s) need to be
-	   initialized and arranged in a linked list at link->dev.
-	 */
-	sprintf(dev->node.dev_name, "daqcard-1200");
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




