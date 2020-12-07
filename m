From: Colin King <colin.king@canonical.com>
Date: Mon, 07 Dec 2020 14:54:46 +0000
Subject: [PATCH][next] block/rnbd: fix a null pointer dereference on dev->blk_symlink_name
Message-Id: <20201207145446.169978-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Danil Kipnis <danil.kipnis@cloud.ionos.com>, Jack Wang <jinpu.wang@cloud.ionos.com>, Jens Axboe <axboe@kernel.dk>, Jason Gunthorpe <jgg@ziepe.ca>, Bart Van Assche <bvanassche@acm.org>, linux-block@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Currently in the case where dev->blk_symlink_name fails to be allocates
the error return path attempts to set an end-of-string character to
the unallocated dev->blk_symlink_name causing a null pointer dereference
error. Fix this by returning with an explicity ENOMEM error (which also
is missing in the original code as was not initialized).

Addresses-Coverity: ("Dereference after null check")
Fixes: 1eb54f8f5dd8 ("block/rnbd: client: sysfs interface functions")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/block/rnbd/rnbd-clt-sysfs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/block/rnbd/rnbd-clt-sysfs.c b/drivers/block/rnbd/rnbd-clt-sysfs.c
index c3c96a567568..a7caeedeb198 100644
--- a/drivers/block/rnbd/rnbd-clt-sysfs.c
+++ b/drivers/block/rnbd/rnbd-clt-sysfs.c
@@ -499,7 +499,7 @@ static int rnbd_clt_add_dev_symlink(struct rnbd_clt_dev *dev)
 	dev->blk_symlink_name = kzalloc(len, GFP_KERNEL);
 	if (!dev->blk_symlink_name) {
 		rnbd_clt_err(dev, "Failed to allocate memory for blk_symlink_name\n");
-		goto out_err;
+		return -ENOMEM;
 	}
 
 	ret = rnbd_clt_get_path_name(dev, dev->blk_symlink_name,
-- 
2.29.2
