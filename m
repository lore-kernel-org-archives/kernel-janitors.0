From: Colin King <colin.king@canonical.com>
Date: Tue, 15 Dec 2020 13:00:16 +0000
Subject: [PATCH] mailbox: fix spelling mistake in Kconfig "Intergrated" -> "Integrated"
Message-Id: <20201215130016.200851-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jassi Brar <jassisinghbrar@gmail.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake in the Kconfig, fix it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/mailbox/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mailbox/Kconfig b/drivers/mailbox/Kconfig
index f4abe3529acd..68de2c6af727 100644
--- a/drivers/mailbox/Kconfig
+++ b/drivers/mailbox/Kconfig
@@ -78,7 +78,7 @@ config OMAP_MBOX_KFIFO_SIZE
 	  module parameter).
 
 config ROCKCHIP_MBOX
-	bool "Rockchip Soc Intergrated Mailbox Support"
+	bool "Rockchip Soc Integrated Mailbox Support"
 	depends on ARCH_ROCKCHIP || COMPILE_TEST
 	help
 	  This driver provides support for inter-processor communication
-- 
2.29.2
