From: YueHaibing <yuehaibing@huawei.com>
Date: Thu, 11 Apr 2019 02:47:08 +0000
Subject: [PATCH -next] bus: ti-sysc: Use PTR_ERR_OR_ZERO in sysc_init_resets()
Message-Id: <20190411024708.123605-1-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Faiz Abbas <faiz_abbas@ti.com>, Tony Lindgren <tony@atomide.com>, Rob Herring <robh@kernel.org>
Cc: YueHaibing <yuehaibing@huawei.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Use PTR_ERR_OR_ZERO rather than if(IS_ERR(...)) + PTR_ERR

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/bus/ti-sysc.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/bus/ti-sysc.c b/drivers/bus/ti-sysc.c
index b696f26a3894..2b93be2882f3 100644
--- a/drivers/bus/ti-sysc.c
+++ b/drivers/bus/ti-sysc.c
@@ -432,10 +432,7 @@ static int sysc_init_resets(struct sysc *ddata)
 {
 	ddata->rsts  		devm_reset_control_array_get_optional_exclusive(ddata->dev);
-	if (IS_ERR(ddata->rsts))
-		return PTR_ERR(ddata->rsts);
-
-	return 0;
+	return PTR_ERR_OR_ZERO(ddata->rsts);
 }
 
 /**
