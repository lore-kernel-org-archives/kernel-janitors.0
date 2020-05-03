From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Sun, 03 May 2020 19:11:04 +0000
Subject: [PATCH] thermal: stm32: fix spelling mistake "acces" -> "access"
Message-Id: <20200503191104.153711-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: rui.zhang@intel.com, daniel.lezcano@linaro.org, amit.kucheria@verdurent.com, edubezval@gmail.com, info@metux.net, tglx@linutronix.de, gregkh@linuxfoundation.org
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Fix a typo in Kconfig.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/thermal/st/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/thermal/st/Kconfig b/drivers/thermal/st/Kconfig
index 3c3b695cc3e9..58ece381956b 100644
--- a/drivers/thermal/st/Kconfig
+++ b/drivers/thermal/st/Kconfig
@@ -23,5 +23,5 @@ config STM32_THERMAL
 	help
 	  Support for thermal framework on STMicroelectronics STM32 series of
 	  SoCs. This thermal driver allows to access to general thermal framework
-	  functionalities and to acces to SoC sensor functionalities. This
+	  functionalities and to access to SoC sensor functionalities. This
 	  configuration is fully dependent of MACH_STM32MP157.
-- 
2.25.1
