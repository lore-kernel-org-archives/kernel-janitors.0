From: Kulikov Vasiliy <segooon@gmail.com>
Date: Thu, 01 Jul 2010 11:22:51 +0000
Subject: [PATCH 09/16] staging/otus: use ARRAY_SIZE
Message-Id: <1277983372-29356-1-git-send-email-segooon@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kernel Janitors <kernel-janitors@vger.kernel.org>
Cc: Greg Kroah-Hartman <gregkh@suse.de>, Andrew Morton <akpm@linux-foundation.org>, Dan Carpenter <error27@gmail.com>, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org

Change sizeof(x) / sizeof(*x) to ARRAY_SIZE(x).

Signed-off-by: Kulikov Vasiliy <segooon@gmail.com>
---
 drivers/staging/otus/hal/hpani.c |   37 ++++++++++++++++---------------------
 1 files changed, 16 insertions(+), 21 deletions(-)

diff --git a/drivers/staging/otus/hal/hpani.c b/drivers/staging/otus/hal/hpani.c
index f53e483..6940ddc 100644
--- a/drivers/staging/otus/hal/hpani.c
+++ b/drivers/staging/otus/hal/hpani.c
@@ -72,7 +72,6 @@ s32_t BEACON_RSSI(zdev_t *dev)
 
 void zfHpAniAttach(zdev_t *dev)
 {
-#define N(a)     (sizeof(a) / sizeof(a[0]))
     u32_t i;
     struct zsHpPriv *HpPriv;
 
@@ -125,7 +124,6 @@ void zfHpAniAttach(zdev_t *dev)
     HpPriv->stats.ast_nodestats.ns_avgbrssi = ZM_RSSI_DUMMY_MARKER;
     HpPriv->stats.ast_nodestats.ns_avgrssi = ZM_RSSI_DUMMY_MARKER;
     HpPriv->stats.ast_nodestats.ns_avgtxrssi = ZM_RSSI_DUMMY_MARKER;
-#undef N
 }
 
 /*
@@ -133,7 +131,6 @@ void zfHpAniAttach(zdev_t *dev)
  */
 u8_t zfHpAniControl(zdev_t *dev, ZM_HAL_ANI_CMD cmd, int param)
 {
-#define N(a) (sizeof(a)/sizeof(a[0]))
     typedef s32_t TABLE[];
     struct zsHpPriv *HpPriv;
     struct zsAniState *aniState;
@@ -148,11 +145,12 @@ u8_t zfHpAniControl(zdev_t *dev, ZM_HAL_ANI_CMD cmd, int param)
     {
         u32_t level = param;
 
-        if (level >= N(HpPriv->totalSizeDesired)) {
-          zm_debug_msg1("level out of range, desired level : ", level);
-          zm_debug_msg1("max level : ", N(HpPriv->totalSizeDesired));
-          return FALSE;
-        }
+	if (level >= ARRAY_SIZE(HpPriv->totalSizeDesired)) {
+		zm_debug_msg1("level out of range, desired level : ", level);
+		zm_debug_msg1("max level : ",
+			ARRAY_SIZE(HpPriv->totalSizeDesired));
+		return FALSE;
+	}
 
         zfDelayWriteInternalReg(dev, AR_PHY_DESIRED_SZ,
                 (HpPriv->regPHYDesiredSZ & ~AR_PHY_DESIRED_SZ_TOT_DES)
@@ -260,12 +258,11 @@ u8_t zfHpAniControl(zdev_t *dev, ZM_HAL_ANI_CMD cmd, int param)
         const TABLE firstep = { 0, 4, 8 };
         u32_t level = param;
 
-        if (level >= N(firstep))
-        {
-            zm_debug_msg1("level out of range, desired level : ", level);
-            zm_debug_msg1("max level : ", N(firstep));
-            return FALSE;
-        }
+	if (level >= ARRAY_SIZE(firstep)) {
+		zm_debug_msg1("level out of range, desired level : ", level);
+		zm_debug_msg1("max level : ", ARRAY_SIZE(firstep));
+		return FALSE;
+	}
         zfDelayWriteInternalReg(dev, AR_PHY_FIND_SIG,
                 (HpPriv->regPHYFindSig & ~AR_PHY_FIND_SIG_FIRSTEP)
                 | ((firstep[level] << AR_PHY_FIND_SIG_FIRSTEP_S)
@@ -283,12 +280,11 @@ u8_t zfHpAniControl(zdev_t *dev, ZM_HAL_ANI_CMD cmd, int param)
         const TABLE cycpwrThr1 = { 2, 4, 6, 8, 10, 12, 14, 16 };
         u32_t level = param;
 
-        if (level >= N(cycpwrThr1))
-        {
-            zm_debug_msg1("level out of range, desired level : ", level);
-            zm_debug_msg1("max level : ", N(cycpwrThr1));
-            return FALSE;
-        }
+	if (level >= ARRAY_SIZE(cycpwrThr1)) {
+		zm_debug_msg1("level out of range, desired level : ", level);
+		zm_debug_msg1("max level : ", ARRAY_SIZE(cycpwrThr1));
+		return FALSE;
+	}
         zfDelayWriteInternalReg(dev, AR_PHY_TIMING5,
                 (HpPriv->regPHYTiming5 & ~AR_PHY_TIMING5_CYCPWR_THR1)
                 | ((cycpwrThr1[level] << AR_PHY_TIMING5_CYCPWR_THR1_S)
@@ -335,7 +331,6 @@ u8_t zfHpAniControl(zdev_t *dev, ZM_HAL_ANI_CMD cmd, int param)
         return FALSE;
     }
     return TRUE;
-#undef  N
 }
 
 void zfHpAniRestart(zdev_t* dev)
-- 
1.7.0.4

