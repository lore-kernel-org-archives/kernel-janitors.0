From: Emil Goode <emilgoode@gmail.com>
Date: Thu, 06 Jun 2013 13:55:28 +0000
Subject: [PATCH] uio: uio_pruss: Fix potential NULL pointer dereference
Message-Id: <1370526928-20619-1-git-send-email-emilgoode@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: hjk@hansjkoch.de, gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Emil Goode <emilgoode@gmail.com>

In function pruss_probe we free gdev and try to use
it on the next line. I have moved the dereference to
above the kfree of gdev.

Signed-off-by: Emil Goode <emilgoode@gmail.com>
---
 drivers/uio/uio_pruss.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/uio/uio_pruss.c b/drivers/uio/uio_pruss.c
index 6e2ab00..21f7a72 100644
--- a/drivers/uio/uio_pruss.c
+++ b/drivers/uio/uio_pruss.c
@@ -136,9 +136,9 @@ static int pruss_probe(struct platform_device *dev)
 	gdev->pruss_clk = clk_get(&dev->dev, "pruss");
 	if (IS_ERR(gdev->pruss_clk)) {
 		dev_err(&dev->dev, "Failed to get clock\n");
+		ret = PTR_ERR(gdev->pruss_clk);
 		kfree(gdev->info);
 		kfree(gdev);
-		ret = PTR_ERR(gdev->pruss_clk);
 		return ret;
 	} else {
 		clk_enable(gdev->pruss_clk);
-- 
1.7.10.4

