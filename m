From: Dan Carpenter <error27@gmail.com>
Date: Sat, 22 May 2010 20:42:38 +0000
Subject: [patch] comedi: cleanup: remove unneeded null checks
Message-Id: <20100522203958.GU22515@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

These checks are obviously pointless because kfree() can handle null
dereferences.

But really the main problem is that if the pointers were null that would
cause problems on the ealier lines.  The dereferences would cause an oops
and the _release() functions use ->priv to determine which IRQ to free.  
I looked into it and quite a few of the detach functions assume 
link->priv is non-null.  It seems like we can remove these checks.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/staging/comedi/drivers/cb_das16_cs.c b/drivers/staging/comedi/drivers/cb_das16_cs.c
index 30b522c..16f9c0a 100644
--- a/drivers/staging/comedi/drivers/cb_das16_cs.c
+++ b/drivers/staging/comedi/drivers/cb_das16_cs.c
@@ -718,8 +718,7 @@ static void das16cs_pcmcia_detach(struct pcmcia_device *link)
 	((struct local_info_t *)link->priv)->stop = 1;
 	das16cs_pcmcia_release(link);
 	/* This points to the parent struct local_info_t struct */
-	if (link->priv)
-		kfree(link->priv);
+	kfree(link->priv);
 }				/* das16cs_pcmcia_detach */
 
 
diff --git a/drivers/staging/comedi/drivers/das08_cs.c b/drivers/staging/comedi/drivers/das08_cs.c
index 896d25b..eb3aa59 100644
--- a/drivers/staging/comedi/drivers/das08_cs.c
+++ b/drivers/staging/comedi/drivers/das08_cs.c
@@ -206,8 +206,7 @@ static void das08_pcmcia_detach(struct pcmcia_device *link)
 	das08_pcmcia_release(link);
 
 	/* This points to the parent struct local_info_t struct */
-	if (link->priv)
-		kfree(link->priv);
+	kfree(link->priv);
 
 }				/* das08_pcmcia_detach */
 
diff --git a/drivers/staging/comedi/drivers/ni_daq_700.c b/drivers/staging/comedi/drivers/ni_daq_700.c
index 06dd44f..e217b54 100644
--- a/drivers/staging/comedi/drivers/ni_daq_700.c
+++ b/drivers/staging/comedi/drivers/ni_daq_700.c
@@ -538,8 +538,7 @@ static void dio700_cs_detach(struct pcmcia_device *link)
 	dio700_release(link);
 
 	/* This points to the parent struct local_info_t struct */
-	if (link->priv)
-		kfree(link->priv);
+	kfree(link->priv);
 
 }				/* dio700_cs_detach */
 
diff --git a/drivers/staging/comedi/drivers/ni_daq_dio24.c b/drivers/staging/comedi/drivers/ni_daq_dio24.c
index 7bfe08b..6d6073f 100644
--- a/drivers/staging/comedi/drivers/ni_daq_dio24.c
+++ b/drivers/staging/comedi/drivers/ni_daq_dio24.c
@@ -289,8 +289,7 @@ static void dio24_cs_detach(struct pcmcia_device *link)
 	dio24_release(link);
 
 	/* This points to the parent local_info_t struct */
-	if (link->priv)
-		kfree(link->priv);
+	kfree(link->priv);
 
 }				/* dio24_cs_detach */
 
diff --git a/drivers/staging/comedi/drivers/quatech_daqp_cs.c b/drivers/staging/comedi/drivers/quatech_daqp_cs.c
index 1786db2..71dbe69 100644
--- a/drivers/staging/comedi/drivers/quatech_daqp_cs.c
+++ b/drivers/staging/comedi/drivers/quatech_daqp_cs.c
@@ -1074,8 +1074,7 @@ static void daqp_cs_detach(struct pcmcia_device *link)
 
 	/* Unlink device structure, and free it */
 	dev_table[dev->table_index] = NULL;
-	if (dev)
-		kfree(dev);
+	kfree(dev);
 
 }				/* daqp_cs_detach */
 
