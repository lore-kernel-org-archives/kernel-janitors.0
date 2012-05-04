From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 04 May 2012 17:39:55 +0000
Subject: [patch] rbd: endian bug in rbd_req_cb()
Message-Id: <20120504173954.GA18827@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Yehuda Sadeh <yehuda@hq.newdream.net>
Cc: Sage Weil <sage@newdream.net>, ceph-devel@vger.kernel.org, kernel-janitors@vger.kernel.org

Sparse complains about this because:
drivers/block/rbd.c:996:20: warning: cast to restricted __le32
drivers/block/rbd.c:996:20: warning: cast from restricted __le16

These are set in osd_req_encode_op() and they are le16.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/block/rbd.c b/drivers/block/rbd.c
index c1f7701..64d3d6f 100644
--- a/drivers/block/rbd.c
+++ b/drivers/block/rbd.c
@@ -993,7 +993,7 @@ static void rbd_req_cb(struct ceph_osd_request *req, struct ceph_msg *msg)
 	op = (void *)(replyhead + 1);
 	rc = le32_to_cpu(replyhead->result);
 	bytes = le64_to_cpu(op->extent.length);
-	read_op = (le32_to_cpu(op->op) = CEPH_OSD_OP_READ);
+	read_op = (le16_to_cpu(op->op) = CEPH_OSD_OP_READ);
 
 	dout("rbd_req_cb bytes=%lld readop=%d rc=%d\n", bytes, read_op, rc);
 
