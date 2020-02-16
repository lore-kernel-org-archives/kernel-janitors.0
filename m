From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Sun, 16 Feb 2020 11:20:31 +0000
Subject: [PATCH] Bluetooth: Fix a typo in Kconfig
Message-Id: <20200216112031.19876-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: marcel@holtmann.org, johan.hedberg@gmail.com
Cc: linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

'internface' has an extra 'n'.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/bluetooth/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/bluetooth/Kconfig b/drivers/bluetooth/Kconfig
index f7aa2dc1ff85..ca0356dbbb08 100644
--- a/drivers/bluetooth/Kconfig
+++ b/drivers/bluetooth/Kconfig
@@ -216,7 +216,7 @@ config BT_HCIUART_RTL
 	select BT_RTL
 	help
 	  The Realtek protocol support enables Bluetooth HCI over 3-Wire
-	  serial port internface for Realtek Bluetooth controllers.
+	  serial port interface for Realtek Bluetooth controllers.
 
 	  Say Y here to compile support for Realtek protocol.
 
-- 
2.20.1
