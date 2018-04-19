From: Wolfram Sang <wsa+renesas@sang-engineering.com>
Date: Thu, 19 Apr 2018 14:06:24 +0000
Subject: [PATCH 54/61] uio: simplify getting .drvdata
Message-Id: <20180419140641.27926-55-wsa+renesas@sang-engineering.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180419140641.27926-1-wsa+renesas@sang-engineering.com>
In-Reply-To: <20180419140641.27926-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org, kernel-janitors@vger.kernel.org, Wolfram Sang <wsa+renesas@sang-engineering.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>

We should get drvdata from struct device directly. Going via
platform_device is an unneeded step back and forth.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

Build tested only. buildbot is happy. Please apply individually.

 drivers/uio/uio_fsl_elbc_gpcm.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/uio/uio_fsl_elbc_gpcm.c b/drivers/uio/uio_fsl_elbc_gpcm.c
index b46323d9dc18..50b460c540f7 100644
--- a/drivers/uio/uio_fsl_elbc_gpcm.c
+++ b/drivers/uio/uio_fsl_elbc_gpcm.c
@@ -73,8 +73,7 @@ DEVICE_ATTR(reg_or, S_IRUGO|S_IWUSR|S_IWGRP, reg_show, reg_store);
 static ssize_t reg_show(struct device *dev, struct device_attribute *attr,
 			char *buf)
 {
-	struct platform_device *pdev = to_platform_device(dev);
-	struct uio_info *info = platform_get_drvdata(pdev);
+	struct uio_info *info = dev_get_drvdata(dev);
 	struct fsl_elbc_gpcm *priv = info->priv;
 	struct fsl_lbc_bank *bank = &priv->lbc->bank[priv->bank];
 
@@ -93,8 +92,7 @@ static ssize_t reg_show(struct device *dev, struct device_attribute *attr,
 static ssize_t reg_store(struct device *dev, struct device_attribute *attr,
 			 const char *buf, size_t count)
 {
-	struct platform_device *pdev = to_platform_device(dev);
-	struct uio_info *info = platform_get_drvdata(pdev);
+	struct uio_info *info = dev_get_drvdata(dev);
 	struct fsl_elbc_gpcm *priv = info->priv;
 	struct fsl_lbc_bank *bank = &priv->lbc->bank[priv->bank];
 	unsigned long val;
-- 
2.11.0

