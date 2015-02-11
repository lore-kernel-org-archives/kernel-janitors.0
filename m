From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 11 Feb 2015 10:26:21 +0000
Subject: [patch] watchdog: mtk_wdt: signedness bug in mtk_wdt_start()
Message-Id: <20150211102621.GC18515@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wim Van Sebroeck <wim@iguana.be>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, linux-watchdog@vger.kernel.org, kernel-janitors@vger.kernel.org

"ret" should be signed for the error handling to work correctly.  This
doesn't matter much in real life since mtk_wdt_set_timeout() always
succeeds.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/watchdog/mtk_wdt.c b/drivers/watchdog/mtk_wdt.c
index a87f6df..938b987 100644
--- a/drivers/watchdog/mtk_wdt.c
+++ b/drivers/watchdog/mtk_wdt.c
@@ -133,7 +133,7 @@ static int mtk_wdt_start(struct watchdog_device *wdt_dev)
 	u32 reg;
 	struct mtk_wdt_dev *mtk_wdt = watchdog_get_drvdata(wdt_dev);
 	void __iomem *wdt_base = mtk_wdt->wdt_base;
-	u32 ret;
+	int ret;
 
 	ret = mtk_wdt_set_timeout(wdt_dev, wdt_dev->timeout);
 	if (ret < 0)
