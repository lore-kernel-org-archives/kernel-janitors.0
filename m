From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 23 Nov 2018 07:18:23 +0000
Subject: [PATCH] ide-atapi: Check for blk_mq_alloc_request() errors
Message-Id: <20181123071823.zc6lfurqf3o2qn4b@kili.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

If blk_mq_alloc_request() fails then it leads to an error pointer
dereference.

Fixes: 600335205b8d ("ide: convert to blk-mq")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/ide/ide-atapi.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/ide/ide-atapi.c b/drivers/ide/ide-atapi.c
index da58020a144e..6eea0a661240 100644
--- a/drivers/ide/ide-atapi.c
+++ b/drivers/ide/ide-atapi.c
@@ -200,6 +200,8 @@ void ide_prep_sense(ide_drive_t *drive, struct request *rq)
 	if (!sense_rq) {
 		sense_rq = blk_mq_alloc_request(drive->queue, REQ_OP_DRV_IN,
 					BLK_MQ_REQ_RESERVED | BLK_MQ_REQ_NOWAIT);
+		if (IS_ERR(sense_rq))
+			return;
 		drive->sense_rq = sense_rq;
 	}
 	req = scsi_req(sense_rq);
-- 
2.11.0
