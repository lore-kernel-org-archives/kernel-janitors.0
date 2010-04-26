From: Javier Martinez Canillas <martinez.javier@gmail.com>
Date: Mon, 26 Apr 2010 05:08:48 +0000
Subject: [PATCH] drivers/staging/comedi: dev_node removal
Message-Id: <1272258528.29373.7.camel@lenovo>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: kernel-janitors@vger.kernel.org

With today linux-next, I got a compilation error with
drivers/stagint/comedi.

drivers/staging/comedi/drivers/cb_das16_cs.c:719: error: ‘struct
pcmcia_device’ has no member named ‘dev_node’

I think this patch solves the issue removing dev_node.

From 36be34650498d7d0064bca94bbafc68745f09e8d Mon Sep 17 00:00:00 2001
From: Javier Martinez Canillas <martinez.javier@gmail.com>
Date: Mon, 26 Apr 2010 00:42:20 -0400
Subject: [PATCH] drivers/staging/comedi: dev_node removal


Signed-off-by: Javier Martinez Canillas <martinez.javier@gmail.com>
---
 drivers/staging/comedi/drivers/cb_das16_cs.c     |   21
+++----------------
 drivers/staging/comedi/drivers/das08_cs.c        |   19
++---------------
 drivers/staging/comedi/drivers/ni_daq_700.c      |   19
++---------------
 drivers/staging/comedi/drivers/ni_daq_dio24.c    |   19
++---------------
 drivers/staging/comedi/drivers/ni_labpc_cs.c     |   19
++---------------
 drivers/staging/comedi/drivers/ni_mio_cs.c       |   10 +--------
 drivers/staging/comedi/drivers/quatech_daqp_cs.c |   23
++-------------------
 7 files changed, 20 insertions(+), 110 deletions(-)

diff --git a/drivers/staging/comedi/drivers/cb_das16_cs.c
b/drivers/staging/comedi/drivers/cb_das16_cs.c
index e0352c6..6fa47dd 100644
--- a/drivers/staging/comedi/drivers/cb_das16_cs.c
+++ b/drivers/staging/comedi/drivers/cb_das16_cs.c
@@ -671,7 +671,6 @@ static dev_info_t dev_info = "cb_das16_cs";
 
 struct local_info_t {
 	struct pcmcia_device *link;
-	dev_node_t node;
 	int stop;
 	struct bus_operations *bus;
 };
