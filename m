From: Roberto Rodriguez Alkala <rralcala@gmail.com>
Date: Sat, 07 Aug 2010 23:52:29 +0000
Subject: [PATCH] stating: otus: fix compile warning and some style issues
Message-Id: <1281225149.10826.5.camel@lenovo>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@suse.de>, Joe Perches <joe@perches.com>, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

In today linux-next I got a compile warning in staging/otus driver. 
This patch solves the issue and also improves the coding style.

Signed-off-by: Roberto Rodriguez Alcala <rralcala@gmail.com>
---
 drivers/staging/otus/80211core/ratectrl.c |   26 +++++++++-----------------
 1 files changed, 9 insertions(+), 17 deletions(-)

diff --git a/drivers/staging/otus/80211core/ratectrl.c b/drivers/staging/otus/80211core/ratectrl.c
index a1abe2f..283b2b5 100644
--- a/drivers/staging/otus/80211core/ratectrl.c
+++ b/drivers/staging/otus/80211core/ratectrl.c
@@ -422,23 +422,15 @@ u8_t zfRateCtrlRateDiff(struct zsRcCell* rcCell, u8_t retryRate)
     u16_t i;
 
     /* Find retryRate in operationRateSet[] */
-    for (i=0; i<rcCell->operationRateCount; i++)
-    {
-        if (retryRate = rcCell->operationRateSet[i])
-        {
-            if (i < rcCell->currentRateIndex)
-            {
-                return ((rcCell->currentRateIndex - i)+1)>>1;
-            }
-            else if (i = rcCell->currentRateIndex = 0)
-            {
-                return 1;
-            }
-            else
-            {
-                return 0;
-            }
-        }
+    for (i = 0; i < rcCell->operationRateCount; i++) {
+	if (retryRate = rcCell->operationRateSet[i]) {
+		if (i < rcCell->currentRateIndex)
+			return ((rcCell->currentRateIndex - i)+1)>>1;
+		else if (i = rcCell->currentRateIndex && i = 0)
+			return 1;
+		else
+			return 0;
+	}
     }
     /* TODO : retry rate not in operation rate set */
     zm_msg1_tx(ZM_LV_0, "Not in operation rate set:", retryRate);
-- 
1.7.0.4



