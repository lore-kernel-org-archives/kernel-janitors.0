From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 26 Aug 2020 11:32:42 +0000
Subject: [PATCH] rnbd: Fix an error code in process_rdma()
Message-Id: <20200826113242.GC393664@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Danil Kipnis <danil.kipnis@cloud.ionos.com>
Cc: Jack Wang <jinpu.wang@cloud.ionos.com>, Jens Axboe <axboe@kernel.dk>, Guoqing Jiang <guoqing.jiang@cloud.ionos.com>, linux-block@vger.kernel.org, kernel-janitors@vger.kernel.org

The error code is uninitialized on this error path.

Fixes: 735d77d4fd28 ("rnbd: remove rnbd_dev_submit_io")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/block/rnbd/rnbd-srv.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/block/rnbd/rnbd-srv.c b/drivers/block/rnbd/rnbd-srv.c
index 0fb94843a495..5b69bc56b225 100644
--- a/drivers/block/rnbd/rnbd-srv.c
+++ b/drivers/block/rnbd/rnbd-srv.c
@@ -149,6 +149,7 @@ static int process_rdma(struct rtrs_srv *sess,
 	bio = rnbd_bio_map_kern(data, sess_dev->rnbd_dev->ibd_bio_set, datalen, GFP_KERNEL);
 	if (IS_ERR(bio)) {
 		rnbd_srv_err(sess_dev, "Failed to generate bio, err: %ld\n", PTR_ERR(bio));
+		err = PTR_ERR(bio);
 		goto sess_dev_put;
 	}
 
-- 
2.28.0
