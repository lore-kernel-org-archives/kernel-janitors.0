From: Chaehyun Lim <chaehyun.lim@gmail.com>
Date: Wed, 17 Jun 2015 02:08:09 +0000
Subject: [PATCH] staging: wilc1000: align defines
Message-Id: <1434506889-24360-1-git-send-email-chaehyun.lim@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1434339348-6654-1-git-send-email-chaehyun.lim@gmail.com>
In-Reply-To: <1434339348-6654-1-git-send-email-chaehyun.lim@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Align some defines in linux_wlan_common.h

Signed-off-by: Chaehyun Lim <chaehyun.lim@gmail.com>
---
 drivers/staging/wilc1000/linux_wlan_common.h | 146 +++++++++++++++------------
 1 file changed, 79 insertions(+), 67 deletions(-)

diff --git a/drivers/staging/wilc1000/linux_wlan_common.h b/drivers/staging/wilc1000/linux_wlan_common.h
index 541f19c..830d96a 100644
--- a/drivers/staging/wilc1000/linux_wlan_common.h
+++ b/drivers/staging/wilc1000/linux_wlan_common.h
@@ -22,25 +22,21 @@ enum debug_region {
 	COMP = 0xFFFFFFFF,
 };
 
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
+#define GENERIC_DBG             (1 << Generic_debug)
+#define HOSTAPD_DBG             (1 << Hostapd_debug)
+#define HOSTINF_DBG             (1 << Hostinf_debug)
+#define CORECONFIG_DBG          (1 << Coreconfig_debug)
+#define CFG80211_DBG            (1 << CFG80211_debug)
+#define INT_DBG                 (1 << Interrupt_debug)
+#define TX_DBG                  (1 << TX_debug)
+#define RX_DBG                  (1 << RX_debug)
+#define LOCK_DBG                (1 << Lock_debug)
+#define TCP_ENH                 (1 << Tcp_enhance)
+#define SPIN_DEBUG              (1 << Spin_debug)
+#define INIT_DBG                (1 << Init_debug)
+#define BUS_DBG                 (1 << Bus_debug)
+#define MEM_DBG                 (1 << Mem_debug)
+#define FIRM_DBG                (1 << Firmware_debug)
 
 #if defined (WILC_DEBUGFS)
 extern int wilc_debugfs_init(void);
@@ -49,38 +45,45 @@ extern void wilc_debugfs_remove(void);
 extern atomic_t REGION;
 extern atomic_t DEBUG_LEVEL;
 
-#define DEBUG		(1 << 0)
-#define INFO		(1 << 1)
-#define WRN			(1 << 2)
-#define ERR			(1 << 3)
+#define DEBUG           (1 << 0)
+#define INFO            (1 << 1)
+#define WRN             (1 << 2)
+#define ERR             (1 << 3)
 
-#define PRINT_D(region, ...)	 do { \
-		if ((atomic_read(&DEBUG_LEVEL) & DEBUG) && ((atomic_read(&REGION)) & (region))) { \
+#define PRINT_D(region, ...)						\
+	do {								\
+		if ((atomic_read(&DEBUG_LEVEL) & DEBUG) &&		\
+		   ((atomic_read(&REGION)) & (region))) {		\
 			printk("DBG [%s: %d]", __FUNCTION__, __LINE__);	\
-			printk(__VA_ARGS__); \
-		} \
-} while (0)
-
-#define PRINT_INFO(region, ...) do { \
-		if ((atomic_read(&DEBUG_LEVEL) & INFO) && ((atomic_read(&REGION)) & (region))) { \
-			printk("INFO [%s]", __FUNCTION__); \
-			printk(__VA_ARGS__); \
-		} \
-} while (0)
-
-#define PRINT_WRN(region, ...) do { \
-		if ((atomic_read(&DEBUG_LEVEL) & WRN) && ((atomic_read(&REGION)) & (region))) {	\
+			printk(__VA_ARGS__);				\
+		}							\
+	} while (0)
+
+#define PRINT_INFO(region, ...)						\
+	do {								\
+		if ((atomic_read(&DEBUG_LEVEL) & INFO) &&		\
+		   ((atomic_read(&REGION)) & (region))) {		\
+			printk("INFO [%s]", __FUNCTION__);		\
+			printk(__VA_ARGS__);				\
+		}							\
+	} while (0)
+
+#define PRINT_WRN(region, ...)						\
+	do {								\
+		if ((atomic_read(&DEBUG_LEVEL) & WRN) &&		\
+		   ((atomic_read(&REGION)) & (region))) {		\
 			printk("WRN [%s: %d]", __FUNCTION__, __LINE__);	\
-			printk(__VA_ARGS__); \
-		} \
-} while (0)
+			printk(__VA_ARGS__);				\
+		}							\
+	} while (0)
 
-#define PRINT_ER(...)	do { \
-		if ((atomic_read(&DEBUG_LEVEL) & ERR)) { \
+#define PRINT_ER(...)							\
+	do {								\
+		if ((atomic_read(&DEBUG_LEVEL) & ERR)) {		\
 			printk("ERR [%s: %d]", __FUNCTION__, __LINE__);	\
-			printk(__VA_ARGS__); \
-		} \
-} while (0)
+			printk(__VA_ARGS__);				\
+		}							\
+	} while (0)
 
 #else
 
@@ -89,27 +92,36 @@ extern atomic_t DEBUG_LEVEL;
 #define DEBUG       1
 #define INFO        0
 #define WRN         0
-#define PRINT_D(region, ...)	 do { if (DEBUG = 1 && ((REGION)&(region))) { \
-											printk("DBG [%s: %d]", __FUNCTION__, __LINE__); \
-											printk(__VA_ARGS__); \
-										} \
-									} while (0)
-
-#define PRINT_INFO(region, ...) do { if (INFO = 1 && ((REGION)&(region))) { \
-											printk("INFO [%s]", __FUNCTION__); \
-											printk(__VA_ARGS__); \
-										} \
-								} while (0)
-
-#define PRINT_WRN(region, ...) do { if (WRN = 1 && ((REGION)&(region))) { \
-											printk("WRN [%s: %d]", __FUNCTION__, __LINE__); \
-											printk(__VA_ARGS__); \
-										} \
-								} while (0)
-
-#define PRINT_ER(...)	do { printk("ERR [%s: %d]", __FUNCTION__, __LINE__); \
-			     printk(__VA_ARGS__); \
-				 } while (0)
+
+#define PRINT_D(region, ...)						\
+	do {								\
+		if (DEBUG = 1 && ((REGION)&(region))) {		\
+			printk("DBG [%s: %d]", __FUNCTION__, __LINE__); \
+			printk(__VA_ARGS__);				\
+		}							\
+	} while (0)
+
+#define PRINT_INFO(region, ...)						\
+	do {								\
+		if (INFO = 1 && ((REGION)&(region))) {			\
+			printk("INFO [%s]", __FUNCTION__);		\
+			printk(__VA_ARGS__);				\
+		}							\
+	} while (0)
+
+#define PRINT_WRN(region, ...)						\
+	do {								\
+		if (WRN = 1 && ((REGION)&(region))) {			\
+			printk("WRN [%s: %d]", __FUNCTION__, __LINE__); \
+			printk(__VA_ARGS__);				\
+		}							\
+	} while (0)
+
+#define PRINT_ER(...)							\
+	do {								\
+		printk("ERR [%s: %d]", __FUNCTION__, __LINE__);		\
+		printk(__VA_ARGS__);					\
+	} while (0)
 #endif
 
 #define FN_IN   /* PRINT_D(">>> \n") */
-- 
1.9.1

