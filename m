From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 23 Jun 2017 08:29:00 +0000
Subject: [PATCH] rtc: rtc-nuc900: fix loop timeout test
Message-Id: <20170623082900.GB7922@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wan ZongShun <mcuos.com@gmail.com>
Cc: Alessandro Zummo <a.zummo@towertech.it>, Alexandre Belloni <alexandre.belloni@free-electrons.com>, linux-rtc@vger.kernel.org, kernel-janitors@vger.kernel.org

We should change this post-op to a pre-op because we want the loop to
exit with "timeout" set to zero.

Fixes: 0a89b55364e0 ("nuc900/rtc: change the waiting for device ready implement")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/rtc/rtc-nuc900.c b/drivers/rtc/rtc-nuc900.c
index b1b6b3041bfb..4ed81117cf5f 100644
--- a/drivers/rtc/rtc-nuc900.c
+++ b/drivers/rtc/rtc-nuc900.c
@@ -93,7 +93,7 @@ static int *check_rtc_access_enable(struct nuc900_rtc *nuc900_rtc)
 	__raw_writel(AERPOWERON, nuc900_rtc->rtc_reg + REG_RTC_AER);
 
 	while (!(__raw_readl(nuc900_rtc->rtc_reg + REG_RTC_AER) & AERRWENB)
-								&& timeout--)
+								&& --timeout)
 		mdelay(1);
 
 	if (!timeout)
