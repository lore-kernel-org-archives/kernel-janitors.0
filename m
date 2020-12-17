From: Colin King <colin.king@canonical.com>
Date: Thu, 17 Dec 2020 17:17:05 +0000
Subject: [PATCH] timekeeping: Fix spelling mistake in Kconfig "fullfill" -> "fulfill"
Message-Id: <20201217171705.57586-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Geert Uytterhoeven <geert@linux-m68k.org>, Arnd Bergmann <arnd@arndb.de>, Linus Walleij <linus.walleij@linaro.org>, Thomas Gleixner <tglx@linutronix.de>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake in the Kconfig help text. Fix it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 kernel/time/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/time/Kconfig b/kernel/time/Kconfig
index 9a41848b6ebb..83e158d016ba 100644
--- a/kernel/time/Kconfig
+++ b/kernel/time/Kconfig
@@ -141,7 +141,7 @@ config CONTEXT_TRACKING_FORCE
 	  dynticks working.
 
 	  This option stands for testing when an arch implements the
-	  context tracking backend but doesn't yet fullfill all the
+	  context tracking backend but doesn't yet fulfill all the
 	  requirements to make the full dynticks feature working.
 	  Without the full dynticks, there is no way to test the support
 	  for context tracking and the subsystems that rely on it: RCU
-- 
2.29.2