@@ -716,10 +715,8 @@ static void das16cs_pcmcia_detach(struct
pcmcia_device *link)
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
@@ -764,7 +761,6 @@ static int das16cs_pcmcia_config_loop(struct
pcmcia_device *p_dev,
 
 static void das16cs_pcmcia_config(struct pcmcia_device *link)
 {
-	struct local_info_t *dev = link->priv;
 	int ret;
 
 	dev_dbg(&link->dev, "das16cs_pcmcia_config\n");
@@ -787,17 +783,8 @@ static void das16cs_pcmcia_config(struct
pcmcia_device *link)
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
-	/* Finally, report what we've done */
-	printk(KERN_INFO "%s: index 0x%02x",
-	       dev->node.dev_name, link->conf.ConfigIndex);
+	/* Finally, report what we've done */
+	dev_info(&link->dev, "index 0x%02x", link->conf.ConfigIndex);
 	if (link->conf.Attributes & CONF_ENABLE_IRQ)
 		printk(", irq %u", link->irq);
 	if (link->io.NumPorts1)
diff --git a/drivers/staging/comedi/drivers/das08_cs.c
b/drivers/staging/comedi/drivers/das08_cs.c
index bd69c4f..a03ee79 100644
--- a/drivers/staging/comedi/drivers/das08_cs.c
+++ b/drivers/staging/comedi/drivers/das08_cs.c
@@ -142,7 +142,6 @@ static const dev_info_t dev_info = "pcm-das08";
 
 struct local_info_t {
 	struct pcmcia_device *link;
-	dev_node_t node;
 	int stop;
 	struct bus_operations *bus;
 };
@@ -203,10 +202,8 @@ static void das08_pcmcia_detach(struct
pcmcia_device *link)
 
 	dev_dbg(&link->dev, "das08_pcmcia_detach\n");
 
-	if (link->dev_node) {
-		((struct local_info_t *)link->priv)->stop = 1;
-		das08_pcmcia_release(link);
-	}
+	((struct local_info_t *)link->priv)->stop = 1;
+	das08_pcmcia_release(link);
 
 	/* This points to the parent struct local_info_t struct */
 	if (link->priv)
@@ -261,7 +258,6 @@ static int das08_pcmcia_config_loop(struct
pcmcia_device *p_dev,
 
 static void das08_pcmcia_config(struct pcmcia_device *link)
 {
-	struct local_info_t *dev = link->priv;
 	int ret;
 
 	dev_dbg(&link->dev, "das08_pcmcia_config\n");
@@ -284,17 +280,8 @@ static void das08_pcmcia_config(struct
pcmcia_device *link)
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
diff --git a/drivers/staging/comedi/drivers/ni_daq_700.c
b/drivers/staging/comedi/drivers/ni_daq_700.c
index 072bc4b..e7c6e52 100644
--- a/drivers/staging/comedi/drivers/ni_daq_700.c
+++ b/drivers/staging/comedi/drivers/ni_daq_700.c
@@ -470,7 +470,6 @@ static const dev_info_t dev_info = "ni_daq_700";
 
 struct local_info_t {
 	struct pcmcia_device *link;
-	dev_node_t node;
 	int stop;
 	struct bus_operations *bus;
 };
@@ -535,10 +534,8 @@ static void dio700_cs_detach(struct pcmcia_device
*link)
 
 	dev_dbg(&link->dev, "dio700_cs_detach\n");
 
-	if (link->dev_node) {
-		((struct local_info_t *)link->priv)->stop = 1;
-		dio700_release(link);
-	}
+	((struct local_info_t *)link->priv)->stop = 1;
+	dio700_release(link);
 
 	/* This points to the parent struct local_info_t struct */
 	if (link->priv)
@@ -620,7 +617,6 @@ static int dio700_pcmcia_config_loop(struct
pcmcia_device *p_dev,
 
 static void dio700_config(struct pcmcia_device *link)
 {
-	struct local_info_t *dev = link->priv;
 	win_req_t req;
 	int ret;
 
@@ -646,17 +642,8 @@ static void dio700_config(struct pcmcia_device
*link)
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
diff --git a/drivers/staging/comedi/drivers/ni_daq_dio24.c
b/drivers/staging/comedi/drivers/ni_daq_dio24.c
index 2259fb4..d0b2c1e 100644
--- a/drivers/staging/comedi/drivers/ni_daq_dio24.c
+++ b/drivers/staging/comedi/drivers/ni_daq_dio24.c
@@ -221,7 +221,6 @@ static const dev_info_t dev_info = "ni_daq_dio24";
 
 struct local_info_t {
 	struct pcmcia_device *link;
-	dev_node_t node;
 	int stop;
 	struct bus_operations *bus;
 };
@@ -286,10 +285,8 @@ static void dio24_cs_detach(struct pcmcia_device
*link)
 
 	dev_dbg(&link->dev, "dio24_cs_detach\n");
 
-	if (link->dev_node) {
-		((struct local_info_t *)link->priv)->stop = 1;
-		dio24_release(link);
-	}
+	((struct local_info_t *)link->priv)->stop = 1;
+	dio24_release(link);
 
 	/* This points to the parent local_info_t struct */
 	if (link->priv)
@@ -371,7 +368,6 @@ static int dio24_pcmcia_config_loop(struct
pcmcia_device *p_dev,
 
 static void dio24_config(struct pcmcia_device *link)
 {
-	struct local_info_t *dev = link->priv;
 	int ret;
 	win_req_t req;
 
@@ -397,17 +393,8 @@ static void dio24_config(struct pcmcia_device
*link)
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
diff --git a/drivers/staging/comedi/drivers/ni_labpc_cs.c
b/drivers/staging/comedi/drivers/ni_labpc_cs.c
index 907b2ae..f77efae 100644
--- a/drivers/staging/comedi/drivers/ni_labpc_cs.c
+++ b/drivers/staging/comedi/drivers/ni_labpc_cs.c
@@ -199,7 +199,6 @@ static const dev_info_t dev_info = "daqcard-1200";
 
 struct local_info_t {
 	struct pcmcia_device *link;
-	dev_node_t node;
 	int stop;
 	struct bus_operations *bus;
 };
@@ -265,10 +264,8 @@ static void labpc_cs_detach(struct pcmcia_device
*link)
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
@@ -350,7 +347,6 @@ static int labpc_pcmcia_config_loop(struct
pcmcia_device *p_dev,
 
 static void labpc_config(struct pcmcia_device *link)
 {
-	struct local_info_t *dev = link->priv;
 	int ret;
 	win_req_t req;
 
@@ -374,17 +370,8 @@ static void labpc_config(struct pcmcia_device
*link)
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
diff --git a/drivers/staging/comedi/drivers/ni_mio_cs.c
b/drivers/staging/comedi/drivers/ni_mio_cs.c
index a6007ab..1e8aeba 100644
--- a/drivers/staging/comedi/drivers/ni_mio_cs.c
+++ b/drivers/staging/comedi/drivers/ni_mio_cs.c
@@ -262,11 +262,6 @@ static void cs_detach(struct pcmcia_device *);
 
 static struct pcmcia_device *cur_dev = NULL;
 static const dev_info_t dev_info = "ni_mio_cs";
-static dev_node_t dev_node = {
-	"ni_mio_cs",
-	COMEDI_MAJOR, 0,
-	NULL
-};
 
 static int cs_attach(struct pcmcia_device *link)
 {
@@ -291,8 +286,7 @@ static void cs_detach(struct pcmcia_device *link)
 {
 	DPRINTK("cs_detach(link=%p)\n", link);
 
-	if (link->dev_node)
-		cs_release(link);
+	cs_release(link);
 }
 
 static int mio_cs_suspend(struct pcmcia_device *link)
@@ -347,8 +341,6 @@ static void mio_cs_config(struct pcmcia_device
*link)
 		dev_info(&link->dev, "no IRQ available\n");
 
 	ret = pcmcia_request_configuration(link, &link->conf);
-
-	link->dev_node = &dev_node;
 }
 
 static int mio_cs_attach(struct comedi_device *dev, struct
comedi_devconfig *it)
diff --git a/drivers/staging/comedi/drivers/quatech_daqp_cs.c
b/drivers/staging/comedi/drivers/quatech_daqp_cs.c
index ab00846..a2d7489 100644
--- a/drivers/staging/comedi/drivers/quatech_daqp_cs.c
+++ b/drivers/staging/comedi/drivers/quatech_daqp_cs.c
@@ -62,7 +62,6 @@ Devices: [Quatech] DAQP-208 (daqp), DAQP-308
 
 struct local_info_t {
 	struct pcmcia_device *link;
-	dev_node_t node;
 	int stop;
 	int table_index;
 	char board_name[32];
@@ -1072,10 +1071,8 @@ static void daqp_cs_detach(struct pcmcia_device
*link)
 
 	dev_dbg(&link->dev, "daqp_cs_detach\n");
 
-	if (link->dev_node) {
-		dev->stop = 1;
-		daqp_cs_release(link);
-	}
+	dev->stop = 1;
+	daqp_cs_release(link);
 
 	/* Unlink device structure, and free it */
 	dev_table[dev->table_index] = NULL;
@@ -1130,7 +1127,6 @@ static int daqp_pcmcia_config_loop(struct
pcmcia_device *p_dev,
 
 static void daqp_cs_config(struct pcmcia_device *link)
 {
-	struct local_info_t *dev = link->priv;
 	int ret;
 
 	dev_dbg(&link->dev, "daqp_cs_config\n");
@@ -1154,21 +1150,8 @@ static void daqp_cs_config(struct pcmcia_device
*link)
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





