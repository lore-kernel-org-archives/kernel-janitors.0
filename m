From: Javier Martinez Canillas <martinez.javier@gmail.com>
Date: Fri, 30 Apr 2010 20:31:37 +0000
Subject: [PATCH 6/7] drivers/staging/comedi: dev_node removal (ni_mio_cs)
Message-Id: <1272659497.14356.37.camel@lenovo>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Signed-off-by: Javier Martinez Canillas <martinez.javier@gmail.com>
---
 drivers/staging/comedi/drivers/ni_mio_cs.c |   10 +---------
 1 files changed, 1 insertions(+), 9 deletions(-)

diff --git a/drivers/staging/comedi/drivers/ni_mio_cs.c b/drivers/staging/comedi/drivers/ni_mio_cs.c
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
@@ -347,8 +341,6 @@ static void mio_cs_config(struct pcmcia_device *link)
 		dev_info(&link->dev, "no IRQ available\n");
 
 	ret = pcmcia_request_configuration(link, &link->conf);
-
-	link->dev_node = &dev_node;
 }
 
 static int mio_cs_attach(struct comedi_device *dev, struct comedi_devconfig *it)
-- 
1.6.0.4




