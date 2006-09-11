From: Amol Lad <amol@verismonetworks.com>
Date: Mon, 11 Sep 2006 11:38:40 +0000
Subject: [KJ] [PATCH] scsi_register return code check
Message-Id: <1157974000.7814.54.camel@amol.verismonetworks.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Audited return codes for scsi_register and found only 2 defaulters

Tested with
- allmodconfig
- Tweaking Kconfig to make sure the changes do not produce any
errors/warnings

Signed-off-by: Amol Lad <amol@verismonetworks.com>
---
 drivers/scsi/gdth.c        |    9 +++++++++
 drivers/scsi/mac_scsi.c    |    4 ++++
 include/linux/utsrelease.h |    1 +
 3 files changed, 14 insertions(+)
---
diff -uprN -X linux-2.6.18-rc6-orig/Documentation/dontdiff linux-2.6.18-rc6-orig/drivers/scsi/gdth.c linux-2.6.18-rc6/drivers/scsi/gdth.c
--- linux-2.6.18-rc6-orig/drivers/scsi/gdth.c	2006-09-11 11:07:25.000000000 +0530
+++ linux-2.6.18-rc6/drivers/scsi/gdth.c	2006-09-11 16:47:08.000000000 +0530
@@ -4440,6 +4440,9 @@ static int __init gdth_detect(Scsi_Host_
                     /* register addit. SCSI channels as virtual controllers */
                     for (b = 1; b < ha->bus_cnt + 1; ++b) {
                         shp = scsi_register(shtp,sizeof(gdth_num_str));
+                        if (shp = NULL)
+                            continue;
+
                         shp->unchecked_isa_dma = 1;
                         shp->irq = ha->irq;
                         shp->dma_channel = ha->drq;
@@ -4564,6 +4567,9 @@ static int __init gdth_detect(Scsi_Host_
                     /* register addit. SCSI channels as virtual controllers */
                     for (b = 1; b < ha->bus_cnt + 1; ++b) {
                         shp = scsi_register(shtp,sizeof(gdth_num_str));
+                        if (shp = NULL)
+                            continue;
+
                         shp->unchecked_isa_dma = 0;
                         shp->irq = ha->irq;
                         shp->dma_channel = 0xff;
@@ -4703,6 +4709,9 @@ static int __init gdth_detect(Scsi_Host_
             /* register addit. SCSI channels as virtual controllers */
             for (b = 1; b < ha->bus_cnt + 1; ++b) {
                 shp = scsi_register(shtp,sizeof(gdth_num_str));
+                if (shp = NULL)
+                    continue;
+
                 shp->unchecked_isa_dma = 0;
                 shp->irq = ha->irq;
                 shp->dma_channel = 0xff;
diff -uprN -X linux-2.6.18-rc6-orig/Documentation/dontdiff linux-2.6.18-rc6-orig/drivers/scsi/mac_scsi.c linux-2.6.18-rc6/drivers/scsi/mac_scsi.c
--- linux-2.6.18-rc6-orig/drivers/scsi/mac_scsi.c	2006-09-11 11:07:26.000000000 +0530
+++ linux-2.6.18-rc6/drivers/scsi/mac_scsi.c	2006-09-11 16:48:02.000000000 +0530
@@ -265,6 +265,10 @@ int macscsi_detect(struct scsi_host_temp
     /* Once we support multiple 5380s (e.g. DuoDock) we'll do
        something different here */
     instance = scsi_register (tpnt, sizeof(struct NCR5380_hostdata));
+    if (instance = NULL) {
+        printk(KERN_ERR "mac_scsi: scsi_register failed.\n");
+        return 0;
+    }
 #if NDEBUG
     default_instance = instance;
 #endif
diff -uprN -X linux-2.6.18-rc6-orig/Documentation/dontdiff linux-2.6.18-rc6-orig/include/linux/utsrelease.h linux-2.6.18-rc6/include/linux/utsrelease.h
--- linux-2.6.18-rc6-orig/include/linux/utsrelease.h	1970-01-01 05:30:00.000000000 +0530
+++ linux-2.6.18-rc6/include/linux/utsrelease.h	2006-09-11 15:57:19.000000000 +0530
@@ -0,0 +1 @@
+#define UTS_RELEASE "2.6.18-rc6"


_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
