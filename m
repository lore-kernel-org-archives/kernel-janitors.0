From: Julia Lawall <julia@diku.dk>
Date: Sat, 13 Dec 2008 15:37:59 +0000
Subject: [PATCH] arch/arm/common/sa1111.c: Correct error handling code
Message-Id: <Pine.LNX.4.64.0812131637330.20442@pc-004.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: rmk@arm.linux.org.uk, linux-arm-kernel@lists.arm.linux.org.uk, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

If it is reasonable to apply PTR_ERR to the result of calling clk_get, then
that result should first be tested with IS_ERR, not with !.

The semantic patch that makes this change is as follows:
(http://www.emn.fr/x-info/coccinelle/)

// <smpl>
@@
expression E,E1;
@@

if (
-   E = NULL
+   IS_ERR(E)
   ) { <+... when != E = E1
        PTR_ERR(E)
       ...+> }
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 arch/arm/common/sa1111.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff -u -p a/arch/arm/common/sa1111.c b/arch/arm/common/sa1111.c
--- a/arch/arm/common/sa1111.c
+++ b/arch/arm/common/sa1111.c
@@ -630,7 +630,7 @@ __sa1111_probe(struct device *me, struct
 		return -ENOMEM;
 
 	sachip->clk = clk_get(me, "SA1111_CLK");
-	if (!sachip->clk) {
+	if (IS_ERR(sachip->clk)) {
 		ret = PTR_ERR(sachip->clk);
 		goto err_free;
 	}
