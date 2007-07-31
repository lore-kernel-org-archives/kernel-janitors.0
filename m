From: Mariusz Kozlowski <m.kozlowski@tuxland.pl>
Date: Tue, 31 Jul 2007 16:52:01 +0000
Subject: [PATCH 02] kmalloc + memset conversion to kzalloc
Message-Id: <200707311852.01434.m.kozlowski@tuxland.pl>
List-Id: <kernel-janitors.vger.kernel.org>
References: <200707311845.48807.m.kozlowski@tuxland.pl>
In-Reply-To: <200707311845.48807.m.kozlowski@tuxland.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, linux-scsi@vger.kernel.org

Signed-off-by: Mariusz Kozlowski <m.kozlowski@tuxland.pl>

 drivers/scsi/aic7xxx_old.c | 367101 -> 366983 (-118 bytes)
 drivers/scsi/aic7xxx_old.o | 333892 -> 333192 (-700 bytes)

 drivers/scsi/aic7xxx_old.c |    8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

--- linux-2.6.23-rc1-mm1-a/drivers/scsi/aic7xxx_old.c	2007-07-26 13:07:42.000000000 +0200
+++ linux-2.6.23-rc1-mm1-b/drivers/scsi/aic7xxx_old.c	2007-07-31 14:03:31.000000000 +0200
@@ -8416,10 +8416,9 @@ aic7xxx_alloc(struct scsi_host_template
     *p = *temp;
     p->host = host;

-    p->scb_data = kmalloc(sizeof(scb_data_type), GFP_ATOMIC);
-    if (p->scb_data != NULL)
+    p->scb_data = kzalloc(sizeof(scb_data_type), GFP_ATOMIC);
+    if (!p->scb_data)
     {
-      memset(p->scb_data, 0, sizeof(scb_data_type));
       scbq_init (&p->scb_data->free_scbs);
     }
     else
@@ -9196,10 +9195,9 @@ aic7xxx_detect(struct scsi_host_template
             printk(KERN_INFO "         this driver, we are ignoring it.\n");
           }
         }
-        else if ( (temp_p = kmalloc(sizeof(struct aic7xxx_host),
+        else if ( (temp_p = kzalloc(sizeof(struct aic7xxx_host),
                                     GFP_ATOMIC)) != NULL )
         {
-          memset(temp_p, 0, sizeof(struct aic7xxx_host));
           temp_p->chip = aic_pdevs[i].chip | AHC_PCI;
           temp_p->flags = aic_pdevs[i].flags;
           temp_p->features = aic_pdevs[i].features;
