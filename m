From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 21 Apr 2017 19:37:17 +0000
Subject: [PATCH] mtip32xx: Uninitialized variable in mtip_no_dev_cleanup()
Message-Id: <20170421193717.u2cxdq2jyithqqxi@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jens Axboe <axboe@fb.com>, Christoph Hellwig <hch@lst.de>
Cc: Johannes Thumshirn <jthumshirn@suse.de>, Hannes Reinecke <hare@suse.com>, Bart Van Assche <Bart.VanAssche@sandisk.com>, Sachin Shukla <sachin.s5@samsung.com>, Pan Bian <bianpan2016@163.com>, Ming Lei <tom.leiming@gmail.com>, Eric Biggers <ebiggers@google.com>, Mike Christie <mchristi@redhat.com>, Dan Williams <dan.j.williams@intel.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

We set "cmd->state = -ENODEV;" but "cmd" hasn't been initialized yet.
It's weird that GCC doesn't catch this.

Fixes: 4dda4735c581 ("mtip32xx: add a status field to struct mtip_cmd")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
Not tested, please review carefully.

diff --git a/drivers/block/mtip32xx/mtip32xx.c b/drivers/block/mtip32xx/mtip32xx.c
index 66a6bd83faae..bd4bf70a5bcd 100644
--- a/drivers/block/mtip32xx/mtip32xx.c
+++ b/drivers/block/mtip32xx/mtip32xx.c
@@ -4105,14 +4105,12 @@ static int mtip_block_initialize(struct driver_data *dd)
 static void mtip_no_dev_cleanup(struct request *rq, void *data, bool reserv)
 {
 	struct driver_data *dd = (struct driver_data *)data;
-	struct mtip_cmd *cmd;
+	struct mtip_cmd *cmd = mtip_cmd_from_tag(dd, MTIP_TAG_INTERNAL);
 
 	if (likely(!reserv)) {
 		cmd->status = -ENODEV;
 		blk_mq_complete_request(rq);
 	} else if (test_bit(MTIP_PF_IC_ACTIVE_BIT, &dd->port->flags)) {
-
-		cmd = mtip_cmd_from_tag(dd, MTIP_TAG_INTERNAL);
 		if (cmd->comp_func)
 			cmd->comp_func(dd->port, MTIP_TAG_INTERNAL,
 					cmd, -ENODEV);
