From: Vasiliy Kulikov <segoon@openwall.com>
Date: Fri, 26 Nov 2010 17:06:12 +0000
Subject: [PATCH] avr32: boards: setup: use IS_ERR() instead of NULL check
Message-Id: <1290791179-21298-1-git-send-email-segoon@openwall.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org
Cc: Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com>, Haavard Skinnemoen <haavard.skinnemoen@atmel.com>, linux-kernel@vger.kernel.org

clk_get() returns ERR_PTR() on error, not NULL.

Signed-off-by: Vasiliy Kulikov <segoon@openwall.com>
---
 Cannot compile this driver, so it is not tested at all.

 arch/avr32/boards/atngw100/setup.c      |    2 +-
 arch/avr32/boards/atstk1000/atstk1002.c |    2 +-
 arch/avr32/boards/favr-32/setup.c       |    2 +-
 arch/avr32/boards/hammerhead/setup.c    |    2 +-
 arch/avr32/boards/merisc/setup.c        |    2 +-
 arch/avr32/boards/mimc200/setup.c       |    2 +-
 6 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/avr32/boards/atngw100/setup.c b/arch/avr32/boards/atngw100/setup.c
index 8c6a244..659d119 100644
--- a/arch/avr32/boards/atngw100/setup.c
+++ b/arch/avr32/boards/atngw100/setup.c
@@ -188,7 +188,7 @@ static void __init set_hw_addr(struct platform_device *pdev)
 	 */
 	regs = (void __iomem __force *)res->start;
 	pclk = clk_get(&pdev->dev, "pclk");
-	if (!pclk)
+	if (IS_ERR(pclk))
 		return;
 
 	clk_enable(pclk);
diff --git a/arch/avr32/boards/atstk1000/atstk1002.c b/arch/avr32/boards/atstk1000/atstk1002.c
index 2adc261..6ce30fb 100644
--- a/arch/avr32/boards/atstk1000/atstk1002.c
+++ b/arch/avr32/boards/atstk1000/atstk1002.c
@@ -203,7 +203,7 @@ static void __init set_hw_addr(struct platform_device *pdev)
 	 */
 	regs = (void __iomem __force *)res->start;
 	pclk = clk_get(&pdev->dev, "pclk");
-	if (!pclk)
+	if (IS_ERR(pclk))
 		return;
 
 	clk_enable(pclk);
diff --git a/arch/avr32/boards/favr-32/setup.c b/arch/avr32/boards/favr-32/setup.c
index 75f19f4..86fab77 100644
--- a/arch/avr32/boards/favr-32/setup.c
+++ b/arch/avr32/boards/favr-32/setup.c
@@ -206,7 +206,7 @@ static void __init set_hw_addr(struct platform_device *pdev)
 	 */
 	regs = (void __iomem __force *)res->start;
 	pclk = clk_get(&pdev->dev, "pclk");
-	if (!pclk)
+	if (IS_ERR(pclk))
 		return;
 
 	clk_enable(pclk);
diff --git a/arch/avr32/boards/hammerhead/setup.c b/arch/avr32/boards/hammerhead/setup.c
index dd00987..da14fbd 100644
--- a/arch/avr32/boards/hammerhead/setup.c
+++ b/arch/avr32/boards/hammerhead/setup.c
@@ -150,7 +150,7 @@ static void __init set_hw_addr(struct platform_device *pdev)
 	regs = (void __iomem __force *)res->start;
 	pclk = clk_get(&pdev->dev, "pclk");
 
-	if (!pclk)
+	if (IS_ERR(pclk))
 		return;
 
 	clk_enable(pclk);
diff --git a/arch/avr32/boards/merisc/setup.c b/arch/avr32/boards/merisc/setup.c
index 623b077..e61bc94 100644
--- a/arch/avr32/boards/merisc/setup.c
+++ b/arch/avr32/boards/merisc/setup.c
@@ -134,7 +134,7 @@ static void __init set_hw_addr(struct platform_device *pdev)
 
 	regs = (void __iomem __force *)res->start;
 	pclk = clk_get(&pdev->dev, "pclk");
-	if (!pclk)
+	if (IS_ERR(pclk))
 		return;
 
 	clk_enable(pclk);
diff --git a/arch/avr32/boards/mimc200/setup.c b/arch/avr32/boards/mimc200/setup.c
index 523d8e1..c4da5cb 100644
--- a/arch/avr32/boards/mimc200/setup.c
+++ b/arch/avr32/boards/mimc200/setup.c
@@ -162,7 +162,7 @@ static void __init set_hw_addr(struct platform_device *pdev)
 	 */
 	regs = (void __iomem __force *)res->start;
 	pclk = clk_get(&pdev->dev, "pclk");
-	if (!pclk)
+	if (IS_ERR(pclk))
 		return;
 
 	clk_enable(pclk);
-- 
1.7.0.4

