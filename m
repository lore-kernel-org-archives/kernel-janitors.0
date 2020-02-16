From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Sun, 16 Feb 2020 16:20:05 +0000
Subject: [PATCH] mailbox: Fix a typo in Kconfig
Message-Id: <20200216162005.22015-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: jassisinghbrar@gmail.com
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

There is an extra 'r' in 'Intergrated'

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/mailbox/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mailbox/Kconfig b/drivers/mailbox/Kconfig
index ab4eb750bbdd..af42fd0c9e0a 100644
--- a/drivers/mailbox/Kconfig
+++ b/drivers/mailbox/Kconfig
@@ -71,7 +71,7 @@ config OMAP_MBOX_KFIFO_SIZE
 	  module parameter).
 
 config ROCKCHIP_MBOX
-	bool "Rockchip Soc Intergrated Mailbox Support"
+	bool "Rockchip Soc Integrated Mailbox Support"
 	depends on ARCH_ROCKCHIP || COMPILE_TEST
 	help
 	  This driver provides support for inter-processor communication
-- 
2.20.1
