From: Julia Lawall <julia@diku.dk>
Date: Sat, 17 Oct 2009 06:34:18 +0000
Subject: [PATCH 4/14] drivers/message: Move dereference after NULL test
Message-Id: <Pine.LNX.4.64.0910170833480.9213@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

If the NULL test on dev->i2o_dev or i2o_dev is needed, then the dereference
should be after the NULL test.

A simplified version of the semantic match that detects this problem is as
follows (http://coccinelle.lip6.fr/):

// <smpl>
@match exists@
expression x, E;
identifier fld;
@@

* x->fld
  ... when != \(x = E\|&x\)
* x = NULL
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 drivers/message/i2o/i2o_block.c |    3 ++-
 drivers/message/i2o/i2o_scsi.c  |    3 +--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/message/i2o/i2o_block.c b/drivers/message/i2o/i2o_block.c
index d505b68..67da0aa 100644
--- a/drivers/message/i2o/i2o_block.c
+++ b/drivers/message/i2o/i2o_block.c
@@ -711,7 +711,7 @@ static int i2o_block_transfer(struct request *req)
 {
 	struct i2o_block_device *dev = req->rq_disk->private_data;
 	struct i2o_controller *c;
-	u32 tid = dev->i2o_dev->lct_data.tid;
+	u32 tid;
 	struct i2o_message *msg;
 	u32 *mptr;
 	struct i2o_block_request *ireq = req->special;
@@ -727,6 +727,7 @@ static int i2o_block_transfer(struct request *req)
 		goto exit;
 	}
 
+	tid = dev->i2o_dev->lct_data.tid;
 	c = dev->i2o_dev->iop;
 
 	msg = i2o_msg_get(c);
diff --git a/drivers/message/i2o/i2o_scsi.c b/drivers/message/i2o/i2o_scsi.c
index 3d45817..ea6b219 100644
--- a/drivers/message/i2o/i2o_scsi.c
+++ b/drivers/message/i2o/i2o_scsi.c
@@ -528,7 +528,6 @@ static int i2o_scsi_queuecommand(struct scsi_cmnd *SCpnt,
 	 *      Do the incoming paperwork
 	 */
 	i2o_dev = SCpnt->device->hostdata;
-	c = i2o_dev->iop;
 
 	SCpnt->scsi_done = done;
 
@@ -538,7 +537,7 @@ static int i2o_scsi_queuecommand(struct scsi_cmnd *SCpnt,
 		done(SCpnt);
 		goto exit;
 	}
-
+	c = i2o_dev->iop;
 	tid = i2o_dev->lct_data.tid;
 
 	osm_debug("qcmd: Tid = %03x\n", tid);
