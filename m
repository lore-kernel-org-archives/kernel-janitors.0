From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 03 Jun 2017 20:09:40 +0000
Subject: [PATCH 2/3] ARM: pxa: Improve a size determination in pxa3xx_u2d_probe()
Message-Id: <2e51f414-c0aa-a6c2-dbce-11ef128b1f12@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <f50bf224-7fdc-f9ba-b73b-0b3c11df50dc@users.sourceforge.net>
In-Reply-To: <f50bf224-7fdc-f9ba-b73b-0b3c11df50dc@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-arm-kernel@lists.infradead.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 3 Jun 2017 21:43:11 +0200

Replace the specification of a data structure by a pointer dereference
as the parameter for the operator "sizeof" to make the corresponding size
determination a bit safer according to the Linux coding style convention.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 arch/arm/mach-pxa/pxa3xx-ulpi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/mach-pxa/pxa3xx-ulpi.c b/arch/arm/mach-pxa/pxa3xx-ulpi.c
index eba595fac8ca..13f9909ac8bf 100644
--- a/arch/arm/mach-pxa/pxa3xx-ulpi.c
+++ b/arch/arm/mach-pxa/pxa3xx-ulpi.c
@@ -286,5 +286,5 @@ static int pxa3xx_u2d_probe(struct platform_device *pdev)
 	struct resource *r;
 	int err;
 
-	u2d = kzalloc(sizeof(struct pxa3xx_u2d_ulpi), GFP_KERNEL);
+	u2d = kzalloc(sizeof(*u2d), GFP_KERNEL);
 	if (!u2d) {
-- 
2.13.0

