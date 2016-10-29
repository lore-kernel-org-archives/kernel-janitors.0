From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Sat, 29 Oct 2016 13:58:39 +0000
Subject: [PATCH] ARM: spear: Fix error handling
Message-Id: <20161029135839.6388-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-arm-kernel@lists.infradead.org

'clk_get_sys()' returns an error pointer in case of error, not NULL. So
test it with IS_ERR.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 arch/arm/mach-spear/time.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/mach-spear/time.c b/arch/arm/mach-spear/time.c
index 9ccffc1d0f28..4878ba90026d 100644
--- a/arch/arm/mach-spear/time.c
+++ b/arch/arm/mach-spear/time.c
@@ -233,7 +233,7 @@ void __init spear_setup_of_timer(void)
 	}
 
 	gpt_clk = clk_get_sys("gpt0", NULL);
-	if (!gpt_clk) {
+	if (IS_ERR(gpt_clk)) {
 		pr_err("%s:couldn't get clk for gpt\n", __func__);
 		goto err_iomap;
 	}
-- 
2.9.3

