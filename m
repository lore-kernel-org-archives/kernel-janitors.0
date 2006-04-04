From: Tobias Klauser <tklauser@nuerscht.ch>
Date: Tue, 04 Apr 2006 21:39:19 +0000
Subject: [KJ] [PATCH] Last DMA_xBIT_MASK cleanups
Message-Id: <20060404213859.GB1105@neon.tklauser.home>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============47952470452998419=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============47952470452998419==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

These are the last conversions of pci_set_dma_mask(),
pci_set_consistent_dma_mask() and pci_dma_supported() to use
DMA_xBIT_MASK constants from linux/dma-mapping.h

Signed-off-by: Tobias Klauser <tklauser@nuerscht.ch>

---

 Documentation/DMA-mapping.txt                                |    4 +-
 Documentation/sound/alsa/DocBook/writing-an-alsa-driver.tmpl |   16 +++++------
 drivers/media/video/saa7134/saa7134-core.c                   |    3 +-
 drivers/sn/ioc3.c                                            |    5 ++-
 include/linux/dma-mapping.h                                  |    2 -
 sound/oss/emu10k1/main.c                                     |    2 -
 sound/pci/als300.c                                           |    5 ++-
 7 files changed, 20 insertions(+), 17 deletions(-)

diff -urpN -X dontdiff linux-2.6.17-rc1/Documentation/DMA-mapping.txt linux-2.6.17-rc1~dma_mask/Documentation/DMA-mapping.txt
--- linux-2.6.17-rc1/Documentation/DMA-mapping.txt	2006-04-04 10:50:02.000000000 +0200
+++ linux-2.6.17-rc1~dma_mask/Documentation/DMA-mapping.txt	2006-04-04 10:58:01.000000000 +0200
@@ -194,7 +194,7 @@ document for how to handle this case.
 Finally, if your device can only drive the low 24-bits of
 address during PCI bus mastering you might do something like:
 
