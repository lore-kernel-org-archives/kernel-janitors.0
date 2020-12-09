From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 09 Dec 2020 06:52:19 +0000
Subject: [PATCH] block/rnbd-clt: Fix error code in rnbd_clt_add_dev_symlink()
Message-Id: <X9B0IyxwbBDq+cSS@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Danil Kipnis <danil.kipnis@cloud.ionos.com>, Md Haris Iqbal <haris.iqbal@cloud.ionos.com>
Cc: Jack Wang <jinpu.wang@cloud.ionos.com>, Jens Axboe <axboe@kernel.dk>, Lutz Pogrell <lutz.pogrell@cloud.ionos.com>, linux-block@vger.kernel.org, kernel-janitors@vger.kernel.org

The "ret" variable should be set to -ENOMEM but it returns uninitialized
stack data.

Fixes: 64e8a6ece1a5 ("block/rnbd-clt: Dynamically alloc buffer for pathname & blk_symlink_name")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/block/rnbd/rnbd-clt-sysfs.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/block/rnbd/rnbd-clt-sysfs.c b/drivers/block/rnbd/rnbd-clt-sysfs.c
index c3c96a567568..a5cd47b82b40 100644
--- a/drivers/block/rnbd/rnbd-clt-sysfs.c
+++ b/drivers/block/rnbd/rnbd-clt-sysfs.c
@@ -499,6 +499,7 @@ static int rnbd_clt_add_dev_symlink(struct rnbd_clt_dev *dev)
 	dev->blk_symlink_name = kzalloc(len, GFP_KERNEL);
 	if (!dev->blk_symlink_name) {
 		rnbd_clt_err(dev, "Failed to allocate memory for blk_symlink_name\n");
+		ret = -ENOMEM;
 		goto out_err;
 	}
 
-- 
2.29.2
