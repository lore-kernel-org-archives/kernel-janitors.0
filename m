From: "Suresh Jayaraman" <sjayaraman@novell.com>
Date: Thu, 28 Jun 2007 14:12:22 +0000
Subject: [KJ] [PATCH] scsi: Remove unneccessary cast of return value of
Message-Id: <46840F1E020000F40000A97D@lucius.provo.novell.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Resending the patch since the earlier one was malformed.

Remove unnecessary cast of return value of kmalloc() in the scsi
subsystem.

Signed-off-by: Suresh Jayaraman <sjayaraman@novell.com>
---

diff --git a/drivers/scsi/advansys.c b/drivers/scsi/advansys.c
index 9b3303b..f5cb42e 100644
--- a/drivers/scsi/advansys.c
+++ b/drivers/scsi/advansys.c
@@ -5258,8 +5258,7 @@ advansys_detect(struct scsi_host_template *tpnt)
                  * Allocate buffer carrier structures. The total size
                  * is about 4 KB, so allocate all at once.
                  */
-                carrp -                    (ADV_CARR_T *) kmalloc(ADV_CARRIER_BUFSIZE, GFP_ATOMIC);
+                carrp = kmalloc(ADV_CARRIER_BUFSIZE, GFP_ATOMIC);
                 ASC_DBG1(1, "advansys_detect: carrp 0x%lx\n", (ulong) carrp);
 
                 if (carrp = NULL) {
@@ -5275,8 +5274,7 @@ advansys_detect(struct scsi_host_template *tpnt)
                 for (req_cnt = adv_dvc_varp->max_host_qng;
                     req_cnt > 0; req_cnt--) {
 
-                    reqp = (adv_req_t *)
-                        kmalloc(sizeof(adv_req_t) * req_cnt, GFP_ATOMIC);
+                    reqp = kmalloc(sizeof(adv_req_t) * req_cnt, GFP_ATOMIC);
 
                     ASC_DBG3(1,
                         "advansys_detect: reqp 0x%lx, req_cnt %d, bytes %lu\n",
@@ -5299,8 +5297,7 @@ advansys_detect(struct scsi_host_template *tpnt)
                 boardp->adv_sgblkp = NULL;
                 for (sg_cnt = 0; sg_cnt < ADV_TOT_SG_BLOCK; sg_cnt++) {
 
-                    sgp = (adv_sgblk_t *)
-                        kmalloc(sizeof(adv_sgblk_t), GFP_ATOMIC);
+                    sgp = kmalloc(sizeof(adv_sgblk_t), GFP_ATOMIC);
 
                     if (sgp = NULL) {
                         break;
diff --git a/drivers/scsi/osst.c b/drivers/scsi/osst.c
index 08060fb..7a49c71 100644
--- a/drivers/scsi/osst.c
+++ b/drivers/scsi/osst.c
@@ -5755,9 +5755,8 @@ static int osst_probe(struct device *dev)
 	/* if this is the first attach, build the infrastructure */
 	write_lock(&os_scsi_tapes_lock);
 	if (os_scsi_tapes = NULL) {
-		os_scsi_tapes -			(struct osst_tape **)kmalloc(osst_max_dev * sizeof(struct osst_tape *),
-				   GFP_ATOMIC);
+		os_scsi_tapes = kmalloc(osst_max_dev *
+					sizeof(struct osst_tape *), GFP_ATOMIC);
 		if (os_scsi_tapes = NULL) {
 			write_unlock(&os_scsi_tapes_lock);
 			printk(KERN_ERR "osst :E: Unable to allocate array for OnStream SCSI tapes.\n");

-- 
Suresh Jayaraman


_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
