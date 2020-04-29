From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Wed, 29 Apr 2020 06:52:52 +0000
Subject: [PATCH 3/4 v2] firmware: stratix10-svc: Fix some error handling paths in 'stratix10_svc_drv_probe()'
Message-Id: <0ff40f39de4deb63b03b363d0e0f3e3c8cccd62d.1588142343.git.christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <cover.1588142343.git.christophe.jaillet@wanadoo.fr>
In-Reply-To: <cover.1588142343.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: richard.gong@linux.intel.com, gregkh@linuxfoundation.org, atull@kernel.org
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

If an error occurs after calling 'svc_create_memory_pool()', the allocated
genpool should be destroyed with 'gen_pool_destroy()', as already done in
the remove function.

If an error occurs after calling 'kfifo_alloc()', the allocated memory
should be freed with 'kfifo_free()', as already done in the remove
function.

While at it, also move a 'platform_device_put()' call to the error handling
path.

Fixes: b5dc75c915cd ("firmware: stratix10-svc: extend svc to support new RSU features")
Fixes: 7ca5ce896524 ("firmware: add Intel Stratix10 service layer driver")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/firmware/stratix10-svc.c | 26 ++++++++++++++++++--------
 1 file changed, 18 insertions(+), 8 deletions(-)

diff --git a/drivers/firmware/stratix10-svc.c b/drivers/firmware/stratix10-svc.c
index de5870f76c5e..739004398877 100644
--- a/drivers/firmware/stratix10-svc.c
+++ b/drivers/firmware/stratix10-svc.c
@@ -1024,7 +1024,7 @@ static int stratix10_svc_drv_probe(struct platform_device *pdev)
 	ret = kfifo_alloc(&controller->svc_fifo, fifo_size, GFP_KERNEL);
 	if (ret) {
 		dev_err(dev, "failed to allocate FIFO\n");
-		return ret;
+		goto err_destroy_pool;
 	}
 	spin_lock_init(&controller->svc_fifo_lock);
 
@@ -1043,24 +1043,34 @@ static int stratix10_svc_drv_probe(struct platform_device *pdev)
 
 	/* add svc client device(s) */
 	svc = devm_kzalloc(dev, sizeof(*svc), GFP_KERNEL);
-	if (!svc)
-		return -ENOMEM;
+	if (!svc) {
+		ret = -ENOMEM;
+		goto err_free_kfifo;
+	}
 
 	svc->stratix10_svc_rsu = platform_device_alloc(STRATIX10_RSU, 0);
 	if (!svc->stratix10_svc_rsu) {
 		dev_err(dev, "failed to allocate %s device\n", STRATIX10_RSU);
-		return -ENOMEM;
+		ret = -ENOMEM;
+		goto err_free_kfifo;
 	}
 
 	ret = platform_device_add(svc->stratix10_svc_rsu);
-	if (ret) {
-		platform_device_put(svc->stratix10_svc_rsu);
-		return ret;
-	}
+	if (ret)
+		goto put_platform;
+
 	dev_set_drvdata(dev, svc);
 
 	pr_info("Intel Service Layer Driver Initialized\n");
 
+	return 0;
+
+put_platform:
+	platform_device_put(svc->stratix10_svc_rsu);
+err_free_kfifo:
+	kfifo_free(&controller->svc_fifo);
+err_destroy_pool:
+	gen_pool_destroy(genpool);
 	return ret;
 }
 
-- 
2.25.1
