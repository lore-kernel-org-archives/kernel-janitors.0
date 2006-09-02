From: ville palo <ville.palo@vi64pa.net>
Date: Sat, 02 Sep 2006 12:43:30 +0000
Subject: [KJ] [PATCH] scsi/gdth.c: Added checks for return values
Message-Id: <1157201011.9695.17.camel@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


Added checks for return values of the scsi_register().
Without these checks there is a possibility of null 
pointer exceptions.

Signed-off-by: Ville Palo <ville.palo@vi64pa.net>

diff --git a/drivers/scsi/gdth.c b/drivers/scsi/gdth.c
index 43afd47..6af5fe5 100644
--- a/drivers/scsi/gdth.c
+++ b/drivers/scsi/gdth.c
@@ -4439,13 +4439,14 @@ static int __init gdth_detect(Scsi_Host_
                     virt_ctr = 1;
                     /* register addit. SCSI channels as virtual controllers */
                     for (b = 1; b < ha->bus_cnt + 1; ++b) {
-                        shp = scsi_register(shtp,sizeof(gdth_num_str));
-                        shp->unchecked_isa_dma = 1;
-                        shp->irq = ha->irq;
-                        shp->dma_channel = ha->drq;
-                        gdth_ctr_vtab[gdth_ctr_vcount++] = shp;
-                        NUMDATA(shp)->hanum = (ushort)hanum;
-                        NUMDATA(shp)->busnum = b;
+                        if ((shp = scsi_register(shtp,sizeof(gdth_num_str))) != NULL) {
+                        	shp->unchecked_isa_dma = 1;
+                        	shp->irq = ha->irq;
+                        	shp->dma_channel = ha->drq;
+                        	gdth_ctr_vtab[gdth_ctr_vcount++] = shp;
+                        	NUMDATA(shp)->hanum = (ushort)hanum;
+                        	NUMDATA(shp)->busnum = b;
+			}
                     }
                 }  
 
@@ -4563,13 +4564,14 @@ static int __init gdth_detect(Scsi_Host_
                     virt_ctr = 1;
                     /* register addit. SCSI channels as virtual controllers */
                     for (b = 1; b < ha->bus_cnt + 1; ++b) {
-                        shp = scsi_register(shtp,sizeof(gdth_num_str));
-                        shp->unchecked_isa_dma = 0;
-                        shp->irq = ha->irq;
-                        shp->dma_channel = 0xff;
-                        gdth_ctr_vtab[gdth_ctr_vcount++] = shp;
-                        NUMDATA(shp)->hanum = (ushort)hanum;
-                        NUMDATA(shp)->busnum = b;
+                        if ((shp = scsi_register(shtp,sizeof(gdth_num_str))) != NULL) {
+                        	shp->unchecked_isa_dma = 0;
+                        	shp->irq = ha->irq;
+                        	shp->dma_channel = 0xff;
+                        	gdth_ctr_vtab[gdth_ctr_vcount++] = shp;
+                        	NUMDATA(shp)->hanum = (ushort)hanum;
+                        	NUMDATA(shp)->busnum = b;
+			}
                     }
                 }  
 
@@ -4702,13 +4704,14 @@ static int __init gdth_detect(Scsi_Host_
             virt_ctr = 1;
             /* register addit. SCSI channels as virtual controllers */
             for (b = 1; b < ha->bus_cnt + 1; ++b) {
-                shp = scsi_register(shtp,sizeof(gdth_num_str));
-                shp->unchecked_isa_dma = 0;
-                shp->irq = ha->irq;
-                shp->dma_channel = 0xff;
-                gdth_ctr_vtab[gdth_ctr_vcount++] = shp;
-                NUMDATA(shp)->hanum = (ushort)hanum;
-                NUMDATA(shp)->busnum = b;
+                if ((shp = scsi_register(shtp,sizeof(gdth_num_str))) != NULL) {
+                	shp->unchecked_isa_dma = 0;
+                	shp->irq = ha->irq;
+                	shp->dma_channel = 0xff;
+                	gdth_ctr_vtab[gdth_ctr_vcount++] = shp;
+                	NUMDATA(shp)->hanum = (ushort)hanum;
+                	NUMDATA(shp)->busnum = b;
+		}
             }
         }  
 


_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
