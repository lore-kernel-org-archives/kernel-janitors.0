From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Mon, 27 Apr 2020 12:29:22 +0000
Subject: [PATCH] mfd: wcd934x: Drop kfree for memory allocated with devm_kzalloc
Message-Id: <20200427122922.56643-1-weiyongjun1@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200427110805.154447-1-weiyongjun1@huawei.com>
In-Reply-To: <20200427110805.154447-1-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lee Jones <lee.jones@linaro.org>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: Wei Yongjun <weiyongjun1@huawei.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

It's not necessary to free memory allocated with devm_kzalloc
and using kfree leads to a double free.

Fixes: 6ac7e4d7ad70 ("mfd: wcd934x: Add support to wcd9340/wcd9341 codec")
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/mfd/wcd934x.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/mfd/wcd934x.c b/drivers/mfd/wcd934x.c
index 90341f3c6810..da910302d51a 100644
--- a/drivers/mfd/wcd934x.c
+++ b/drivers/mfd/wcd934x.c
@@ -280,7 +280,6 @@ static void wcd934x_slim_remove(struct slim_device *sdev)
 
 	regulator_bulk_disable(WCD934X_MAX_SUPPLY, ddata->supplies);
 	mfd_remove_devices(&sdev->dev);
-	kfree(ddata);
 }
 
 static const struct slim_device_id wcd934x_slim_id[] = {
