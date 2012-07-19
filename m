From: Christian Riesch <christian.riesch@omicron.at>
Date: Thu, 19 Jul 2012 12:02:19 +0000
Subject: [PATCH net-next] asix: AX88172A driver depends on phylib
Message-Id: <1342699339-13871-1-git-send-email-christian.riesch@omicron.at>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netdev@vger.kernel.org
Cc: Fengguang Wu <fengguang.wu@intel.com>, Christian Riesch <christian.riesch@omicron.at>, kernel-janitors@vger.kernel.org

Since commit 16626b0cc3d5afe250850f96759b241f8a403b52 the asix
driver depends on the phylib. Select phylib when the asix driver is
selected.

Reported-by: Fengguang Wu <fengguang.wu@intel.com>
Cc: kernel-janitors@vger.kernel.org
Signed-off-by: Christian Riesch <christian.riesch@omicron.at>
---
 drivers/net/usb/Kconfig |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/drivers/net/usb/Kconfig b/drivers/net/usb/Kconfig
index 833e32f..c1ae769 100644
--- a/drivers/net/usb/Kconfig
+++ b/drivers/net/usb/Kconfig
@@ -134,6 +134,7 @@ config USB_NET_AX8817X
 	tristate "ASIX AX88xxx Based USB 2.0 Ethernet Adapters"
 	depends on USB_USBNET
 	select CRC32
+	select PHYLIB
 	default y
 	help
 	  This option adds support for ASIX AX88xxx based USB 2.0
-- 
1.7.0.4

