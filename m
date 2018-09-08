From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sat, 08 Sep 2018 08:42:27 +0000
Subject: [PATCH] scsi: qla2xxx: Fix an endian bug in fcpcmd_is_corrupted()
Message-Id: <20180908084227.xo4g5aekndokopus@kili.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

We should first do the le16_to_cpu endian conversion and then apply
the FCP_CMD_LENGTH_MASK mask.

Fixes: 5f35509db179 ("qla2xxx: Terminate exchange if corrupted")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
I just happened to spot this when I was reviewing something unrelated.
I don't have the hardware to test it, so please review carefully.

diff --git a/drivers/scsi/qla2xxx/qla_target.h b/drivers/scsi/qla2xxx/qla_target.h
index fecf96f0225c..199d3ba1916d 100644
--- a/drivers/scsi/qla2xxx/qla_target.h
+++ b/drivers/scsi/qla2xxx/qla_target.h
@@ -374,8 +374,8 @@ struct atio_from_isp {
 static inline int fcpcmd_is_corrupted(struct atio *atio)
 {
 	if (atio->entry_type = ATIO_TYPE7 &&
-	    (le16_to_cpu(atio->attr_n_length & FCP_CMD_LENGTH_MASK) <
-	    FCP_CMD_LENGTH_MIN))
+	    ((le16_to_cpu(atio->attr_n_length) & FCP_CMD_LENGTH_MASK) <
+	     FCP_CMD_LENGTH_MIN))
 		return 1;
 	else
 		return 0;
