From: Mao Wenan <maowenan@huawei.com>
Date: Wed, 04 Dec 2019 02:02:09 +0000
Subject: [PATCH -next] rtc: mt6397: drop free_irq of devm_xx allocated irq
Message-Id: <20191204020209.10363-1-maowenan@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191113021720.9527-1-weiyongjun1@huawei.com>
In-Reply-To: <20191113021720.9527-1-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: eddie.huang@mediatek.com, sean.wang@mediatek.com, a.zummo@towertech.it, alexandre.belloni@bootlin.com, matthias.bgg@gmail.com
Cc: linux-rtc@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Mao Wenan <maowenan@huawei.com>, Hulk Robot <hulkci@huawei.com>, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org

rtc->irq is requested by devm_request_threaded_irq,
and request_threaded_irq. IRQs requested with this
function will be automatically freed on driver detach.

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Mao Wenan <maowenan@huawei.com>
---
 drivers/rtc/rtc-mt6397.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/rtc/rtc-mt6397.c b/drivers/rtc/rtc-mt6397.c
index 5249fc99fd5f..d6a10111137a 100644
--- a/drivers/rtc/rtc-mt6397.c
+++ b/drivers/rtc/rtc-mt6397.c
@@ -293,7 +293,6 @@ static int mtk_rtc_probe(struct platform_device *pdev)
 	return 0;
 
 out_free_irq:
-	free_irq(rtc->irq, rtc);
 	return ret;
 }
 
-- 
2.20.1
