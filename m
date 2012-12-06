From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Thu, 06 Dec 2012 22:15:53 +0000
Subject: [PATCH 1/2] drivers/w1/masters/mxc_w1.c: use devm_ functions
Message-Id: <1354835724-26945-2-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Evgeniy Polyakov <zbr@ioremap.net>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Julia Lawall <Julia.Lawall@lip6.fr>

The various devm_ functions allocate memory that is released when a driver
detaches.  This patch uses these functions for data that is allocated in
the probe function of a platform device and is only freed in the remove
function.

At the same time, this fixes two faults.  First, mdev, the result of
kzalloc, was never freed.  Second, on failure of ioremap, 0 was returned.
This has been replaced by -EBUSY, which was the failure value for the call
to request_mem_region, with which the call to ioremap has been combined.

The warning message on failure of ioremap is dropped, because
devm_request_and_ioremap already gives such messages on failure.

Finally, the initial call to platform_get_resource is moved closer to the
call to devm_request_and_ioremap, which takes care of checking whether its
result is NULL, implying that a test on the result of this call to
platform_get_resource is not needed.

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/w1/masters/mxc_w1.c |   49 ++++++++------------------------------------
 1 file changed, 10 insertions(+), 39 deletions(-)

diff --git a/drivers/w1/masters/mxc_w1.c b/drivers/w1/masters/mxc_w1.c
index d338b56..999a30c 100644
--- a/drivers/w1/masters/mxc_w1.c
+++ b/drivers/w1/masters/mxc_w1.c
@@ -109,34 +109,21 @@ static int mxc_w1_probe(struct platform_device *pdev)
 	struct resource *res;
 	int err = 0;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	if (!res)
-		return -ENODEV;
-
-	mdev = kzalloc(sizeof(struct mxc_w1_device), GFP_KERNEL);
+	mdev = devm_kzalloc(&pdev->dev, sizeof(struct mxc_w1_device),
+			    GFP_KERNEL);
 	if (!mdev)
 		return -ENOMEM;
 
-	mdev->clk = clk_get(&pdev->dev, NULL);
-	if (IS_ERR(mdev->clk)) {
-		err = PTR_ERR(mdev->clk);
-		goto failed_clk;
-	}
+	mdev->clk = devm_clk_get(&pdev->dev, NULL);
+	if (IS_ERR(mdev->clk))
+		return PTR_ERR(mdev->clk);
 
 	mdev->clkdiv = (clk_get_rate(mdev->clk) / 1000000) - 1;
 
-	res = request_mem_region(res->start, resource_size(res),
-				"mxc_w1");
-	if (!res) {
-		err = -EBUSY;
-		goto failed_req;
-	}
-
-	mdev->regs = ioremap(res->start, resource_size(res));
-	if (!mdev->regs) {
-		dev_err(&pdev->dev, "Cannot map mxc_w1 registers\n");
-		goto failed_ioremap;
-	}
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	mdev->regs = devm_request_and_ioremap(&pdev->dev, res);
+	if (!mdev->regs)
+		return -EBUSY;
 
 	clk_prepare_enable(mdev->clk);
 	__raw_writeb(mdev->clkdiv, mdev->regs + MXC_W1_TIME_DIVIDER);
@@ -148,20 +135,10 @@ static int mxc_w1_probe(struct platform_device *pdev)
 	err = w1_add_master_device(&mdev->bus_master);
 
 	if (err)
-		goto failed_add;
+		return err;
 
 	platform_set_drvdata(pdev, mdev);
 	return 0;
-
-failed_add:
-	iounmap(mdev->regs);
-failed_ioremap:
-	release_mem_region(res->start, resource_size(res));
-failed_req:
-	clk_put(mdev->clk);
-failed_clk:
-	kfree(mdev);
-	return err;
 }
 
 /*
@@ -170,16 +147,10 @@ failed_clk:
 static int mxc_w1_remove(struct platform_device *pdev)
 {
 	struct mxc_w1_device *mdev = platform_get_drvdata(pdev);
-	struct resource *res;
-
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 
 	w1_remove_master_device(&mdev->bus_master);
 
-	iounmap(mdev->regs);
-	release_mem_region(res->start, resource_size(res));
 	clk_disable_unprepare(mdev->clk);
-	clk_put(mdev->clk);
 
 	platform_set_drvdata(pdev, NULL);
 

