From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 24 May 2017 17:01:18 +0000
Subject: [PATCH] MIPS: ralink: Delete an error message for a failed memory allocation in rt_timer_probe()
Message-Id: <0e1ec180-eb78-144f-03fa-2843efe57670@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-mips@linux-mips.org, John Crispin <john@phrozen.org>, =?UTF-8?Q?Ralf_B=c3=a4chle?= <ralf@linux-mips.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 24 May 2017 18:56:35 +0200

Omit an extra message for a memory allocation failure in this function.

This issue was detected by using the Coccinelle software.

Link: http://events.linuxfoundation.org/sites/events/files/slides/LCJ16-Refactor_Strings-WSang_0.pdf
Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 arch/mips/ralink/timer.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/arch/mips/ralink/timer.c b/arch/mips/ralink/timer.c
index d4469b20d176..efccb444d6bc 100644
--- a/arch/mips/ralink/timer.c
+++ b/arch/mips/ralink/timer.c
@@ -103,10 +103,8 @@ static int rt_timer_probe(struct platform_device *pdev)
 	struct clk *clk;
 
 	rt = devm_kzalloc(&pdev->dev, sizeof(*rt), GFP_KERNEL);
-	if (!rt) {
-		dev_err(&pdev->dev, "failed to allocate memory\n");
+	if (!rt)
 		return -ENOMEM;
-	}
 
 	rt->irq = platform_get_irq(pdev, 0);
 	if (!rt->irq) {
-- 
2.13.0

