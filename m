From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Sun, 03 May 2020 19:03:27 +0000
Subject: [PATCH] clk: clk-xgene: Fix a typo in Kconfig
Message-Id: <20200503190327.153249-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mturquette@baylibre.com, sboyd@kernel.org
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

s/Sypport/Support

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/clk/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
index bcb257baed06..99ddc1478493 100644
--- a/drivers/clk/Kconfig
+++ b/drivers/clk/Kconfig
@@ -252,7 +252,7 @@ config COMMON_CLK_XGENE
 	default ARCH_XGENE
 	depends on ARM64 || COMPILE_TEST
 	---help---
-	  Sypport for the APM X-Gene SoC reference, PLL, and device clocks.
+	  Support for the APM X-Gene SoC reference, PLL, and device clocks.
 
 config COMMON_CLK_LOCHNAGAR
 	tristate "Cirrus Logic Lochnagar clock driver"
-- 
2.25.1
