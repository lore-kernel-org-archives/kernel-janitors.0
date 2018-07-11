From: Colin King <colin.king@canonical.com>
Date: Wed, 11 Jul 2018 08:23:46 +0000
Subject: [PATCH] rapidio: remove redundant pointer md
Message-Id: <20180711082346.5223-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Matt Porter <mporter@kernel.crashing.org>, Alexandre Bounine <alex.bou9@gmail.com>, linux-kernel@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Pointer md is being assigned but is never used hence it is redundant
and can be removed.

Cleans up clang warning:
warning: variable 'md' set but not used [-Wunused-but-set-variable]

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/rapidio/devices/rio_mport_cdev.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/rapidio/devices/rio_mport_cdev.c b/drivers/rapidio/devices/rio_mport_cdev.c
index a8cb8d2f2abb..cbe467ff1aba 100644
--- a/drivers/rapidio/devices/rio_mport_cdev.c
+++ b/drivers/rapidio/devices/rio_mport_cdev.c
@@ -1006,7 +1006,6 @@ static int rio_mport_transfer_ioctl(struct file *filp, void __user *arg)
 static int rio_mport_wait_for_async_dma(struct file *filp, void __user *arg)
 {
 	struct mport_cdev_priv *priv;
-	struct mport_dev *md;
 	struct rio_async_tx_wait w_param;
 	struct mport_dma_req *req;
 	dma_cookie_t cookie;
@@ -1016,7 +1015,6 @@ static int rio_mport_wait_for_async_dma(struct file *filp, void __user *arg)
 	int ret;
 
 	priv = (struct mport_cdev_priv *)filp->private_data;
-	md = priv->md;
 
 	if (unlikely(copy_from_user(&w_param, arg, sizeof(w_param))))
 		return -EFAULT;
-- 
2.17.1

