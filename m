From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 29 Mar 2012 18:52:20 +0000
Subject: [patch] Staging: rts5139: a couple off by one fixes
Message-Id: <20120329185220.GB21812@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Inside the array we check ms_start_idx[seg_no + 1] so on the last round
through we end up going past the end of the array.

Also if we don't break out of the loop early then we are beyond the end
of the array there as well.  With this change, if we don't find what we
are looking for, we end on the last element of the array.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/staging/rts5139/ms.c b/drivers/staging/rts5139/ms.c
index b0e9071..02aad2d 100644
--- a/drivers/staging/rts5139/ms.c
+++ b/drivers/staging/rts5139/ms.c
@@ -3864,7 +3864,7 @@ static int ms_rw_multi_sector(struct scsi_cmnd *srb, struct rts51x_chip *chip,
 	log_blk = (u16) (start_sector >> ms_card->block_shift);
 	start_page = (u8) (start_sector & ms_card->page_off);
 
-	for (seg_no = 0; seg_no < sizeof(ms_start_idx) / 2; seg_no++) {
+	for (seg_no = 0; seg_no < ARRAY_SIZE(ms_start_idx) - 1; seg_no++) {
 		if (log_blk < ms_start_idx[seg_no + 1])
 			break;
 	}
@@ -4020,7 +4020,8 @@ static int ms_rw_multi_sector(struct scsi_cmnd *srb, struct rts51x_chip *chip,
 
 		log_blk++;
 
-		for (seg_no = 0; seg_no < sizeof(ms_start_idx) / 2; seg_no++) {
+		for (seg_no = 0; seg_no < ARRAY_SIZE(ms_start_idx) - 1;
+				seg_no++) {
 			if (log_blk < ms_start_idx[seg_no + 1])
 				break;
 		}
