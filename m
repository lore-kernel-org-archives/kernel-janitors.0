From: Colin King <colin.king@canonical.com>
Date: Mon, 10 Aug 2020 08:50:57 +0000
Subject: [PATCH] scsi: bnx2fc: fix spelling mistake "couldnt" -> "couldn't"
Message-Id: <20200810085057.49039-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20171201093725.9274-1-colin.king@canonical.com>
In-Reply-To: <20171201093725.9274-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: QLogic-Storage-Upstream@qlogic.com, "James E . J . Bottomley" <jejb@linux.ibm.com>, "Martin K . Petersen" <martin.petersen@oracle.com>, linux-scsi@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There are spelling mistakes in various printk messages. Fix these.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/scsi/bnx2fc/bnx2fc_io.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/scsi/bnx2fc/bnx2fc_io.c b/drivers/scsi/bnx2fc/bnx2fc_io.c
index 1aba5897ccb0..1a0dc18d6915 100644
--- a/drivers/scsi/bnx2fc/bnx2fc_io.c
+++ b/drivers/scsi/bnx2fc/bnx2fc_io.c
@@ -864,7 +864,7 @@ int bnx2fc_initiate_abts(struct bnx2fc_cmd *io_req)
 
 	abts_io_req = bnx2fc_elstm_alloc(tgt, BNX2FC_ABTS);
 	if (!abts_io_req) {
-		printk(KERN_ERR PFX "abts: couldnt allocate cmd\n");
+		printk(KERN_ERR PFX "abts: couldn't allocate cmd\n");
 		rc = FAILED;
 		goto abts_err;
 	}
@@ -957,7 +957,7 @@ int bnx2fc_initiate_seq_cleanup(struct bnx2fc_cmd *orig_io_req, u32 offset,
 
 	seq_clnp_req = bnx2fc_elstm_alloc(tgt, BNX2FC_SEQ_CLEANUP);
 	if (!seq_clnp_req) {
-		printk(KERN_ERR PFX "cleanup: couldnt allocate cmd\n");
+		printk(KERN_ERR PFX "cleanup: couldn't allocate cmd\n");
 		rc = -ENOMEM;
 		kfree(cb_arg);
 		goto cleanup_err;
@@ -1015,7 +1015,7 @@ int bnx2fc_initiate_cleanup(struct bnx2fc_cmd *io_req)
 
 	cleanup_io_req = bnx2fc_elstm_alloc(tgt, BNX2FC_CLEANUP);
 	if (!cleanup_io_req) {
-		printk(KERN_ERR PFX "cleanup: couldnt allocate cmd\n");
+		printk(KERN_ERR PFX "cleanup: couldn't allocate cmd\n");
 		rc = -1;
 		goto cleanup_err;
 	}
-- 
2.27.0
