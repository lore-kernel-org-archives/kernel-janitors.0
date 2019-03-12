From: "Milan P. Gandhi" <mgandhi@redhat.com>
Date: Tue, 12 Mar 2019 09:51:54 +0000
Subject: [PATCH] Fix for a small typo
Message-Id: <20190312095149.GA10972@machine1>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Signed-off-by: Milan P. Gandhi <mgandhi@redhat.com>
---
 drivers/scsi/qla2xxx/qla_bsg.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/scsi/qla2xxx/qla_bsg.c b/drivers/scsi/qla2xxx/qla_bsg.c
index 17d42658ad9a..f2b95f11a71c 100644
--- a/drivers/scsi/qla2xxx/qla_bsg.c
+++ b/drivers/scsi/qla2xxx/qla_bsg.c
@@ -1354,7 +1354,7 @@ qla24xx_iidma(struct bsg_job *bsg_job)
 
 	if (rval) {
 		ql_log(ql_log_warn, vha, 0x704c,
-		    "iIDMA cmd failed for %8phN -- "
+		    "iiDMA cmd failed for %8phN -- "
 		    "%04x %x %04x %04x.\n", fcport->port_name,
 		    rval, fcport->fp_speed, mb[0], mb[1]);
 		rval = (DID_ERROR << 16);
