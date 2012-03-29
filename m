From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 29 Mar 2012 18:52:57 +0000
Subject: [patch] Staging: rts_pstor: off by one in for loop
Message-Id: <20120329185257.GC21812@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

I already fixed the other similar for loop in this file.  I'm not sure
how I missed this one.  We use seg_no+1 inside the loop so we can't go
right up to the end of the loop.

Also if we don't break out of the loop then we end up past the end of
the array, but with this fix we end up on the last element.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/staging/rts_pstor/ms.c b/drivers/staging/rts_pstor/ms.c
index 66341df..f9a4498 100644
--- a/drivers/staging/rts_pstor/ms.c
+++ b/drivers/staging/rts_pstor/ms.c
@@ -3498,7 +3498,8 @@ static int ms_rw_multi_sector(struct scsi_cmnd *srb, struct rtsx_chip *chip, u32
 
 		log_blk++;
 
-		for (seg_no = 0; seg_no < sizeof(ms_start_idx)/2; seg_no++) {
+		for (seg_no = 0; seg_no < ARRAY_SIZE(ms_start_idx) - 1;
+				seg_no++) {
 			if (log_blk < ms_start_idx[seg_no+1])
 				break;
 		}
