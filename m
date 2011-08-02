From: Julia Lawall <julia@diku.dk>
Date: Tue, 02 Aug 2011 10:34:56 +0000
Subject: [PATCH 3/11] arch/arm/mach-s3c64xx/dma.c: trivial: use BUG_ON
Message-Id: <1312281304-11847-4-git-send-email-julia@diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1312281304-11847-1-git-send-email-julia@diku.dk>
In-Reply-To: <1312281304-11847-1-git-send-email-julia@diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-arm-kernel@lists.infradead.org

From: Julia Lawall <julia@diku.dk>

Use BUG_ON(x) rather than if(x) BUG();

The semantic patch that fixes this problem is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@@ identifier x; @@
-if (x) BUG();
+BUG_ON(x);

@@ identifier x; @@
-if (!x) BUG();
+BUG_ON(!x);
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 arch/arm/mach-s3c64xx/dma.c |    3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff -u -p a/arch/arm/mach-s3c64xx/dma.c b/arch/arm/mach-s3c64xx/dma.c
--- a/arch/arm/mach-s3c64xx/dma.c
+++ b/arch/arm/mach-s3c64xx/dma.c
@@ -603,8 +603,7 @@ static irqreturn_t s3c64xx_dma_irq(int i
 				&& buff->next != chan->next)
 			buff = buff->next;
 
-		if (!buff)
-			BUG();
+		BUG_ON(!buff);
 
 		if (buff = chan->next)
 			buff = chan->end;

