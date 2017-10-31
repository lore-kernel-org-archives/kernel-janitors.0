From: Colin King <colin.king@canonical.com>
Date: Tue, 31 Oct 2017 11:45:39 +0000
Subject: [PATCH] rapidio: remove reundant pointer md that is assigned but never read
Message-Id: <20171031114539.22058-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Matt Porter <mporter@kernel.crashing.org>, Alexandre Bounine <alexandre.bounine@idt.com>, Logan Gunthorpe <logang@deltatee.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Pointer md is assigned a value but it is never read, hence it is
redundant and can be removed. Cleans up clang warning:

drivers/rapidio/devices/rio_mport_cdev.c:1071:2: warning: Value stored
to 'md' is never read

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/rapidio/devices/rio_mport_cdev.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/rapidio/devices/rio_mport_cdev.c b/drivers/rapidio/devices/rio_mport_cdev.c
index dc5a33f93689..56496e636a40 100644
--- a/drivers/rapidio/devices/rio_mport_cdev.c
+++ b/drivers/rapidio/devices/rio_mport_cdev.c
@@ -1058,7 +1058,6 @@ static int rio_mport_transfer_ioctl(struct file *filp, void __user *arg)
 static int rio_mport_wait_for_async_dma(struct file *filp, void __user *arg)
 {
 	struct mport_cdev_priv *priv;
-	struct mport_dev *md;
 	struct rio_async_tx_wait w_param;
 	struct mport_dma_req *req;
 	dma_cookie_t cookie;
@@ -1068,7 +1067,6 @@ static int rio_mport_wait_for_async_dma(struct file *filp, void __user *arg)
 	int ret;
 
 	priv = (struct mport_cdev_priv *)filp->private_data;
-	md = priv->md;
 
 	if (unlikely(copy_from_user(&w_param, arg, sizeof(w_param))))
 		return -EFAULT;
-- 
2.14.1

