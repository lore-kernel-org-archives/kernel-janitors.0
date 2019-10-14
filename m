From: Colin King <colin.king@canonical.com>
Date: Mon, 14 Oct 2019 12:16:13 +0000
Subject: [PATCH] scsi: fix unintended sign extension on left shifts
Message-Id: <20191014121613.21999-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "James E . J . Bottomley" <jejb@linux.ibm.com>, "Martin K . Petersen" <martin.petersen@oracle.com>, Tomohiro Kusumi <kusumi.tomohiro@jp.fujitsu.com>, Kei Tokunaga <tokunaga.keiich@jp.fujitsu.com>, Xiao Guangrong <xiaoguangrong@cn.fujitsu.com>, linux-scsi@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Shifting a u8 left will cause the value to be promoted to an integer. If
the top bit of the u8 is set then the following conversion to an u64 will
sign extend the value causing the upper 32 bits to be set in the result.

Fix this by casting the u8 value to a u64 before the shift.

Fixes: bf8162354233 ("[SCSI] add scsi trace core functions and put trace points")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/scsi/scsi_trace.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/scsi/scsi_trace.c b/drivers/scsi/scsi_trace.c
index 0f17e7dac1b0..1d3a5a2dc229 100644
--- a/drivers/scsi/scsi_trace.c
+++ b/drivers/scsi/scsi_trace.c
@@ -38,7 +38,7 @@ scsi_trace_rw10(struct trace_seq *p, unsigned char *cdb, int len)
 	const char *ret = trace_seq_buffer_ptr(p);
 	sector_t lba = 0, txlen = 0;
 
-	lba |= (cdb[2] << 24);
+	lba |= ((u64)cdb[2] << 24);
 	lba |= (cdb[3] << 16);
 	lba |= (cdb[4] << 8);
 	lba |=  cdb[5];
@@ -63,11 +63,11 @@ scsi_trace_rw12(struct trace_seq *p, unsigned char *cdb, int len)
 	const char *ret = trace_seq_buffer_ptr(p);
 	sector_t lba = 0, txlen = 0;
 
-	lba |= (cdb[2] << 24);
+	lba |= ((u64)cdb[2] << 24);
 	lba |= (cdb[3] << 16);
 	lba |= (cdb[4] << 8);
 	lba |=  cdb[5];
-	txlen |= (cdb[6] << 24);
+	txlen |= ((u64)cdb[6] << 24);
 	txlen |= (cdb[7] << 16);
 	txlen |= (cdb[8] << 8);
 	txlen |=  cdb[9];
@@ -90,11 +90,11 @@ scsi_trace_rw16(struct trace_seq *p, unsigned char *cdb, int len)
 	lba |= ((u64)cdb[3] << 48);
 	lba |= ((u64)cdb[4] << 40);
 	lba |= ((u64)cdb[5] << 32);
-	lba |= (cdb[6] << 24);
+	lba |= ((u64)cdb[6] << 24);
 	lba |= (cdb[7] << 16);
 	lba |= (cdb[8] << 8);
 	lba |=  cdb[9];
-	txlen |= (cdb[10] << 24);
+	txlen |= ((u64)cdb[10] << 24);
 	txlen |= (cdb[11] << 16);
 	txlen |= (cdb[12] << 8);
 	txlen |=  cdb[13];
@@ -140,7 +140,7 @@ scsi_trace_rw32(struct trace_seq *p, unsigned char *cdb, int len)
 	lba |= ((u64)cdb[13] << 48);
 	lba |= ((u64)cdb[14] << 40);
 	lba |= ((u64)cdb[15] << 32);
-	lba |= (cdb[16] << 24);
+	lba |= ((u64)cdb[16] << 24);
 	lba |= (cdb[17] << 16);
 	lba |= (cdb[18] << 8);
 	lba |=  cdb[19];
@@ -148,7 +148,7 @@ scsi_trace_rw32(struct trace_seq *p, unsigned char *cdb, int len)
 	ei_lbrt |= (cdb[21] << 16);
 	ei_lbrt |= (cdb[22] << 8);
 	ei_lbrt |=  cdb[23];
-	txlen |= (cdb[28] << 24);
+	txlen |= ((u64)cdb[28] << 24);
 	txlen |= (cdb[29] << 16);
 	txlen |= (cdb[30] << 8);
 	txlen |=  cdb[31];
@@ -201,7 +201,7 @@ scsi_trace_service_action_in(struct trace_seq *p, unsigned char *cdb, int len)
 	lba |= ((u64)cdb[3] << 48);
 	lba |= ((u64)cdb[4] << 40);
 	lba |= ((u64)cdb[5] << 32);
-	lba |= (cdb[6] << 24);
+	lba |= ((u64)cdb[6] << 24);
 	lba |= (cdb[7] << 16);
 	lba |= (cdb[8] << 8);
 	lba |=  cdb[9];
-- 
2.20.1
