From: Julia Lawall <julia@diku.dk>
Date: Thu, 27 Jan 2011 15:49:06 +0000
Subject: [PATCH 1/2] arch/arm/mach-omap2/dma.c: Convert IS_ERR result to PTR_ERR
Message-Id: <1296143347-17508-1-git-send-email-julia@diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-arm-kernel@lists.infradead.org

This code elsewhere returns a negative constant to an indicate an error,
while IS_ERR returns the result of a >= operation.

The semantic patch that fixes this problem is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@@
expression x;
@@

 if (...) { ...
- return IS_ERR(x);
+ return PTR_ERR(x);
}
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 arch/arm/mach-omap2/dma.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff -u -p a/arch/arm/mach-omap2/dma.c b/arch/arm/mach-omap2/dma.c
--- a/arch/arm/mach-omap2/dma.c
+++ b/arch/arm/mach-omap2/dma.c
@@ -264,7 +264,7 @@ static int __init omap2_system_dma_init_
 	if (IS_ERR(od)) {
 		pr_err("%s: Cant build omap_device for %s:%s.\n",
 			__func__, name, oh->name);
-		return IS_ERR(od);
+		return PTR_ERR(od);
 	}
 
 	mem = platform_get_resource(&od->pdev, IORESOURCE_MEM, 0);