-	if (pci_set_dma_mask(pdev, 0x00ffffff)) {
+	if (pci_set_dma_mask(pdev, DMA_24BIT_MASK)) {
 		printk(KERN_WARNING
 		       "mydev: 24-bit DMA addressing not available.\n");
 		goto ignore_this_device;
@@ -212,7 +212,7 @@ functions (for example a sound card prov
 functions) and the various different functions have _different_
 DMA addressing limitations, you may wish to probe each mask and
 only provide the functionality which the machine can handle.  It
-is important that the last call to pci_set_dma_mask() be for the 
+is important that the last call to pci_set_dma_mask() be for the
 most specific mask.
 
 Here is pseudo-code showing how this might be done:
diff -urpN -X dontdiff linux-2.6.17-rc1/Documentation/sound/alsa/DocBook/writing-an-alsa-driver.tmpl linux-2.6.17-rc1~dma_mask/Documentation/sound/alsa/DocBook/writing-an-alsa-driver.tmpl
--- linux-2.6.17-rc1/Documentation/sound/alsa/DocBook/writing-an-alsa-driver.tmpl	2006-04-04 10:50:02.000000000 +0200
+++ linux-2.6.17-rc1~dma_mask/Documentation/sound/alsa/DocBook/writing-an-alsa-driver.tmpl	2006-04-04 10:58:01.000000000 +0200
@@ -1123,8 +1123,8 @@
           if ((err = pci_enable_device(pci)) < 0)
                   return err;
           /* check PCI availability (28bit DMA) */
-          if (pci_set_dma_mask(pci, 0x0fffffff) < 0 ||
-              pci_set_consistent_dma_mask(pci, 0x0fffffff) < 0) {
+          if (pci_set_dma_mask(pci, DMA_28BIT_MASK) < 0 ||
+              pci_set_consistent_dma_mask(pci, DMA_28BIT_MASK) < 0) {
                   printk(KERN_ERR "error to set 28bit mask DMA\n");
                   pci_disable_device(pci);
                   return -ENXIO;
@@ -1216,7 +1216,7 @@
         The allocation of PCI resources is done in the
       <function>probe()</function> function, and usually an extra
       <function>xxx_create()</function> function is written for this
-      purpose. 
+      purpose.
       </para>
 
       <para>
@@ -1225,7 +1225,7 @@
       allocating resources. Also, you need to set the proper PCI DMA
       mask to limit the accessed i/o range. In some cases, you might
       need to call <function>pci_set_master()</function> function,
-      too. 
+      too.
       </para>
 
       <para>
@@ -1236,8 +1236,8 @@
 <![CDATA[
   if ((err = pci_enable_device(pci)) < 0)
           return err;
-  if (pci_set_dma_mask(pci, 0x0fffffff) < 0 ||
-      pci_set_consistent_dma_mask(pci, 0x0fffffff) < 0) {
+  if (pci_set_dma_mask(pci, DMA_28BIT_MASK) < 0 ||
+      pci_set_consistent_dma_mask(pci, DMA_28BIT_MASK) < 0) {
           printk(KERN_ERR "error to set 28bit mask DMA\n");
           pci_disable_device(pci);
           return -ENXIO;
@@ -1256,13 +1256,13 @@
       functions. Unlike ALSA ver.0.5.x., there are no helpers for
       that. And these resources must be released in the destructor
       function (see below). Also, on ALSA 0.9.x, you don't need to
-      allocate (pseudo-)DMA for PCI like ALSA 0.5.x. 
+      allocate (pseudo-)DMA for PCI like ALSA 0.5.x.
       </para>
 
       <para>
         Now assume that this PCI device has an I/O port with 8 bytes
         and an interrupt. Then struct <structname>mychip</structname> will have the
-        following fields: 
+        following fields:
 
         <informalexample>
           <programlisting>
diff -urpN -X dontdiff linux-2.6.17-rc1/drivers/media/video/saa7134/saa7134-core.c linux-2.6.17-rc1~dma_mask/drivers/media/video/saa7134/saa7134-core.c
--- linux-2.6.17-rc1/drivers/media/video/saa7134/saa7134-core.c	2006-04-04 10:50:03.000000000 +0200
+++ linux-2.6.17-rc1~dma_mask/drivers/media/video/saa7134/saa7134-core.c	2006-04-04 10:58:01.000000000 +0200
@@ -32,6 +32,7 @@
 #include <linux/interrupt.h>
 #include <linux/delay.h>
 #include <linux/mutex.h>
+#include <linux/dma-mapping.h>
 
 #include "saa7134-reg.h"
 #include "saa7134.h"
@@ -870,7 +871,7 @@ static int __devinit saa7134_initdev(str
 	       pci_name(pci_dev), dev->pci_rev, pci_dev->irq,
 	       dev->pci_lat,pci_resource_start(pci_dev,0));
 	pci_set_master(pci_dev);
-	if (!pci_dma_supported(pci_dev,0xffffffff)) {
+	if (!pci_dma_supported(pci_dev, DMA_32BIT_MASK)) {
 		printk("%s: Oops: no 32bit PCI DMA ???\n",dev->name);
 		err = -EIO;
 		goto fail1;
diff -urpN -X dontdiff linux-2.6.17-rc1/drivers/sn/ioc3.c linux-2.6.17-rc1~dma_mask/drivers/sn/ioc3.c
--- linux-2.6.17-rc1/drivers/sn/ioc3.c	2006-03-20 20:26:46.000000000 +0100
+++ linux-2.6.17-rc1~dma_mask/drivers/sn/ioc3.c	2006-04-04 10:58:11.000000000 +0200
@@ -11,6 +11,7 @@
 #include <linux/errno.h>
 #include <linux/module.h>
 #include <linux/pci.h>
+#include <linux/dma-mapping.h>
 #include <linux/interrupt.h>
 #include <linux/spinlock.h>
 #include <linux/delay.h>
@@ -619,9 +620,9 @@ static int ioc3_probe(struct pci_dev *pd
 	pci_set_master(pdev);
 
 #ifdef USE_64BIT_DMA
-        ret = pci_set_dma_mask(pdev, 0xffffffffffffffffULL);
+        ret = pci_set_dma_mask(pdev, DMA_64BIT_MASK);
         if (!ret) {
-                ret = pci_set_consistent_dma_mask(pdev, 0xffffffffffffffffULL);
+                ret = pci_set_consistent_dma_mask(pdev, DMA_64BIT_MASK);
                 if (ret < 0) {
                         printk(KERN_WARNING "%s: Unable to obtain 64 bit DMA "
                                "for consistent allocations\n",
diff -urpN -X dontdiff linux-2.6.17-rc1/include/linux/dma-mapping.h linux-2.6.17-rc1~dma_mask/include/linux/dma-mapping.h
--- linux-2.6.17-rc1/include/linux/dma-mapping.h	2006-04-04 10:50:04.000000000 +0200
+++ linux-2.6.17-rc1~dma_mask/include/linux/dma-mapping.h	2006-04-04 23:22:39.000000000 +0200
@@ -21,7 +21,7 @@ enum dma_data_direction {
 #define DMA_30BIT_MASK	0x000000003fffffffULL
 #define DMA_29BIT_MASK	0x000000001fffffffULL
 #define DMA_28BIT_MASK	0x000000000fffffffULL
-#define DMA_24BIT_MASK 0x0000000000ffffffULL
+#define DMA_24BIT_MASK	0x0000000000ffffffULL
 
 #include <asm/dma-mapping.h>
 
diff -urpN -X dontdiff linux-2.6.17-rc1/sound/oss/emu10k1/main.c linux-2.6.17-rc1~dma_mask/sound/oss/emu10k1/main.c
--- linux-2.6.17-rc1/sound/oss/emu10k1/main.c	2006-04-04 10:50:06.000000000 +0200
+++ linux-2.6.17-rc1~dma_mask/sound/oss/emu10k1/main.c	2006-04-04 10:58:11.000000000 +0200
@@ -119,7 +119,7 @@
  
 
 /* the emu10k1 _seems_ to only supports 29 bit (512MiB) bit bus master */
-#define EMU10K1_DMA_MASK                0x1fffffff	/* DMA buffer mask for pci_alloc_consist */
+#define EMU10K1_DMA_MASK DMA_29BIT_MASK	/* DMA buffer mask for pci_alloc_consist */
 
 #ifndef PCI_VENDOR_ID_CREATIVE
 #define PCI_VENDOR_ID_CREATIVE 0x1102
diff -urpN -X dontdiff linux-2.6.17-rc1/sound/pci/als300.c linux-2.6.17-rc1~dma_mask/sound/pci/als300.c
--- linux-2.6.17-rc1/sound/pci/als300.c	2006-04-04 10:50:06.000000000 +0200
+++ linux-2.6.17-rc1~dma_mask/sound/pci/als300.c	2006-04-04 23:20:58.000000000 +0200
@@ -35,6 +35,7 @@
 #include <linux/init.h>
 #include <linux/moduleparam.h>
 #include <linux/pci.h>
+#include <linux/dma-mapping.h>
 #include <linux/interrupt.h>
 #include <linux/slab.h>
 
@@ -691,8 +692,8 @@ static int __devinit snd_als300_create(s
 	if ((err = pci_enable_device(pci)) < 0)
 		return err;
 
-	if (pci_set_dma_mask(pci, 0x0fffffff) < 0 ||
-		pci_set_consistent_dma_mask(pci, 0x0fffffff) < 0) {
+	if (pci_set_dma_mask(pci, DMA_28BIT_MASK) < 0 ||
+		pci_set_consistent_dma_mask(pci, DMA_28BIT_MASK) < 0) {
 		printk(KERN_ERR "error setting 28bit DMA mask\n");
 		pci_disable_device(pci);
 		return -ENXIO;

--===============47952470452998419==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============47952470452998419==--
