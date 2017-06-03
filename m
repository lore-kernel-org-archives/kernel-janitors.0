From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 03 Jun 2017 20:10:30 +0000
Subject: [PATCH 3/3] ARM: pxa: Delete an error message for a failed memory allocation in pxa3xx_u2d_probe()
Message-Id: <519a96e2-675c-5d46-f7d1-fc3146384206@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <f50bf224-7fdc-f9ba-b73b-0b3c11df50dc@users.sourceforge.net>
In-Reply-To: <f50bf224-7fdc-f9ba-b73b-0b3c11df50dc@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-arm-kernel@lists.infradead.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 3 Jun 2017 21:46:26 +0200

Omit an extra message for a memory allocation failure in this function.

This issue was detected by using the Coccinelle software.

Link: http://events.linuxfoundation.org/sites/events/files/slides/LCJ16-Refactor_Strings-WSang_0.pdf
Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 arch/arm/mach-pxa/pxa3xx-ulpi.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/arch/arm/mach-pxa/pxa3xx-ulpi.c b/arch/arm/mach-pxa/pxa3xx-ulpi.c
index 13f9909ac8bf..60cb59a7ebd1 100644
--- a/arch/arm/mach-pxa/pxa3xx-ulpi.c
+++ b/arch/arm/mach-pxa/pxa3xx-ulpi.c
@@ -290,7 +290,5 @@ static int pxa3xx_u2d_probe(struct platform_device *pdev)
-	if (!u2d) {
-		dev_err(&pdev->dev, "failed to allocate memory\n");
+	if (!u2d)
 		return -ENOMEM;
-	}
 
 	u2d->clk = clk_get(&pdev->dev, NULL);
 	if (IS_ERR(u2d->clk)) {
-- 
2.13.0

