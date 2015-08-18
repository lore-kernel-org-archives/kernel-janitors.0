From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 18 Aug 2015 08:57:43 +0000
Subject: [patch] cxlflash: shift wrapping bug in afu_link_reset()
Message-Id: <20150818085743.GA3965@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "James E.J. Bottomley" <JBottomley@odin.com>, "Matthew R. Ochs" <mrochs@linux.vnet.ibm.com>
Cc: "Manoj N. Kumar" <manoj@linux.vnet.ibm.com>, Brian King <brking@linux.vnet.ibm.com>, Michael Neuling <mikey@neuling.org>, linux-scsi@vger.kernel.org, kernel-janitors@vger.kernel.org

"port_sel" is a u64 so the shifting should also be a 64 bit shift.

Fixes: c21e0bbfc485 ('cxlflash: Base support for IBM CXL Flash Adapter')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/scsi/cxlflash/main.c b/drivers/scsi/cxlflash/main.c
index 0720d2f..f97421d 100644
--- a/drivers/scsi/cxlflash/main.c
+++ b/drivers/scsi/cxlflash/main.c
@@ -1179,7 +1179,7 @@ static void afu_link_reset(struct afu *afu, int port, u64 *fc_regs)
 
 	/* first switch the AFU to the other links, if any */
 	port_sel = readq_be(&afu->afu_map->global.regs.afu_port_sel);
-	port_sel &= ~(1 << port);
+	port_sel &= ~(1ULL << port);
 	writeq_be(port_sel, &afu->afu_map->global.regs.afu_port_sel);
 	cxlflash_afu_sync(afu, 0, 0, AFU_GSYNC);
 
@@ -1196,7 +1196,7 @@ static void afu_link_reset(struct afu *afu, int port, u64 *fc_regs)
 		       __func__, port);
 
 	/* switch back to include this port */
-	port_sel |= (1 << port);
+	port_sel |= (1ULL << port);
 	writeq_be(port_sel, &afu->afu_map->global.regs.afu_port_sel);
 	cxlflash_afu_sync(afu, 0, 0, AFU_GSYNC);
 
