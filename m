From: Javier Martinez Canillas <martinez.javier@gmail.com>
Date: Sat, 10 Jul 2010 03:28:13 +0000
Subject: [PATCH 2/3] clean staging/spectra: use new REQ_FLUSH flag
Message-Id: <1278732493.1725.19.camel@lenovo>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

REQ_TYPE_LINUX_BLOCK and REQ_LB_OP_FLUSH doesn't exist anymore. Using
the new REQ_FLUSH flag instead

Signed-off-by: Javier Martinez Canillas <martinez.javier@gmail.com>
---
 drivers/staging/spectra/ffsport.c |    3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/spectra/ffsport.c
b/drivers/staging/spectra/ffsport.c
index eca6536..00a0ac0 100644
--- a/drivers/staging/spectra/ffsport.c
+++ b/drivers/staging/spectra/ffsport.c
@@ -289,8 +289,7 @@ static int do_transfer(struct spectra_nand_dev *tr,
struct request *req)
 			IdentifyDeviceData.PagesPerBlock *
 			res_blks_os;
 
-	if (req->cmd_type = REQ_TYPE_LINUX_BLOCK &&
-			req->cmd[0] = REQ_LB_OP_FLUSH) {
+	if (req->cmd_type & REQ_FLUSH) {
 		if (force_flush_cache()) /* Fail to flush cache */
 			return -EIO;
 		else
-- 
1.7.0.4



