From: Colin King <colin.king@canonical.com>
Date: Tue, 12 Dec 2017 11:32:00 +0000
Subject: [PATCH][misc-next] misc: mic: remove unused label 'done'
Message-Id: <20171212113200.14319-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Sudeep Dutt <sudeep.dutt@intel.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The label 'done' in function vop_ioctl is not used, so remove it. Fixes
build warning:

drivers/misc/mic/vop/vop_vringh.c:1001:1: warning: label 'done' defined but
not used [-Wunused-label]

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/misc/mic/vop/vop_vringh.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/misc/mic/vop/vop_vringh.c b/drivers/misc/mic/vop/vop_vringh.c
index b995cf741388..01d1f2ba7bb8 100644
--- a/drivers/misc/mic/vop/vop_vringh.c
+++ b/drivers/misc/mic/vop/vop_vringh.c
@@ -998,7 +998,6 @@ static long vop_ioctl(struct file *f, unsigned int cmd, unsigned long arg)
 			goto __unlock_ret;
 		}
 		ret = vop_virtio_config_change(vdev, buf);
-done:
 		kfree(buf);
 __unlock_ret:
 		mutex_unlock(&vdev->vdev_mutex);
-- 
2.14.1

