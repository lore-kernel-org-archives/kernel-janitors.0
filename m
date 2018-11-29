From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 29 Nov 2018 10:37:10 +0000
Subject: [PATCH] scsi: Fix a harmless double shift bug
Message-Id: <20181129103709.nthxjmmmlb2pdr6g@kili.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Smatch generates a warning:

    drivers/scsi/scsi_lib.c:1656 scsi_mq_done() warn: test_bit() takes a bit number

The problem is that SCMD_STATE_COMPLETE is supposed to be bit number 0
and not a mask like "(1 << 0)".  It is used like this:

	if (test_and_set_bit(SCMD_STATE_COMPLETE, &scmd->state))

The test_and_set_bit() has a shift built in so it's a double left shift
and uses bit number 1 instead of number 0.  This bug is harmless because
it's done consistently and it doesn't clash with any other flags.

Fixes: f1342709d18a ("scsi: Do not rely on blk-mq for double completions")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 include/scsi/scsi_cmnd.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/scsi/scsi_cmnd.h b/include/scsi/scsi_cmnd.h
index 3de905e205ce..d85e6befa26b 100644
--- a/include/scsi/scsi_cmnd.h
+++ b/include/scsi/scsi_cmnd.h
@@ -62,7 +62,7 @@ struct scsi_pointer {
 #define SCMD_PRESERVED_FLAGS	(SCMD_UNCHECKED_ISA_DMA | SCMD_INITIALIZED)
 
 /* for scmd->state */
-#define SCMD_STATE_COMPLETE	(1 << 0)
+#define SCMD_STATE_COMPLETE	0
 
 struct scsi_cmnd {
 	struct scsi_request req;
-- 
2.11.0
