From: Colin King <colin.king@canonical.com>
Date: Mon, 17 Aug 2020 22:37:13 +0000
Subject: [PATCH] mailbox: remove duplicate "the the" phrase in Kconfig text
Message-Id: <20200817223713.5659-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jassi Brar <jassisinghbrar@gmail.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The Kconfig help text contains the phrase "the the" in the help
text. Fix this and reformat a couple of lines.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/mailbox/Kconfig | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/mailbox/Kconfig b/drivers/mailbox/Kconfig
index 05b1009e2820..581ad9154a4a 100644
--- a/drivers/mailbox/Kconfig
+++ b/drivers/mailbox/Kconfig
@@ -47,9 +47,9 @@ config ARMADA_37XX_RWTM_MBOX
 	depends on ARCH_MVEBU || COMPILE_TEST
 	depends on OF
 	help
-	  Mailbox implementation for communication with the the firmware
-	  running on the Cortex-M3 rWTM secure processor of the Armada 37xx
-	  SOC. Say Y here if you are building for such a device (for example
+	  Mailbox implementation for communication with the firmware running
+	  on the Cortex-M3 rWTM secure processor of the Armada 37xx SOC.
+	  Say Y here if you are building for such a device (for example
 	  the Turris Mox router).
 
 config OMAP2PLUS_MBOX
-- 
2.27.0
