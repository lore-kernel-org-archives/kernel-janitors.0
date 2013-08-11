From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sun, 11 Aug 2013 16:51:48 +0000
Subject: [PATCH 7/16] arch/arm/mach-pxa/colibri-pxa270-income.c: Avoid using ARRAY_AND_SIZE(e) as a function
Message-Id: <1376239917-15594-8-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1376239917-15594-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1376239917-15594-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-arm-kernel@lists.infradead.org

From: Julia Lawall <Julia.Lawall@lip6.fr>

Replace ARRAY_AND_SIZE(e) in function argument position to avoid hiding the
arity of the called function.

The semantic match that makes this change is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@@
expression e,f;
@@

f(...,
- ARRAY_AND_SIZE(e)
+ e,ARRAY_SIZE(e)
  ,...)
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
Not compiled.

 arch/arm/mach-pxa/colibri-pxa270-income.c |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm/mach-pxa/colibri-pxa270-income.c b/arch/arm/mach-pxa/colibri-pxa270-income.c
index 2d4a7b4..5dbf56f 100644
--- a/arch/arm/mach-pxa/colibri-pxa270-income.c
+++ b/arch/arm/mach-pxa/colibri-pxa270-income.c
@@ -136,7 +136,8 @@ static void __init income_i2c_init(void)
 {
 	pxa_set_i2c_info(NULL);
 	pxa27x_set_i2c_power_info(NULL);
-	i2c_register_board_info(0, ARRAY_AND_SIZE(income_i2c_devs));
+	i2c_register_board_info(0, income_i2c_devs,
+				ARRAY_SIZE(income_i2c_devs));
 }
 #else
 static inline void income_i2c_init(void) {}

