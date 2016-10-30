From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Sun, 30 Oct 2016 08:25:46 +0000
Subject: [PATCH] MIPS: ath79: Fix error handling
Message-Id: <20161030082546.15019-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: ralf@linux-mips.org, antonynpavlov@gmail.com, albeu@free.fr, hackpascal@gmail.com, amitoj1606@gmail.com
Cc: linux-mips@linux-mips.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

'clk_register_fixed_rate()' returns an error pointer in case of error, not
NULL. So test it with IS_ERR.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 arch/mips/ath79/clock.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/ath79/clock.c b/arch/mips/ath79/clock.c
index cc3a1e33a600..c1102cffe37d 100644
--- a/arch/mips/ath79/clock.c
+++ b/arch/mips/ath79/clock.c
@@ -45,7 +45,7 @@ static struct clk *__init ath79_add_sys_clkdev(
 	int err;
 
 	clk = clk_register_fixed_rate(NULL, id, NULL, 0, rate);
-	if (!clk)
+	if (IS_ERR(clk))
 		panic("failed to allocate %s clock structure", id);
 
 	err = clk_register_clkdev(clk, id, NULL);
-- 
2.9.3

