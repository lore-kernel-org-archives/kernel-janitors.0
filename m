From: Peter Senna Tschudin <peter.senna@gmail.com>
Date: Tue, 15 Jul 2014 21:23:24 +0000
Subject: [PATCH V5 1/4] staging: vt6556: Cleanup coding style: #define
Message-Id: <1405459407-9311-1-git-send-email-peter.senna@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: forest@alittletooquiet.net, gregkh@linuxfoundation.org, tvboxspy@gmail.com, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Cc: Peter Senna Tschudin <peter.senna@gmail.com>

This patch cleanup coding style issues on #defines.

Tested by compilation only.

Signed-off-by: Peter Senna Tschudin <peter.senna@gmail.com>
---
Changes from V4:
 - Splitted [PATCH V4 1/6] in 4 smaller patches

 drivers/staging/vt6656/card.h     |  6 +++---
 drivers/staging/vt6656/device.h   | 10 +++++-----
 drivers/staging/vt6656/main_usb.c | 18 +++++++++---------
 3 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/drivers/staging/vt6656/card.h b/drivers/staging/vt6656/card.h
index 5b7cc5a..80fcd53 100644
--- a/drivers/staging/vt6656/card.h
+++ b/drivers/staging/vt6656/card.h
@@ -39,9 +39,9 @@ typedef enum _CARD_PHY_TYPE {
     PHY_TYPE_11A
 } CARD_PHY_TYPE, *PCARD_PHY_TYPE;
 
-#define CB_MAX_CHANNEL_24G  14
-#define CB_MAX_CHANNEL_5G       42 /* add channel9(5045MHz), 41=>42 */
-#define CB_MAX_CHANNEL      (CB_MAX_CHANNEL_24G+CB_MAX_CHANNEL_5G)
+#define CB_MAX_CHANNEL_24G	14
+#define CB_MAX_CHANNEL_5G	42 /* add channel9(5045MHz), 41=>42 */
+#define CB_MAX_CHANNEL		(CB_MAX_CHANNEL_24G + CB_MAX_CHANNEL_5G)
 
 struct vnt_private;
 
diff --git a/drivers/staging/vt6656/device.h b/drivers/staging/vt6656/device.h
index 436f109..b7b3131 100644
--- a/drivers/staging/vt6656/device.h
+++ b/drivers/staging/vt6656/device.h
@@ -441,11 +441,11 @@ struct vnt_private {
 	struct ieee80211_low_level_stats low_stats;
 };
 
-#define ADD_ONE_WITH_WRAP_AROUND(uVar, uModulo) {   \
-    if ((uVar) >= ((uModulo) - 1))                  \
-        (uVar) = 0;                                 \
-    else                                            \
-        (uVar)++;                                   \
+#define ADD_ONE_WITH_WRAP_AROUND(uVar, uModulo) {	\
+	if ((uVar) >= ((uModulo) - 1))			\
+		(uVar) = 0;				\
+	else						\
+		(uVar)++;				\
 }
 
 #define fMP_DISCONNECTED                    0x00000002
diff --git a/drivers/staging/vt6656/main_usb.c b/drivers/staging/vt6656/main_usb.c
index dffd0c7..95a87ef 100644
--- a/drivers/staging/vt6656/main_usb.c
+++ b/drivers/staging/vt6656/main_usb.c
@@ -75,18 +75,18 @@ MODULE_AUTHOR(DRIVER_AUTHOR);
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION(DEVICE_FULL_DRV_NAM);
 
-#define DEVICE_PARAM(N,D) \
-        static int N[MAX_UINTS]=OPTION_DEFAULT;\
-        module_param_array(N, int, NULL, 0);\
-        MODULE_PARM_DESC(N, D);
+#define DEVICE_PARAM(N, D)				\
+	static int N[MAX_UINTS] = OPTION_DEFAULT;	\
+	module_param_array(N, int, NULL, 0);		\
+	MODULE_PARM_DESC(N, D)
 
-#define RX_DESC_DEF0     64
-DEVICE_PARAM(RxDescriptors0,"Number of receive usb desc buffer");
+#define RX_DESC_DEF0 64
+DEVICE_PARAM(RxDescriptors0, "Number of receive usb desc buffer");
 
-#define TX_DESC_DEF0     64
-DEVICE_PARAM(TxDescriptors0,"Number of transmit usb desc buffer");
+#define TX_DESC_DEF0 64
+DEVICE_PARAM(TxDescriptors0, "Number of transmit usb desc buffer");
 
-#define CHANNEL_DEF     6
+#define CHANNEL_DEF 6
 DEVICE_PARAM(Channel, "Channel number");
 
 /* PreambleType[] is the preamble length used for transmit.
-- 
1.9.3

