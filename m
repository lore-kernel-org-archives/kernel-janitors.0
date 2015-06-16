From: Chaehyun Lim <chaehyun.lim@gmail.com>
Date: Tue, 16 Jun 2015 01:06:10 +0000
Subject: [PATCH] staging: wilc1000: change enum and defines for printk
Message-Id: <1434416770-8323-1-git-send-email-chaehyun.lim@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Remove enum and change defines for printk using BIT macro.

Signed-off-by: Chaehyun Lim <chaehyun.lim@gmail.com>
---
 drivers/staging/wilc1000/linux_wlan_common.h | 57 +++++++++-------------------
 1 file changed, 17 insertions(+), 40 deletions(-)

diff --git a/drivers/staging/wilc1000/linux_wlan_common.h b/drivers/staging/wilc1000/linux_wlan_common.h
index 541f19c..e646a5c 100644
--- a/drivers/staging/wilc1000/linux_wlan_common.h
+++ b/drivers/staging/wilc1000/linux_wlan_common.h
@@ -1,46 +1,23 @@
 #ifndef LINUX_WLAN_COMMON_H
 #define LINUX_WLAN_COMMON_H
 
-enum debug_region {
-	Generic_debug = 0,
-	Hostapd_debug,
-	Hostinf_debug,
-	CFG80211_debug,
-	Coreconfig_debug,
-	Interrupt_debug,
-	TX_debug,
-	RX_debug,
-	Lock_debug,
-	Tcp_enhance,
-	/*Added by amr - BugID_4720*/
-	Spin_debug,
-
-	Init_debug,
-	Bus_debug,
-	Mem_debug,
-	Firmware_debug,
-	COMP = 0xFFFFFFFF,
-};
-
-#define GENERIC_DBG			(1 << Generic_debug)
-#define HOSTAPD_DBG		(1 << Hostapd_debug)
-#define HOSTINF_DBG			(1 << Hostinf_debug)
-#define CORECONFIG_DBG		(1 << Coreconfig_debug)
-#define CFG80211_DBG		(1 << CFG80211_debug)
-#define INT_DBG				(1 << Interrupt_debug)
-#define TX_DBG				(1 << TX_debug)
-#define RX_DBG				(1 << RX_debug)
-#define LOCK_DBG			(1 << Lock_debug)
-#define TCP_ENH				(1 << Tcp_enhance)
-
-
-/*Added by Amr - BugID_4720*/
-#define SPIN_DEBUG			(1 << Spin_debug)
-
-#define INIT_DBG				(1 << Init_debug)
-#define BUS_DBG				(1 << Bus_debug)
-#define MEM_DBG				(1 << Mem_debug)
-#define FIRM_DBG			(1 << Firmware_debug)
+#include <linux/bitops.h>
+
+#define GENERIC_DBG           BIT(0)
+#define HOSTAPD_DBG           BIT(1)
+#define HOSTINF_DBG           BIT(2)
+#define CFG80211_DBG          BIT(3)
+#define CORECONFIG_DBG        BIT(4)
+#define INT_DBG               BIT(5)
+#define TX_DBG                BIT(6)
+#define RX_DBG                BIT(7)
+#define LOCK_DBG              BIT(8)
+#define TCP_ENH               BIT(9)
+#define SPIN_DEBUG            BIT(10)
+#define INIT_DBG              BIT(11)
+#define BUS_DBG               BIT(12)
+#define MEM_DBG               BIT(13)
+#define FIRM_DBG              BIT(14)
 
 #if defined (WILC_DEBUGFS)
 extern int wilc_debugfs_init(void);
-- 
1.9.1

