From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Tue, 19 May 2020 09:19:24 +0000
Subject: [PATCH -next] block/rnbd: server: fix error return code in rnbd_srv_create_dev_sysfs()
Message-Id: <20200519091924.134494-1-weiyongjun1@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Danil Kipnis <danil.kipnis@cloud.ionos.com>, Jack Wang <jinpu.wang@cloud.ionos.com>, Jens Axboe <axboe@kernel.dk>
Cc: Wei Yongjun <weiyongjun1@huawei.com>, linux-block@vger.kernel.org, kernel-janitors@vger.kernel.org, Hulk Robot <hulkci@huawei.com>

Fix to return negative error code -ENOMEM from the error handling
case instead of 0, as done elsewhere in this function.

Fixes: 8cee532f469b ("block/rnbd: server: sysfs interface functions")
Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/block/rnbd/rnbd-srv-sysfs.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/block/rnbd/rnbd-srv-sysfs.c b/drivers/block/rnbd/rnbd-srv-sysfs.c
index 106775c074d1..5ba1a31ad626 100644
--- a/drivers/block/rnbd/rnbd-srv-sysfs.c
+++ b/drivers/block/rnbd/rnbd-srv-sysfs.c
@@ -52,8 +52,10 @@ int rnbd_srv_create_dev_sysfs(struct rnbd_srv_dev *dev,
 
 	dev->dev_sessions_kobj = kobject_create_and_add("sessions",
 							&dev->dev_kobj);
-	if (!dev->dev_sessions_kobj)
+	if (!dev->dev_sessions_kobj) {
+		ret = -ENOMEM;
 		goto put_dev_kobj;
+	}
 
 	bdev_kobj = &disk_to_dev(bdev->bd_disk)->kobj;
 	ret = sysfs_create_link(&dev->dev_kobj, bdev_kobj, "block_dev");
