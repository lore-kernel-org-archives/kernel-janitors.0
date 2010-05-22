From: Dan Carpenter <error27@gmail.com>
Date: Sat, 22 May 2010 20:15:35 +0000
Subject: [patch] video/saa7134: potential null dereferences in debug code
Message-Id: <20100522201535.GI22515@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mauro Carvalho Chehab <mchehab@infradead.org>
Cc: Jean Delvare <khali@linux-fr.org>, "Beholder Intl. Ltd. Dmitry Belimov" <d.belimov@gmail.com>, hermann pitton <hermann-pitton@arcor.de>, Douglas Schilling Landgraf <dougsland@redhat.com>, linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org

I modified the dprintk and i2cdprintk macros to handle null dev and ir
pointers.  There are two couple places that call dprintk() when "dev" is
null.  One is in get_key_msi_tvanywhere_plus() and the other is in
get_key_flydvb_trio(). 

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/media/video/saa7134/saa7134-input.c b/drivers/media/video/saa7134/saa7134-input.c
index e5565e2..e14f2f8 100644
--- a/drivers/media/video/saa7134/saa7134-input.c
+++ b/drivers/media/video/saa7134/saa7134-input.c
@@ -61,9 +61,9 @@ MODULE_PARM_DESC(disable_other_ir, "disable full codes of "
     "alternative remotes from other manufacturers");
 
 #define dprintk(fmt, arg...)	if (ir_debug) \
-	printk(KERN_DEBUG "%s/ir: " fmt, dev->name , ## arg)
+	printk(KERN_DEBUG "%s/ir: " fmt, dev ? dev->name : "<null>", ## arg)
 #define i2cdprintk(fmt, arg...)    if (ir_debug) \
-	printk(KERN_DEBUG "%s/ir: " fmt, ir->name , ## arg)
+	printk(KERN_DEBUG "%s/ir: " fmt, ir ? ir->name : "<null>", ## arg)
 
 /* Helper functions for RC5 and NEC decoding at GPIO16 or GPIO18 */
 static int saa7134_rc5_irq(struct saa7134_dev *dev);
