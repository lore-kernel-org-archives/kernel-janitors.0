From: Colin King <colin.king@canonical.com>
Date: Mon, 10 Aug 2020 08:27:39 +0000
Subject: [PATCH] drivers: thermal: Kconfig: fix spelling mistake "acces" -> "access"
Message-Id: <20200810082739.48007-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Zhang Rui <rui.zhang@intel.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, Amit Kucheria <amitk@kernel.org>, linux-pm@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake in the Kconfig text, fix it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
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
2.27.0
