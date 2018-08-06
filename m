From: Colin King <colin.king@canonical.com>
Date: Mon, 06 Aug 2018 13:31:02 +0000
Subject: [PATCH] staging: rtl8188eu: remove unused array dB_Invert_Table
Message-Id: <20180806133102.28897-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Michael Straube <straube.linux@gmail.com>, Janani Sankara Babu <jananis37@gmail.com>, devel@driverdev.osuosl.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Array dB_Invert_Table is declared but not used, hence it is redundant
and can be removed.

Cleans up clang warning:
warning: ‘dB_Invert_Table’ defined but not used [-Wunused-const-variable=]

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/staging/rtl8188eu/hal/odm.c | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/drivers/staging/rtl8188eu/hal/odm.c b/drivers/staging/rtl8188eu/hal/odm.c
index 1f21728f5084..9d567838a43a 100644
--- a/drivers/staging/rtl8188eu/hal/odm.c
+++ b/drivers/staging/rtl8188eu/hal/odm.c
@@ -11,16 +11,6 @@
 #include "phy.h"
 
 u32 GlobalDebugLevel;
-static const u16 dB_Invert_Table[8][12] = {
-	{1, 1, 1, 2, 2, 2, 2, 3, 3, 3, 4, 4},
-	{4, 5, 6, 6, 7, 8, 9, 10, 11, 13, 14, 16},
-	{18, 20, 22, 25, 28, 32, 35, 40, 45, 50, 56, 63},
-	{71, 79, 89, 100, 112, 126, 141, 158, 178, 200, 224, 251},
-	{282, 316, 355, 398, 447, 501, 562, 631, 708, 794, 891, 1000},
-	{1122, 1259, 1413, 1585, 1778, 1995, 2239, 2512, 2818, 3162, 3548, 3981},
-	{4467, 5012, 5623, 6310, 7079, 7943, 8913, 10000, 11220, 12589, 14125, 15849},
-	{17783, 19953, 22387, 25119, 28184, 31623, 35481, 39811, 44668, 50119, 56234, 65535}
-};
 
 /* avoid to warn in FreeBSD => To DO modify */
 static u32 EDCAParam[HT_IOT_PEER_MAX][3] = {
-- 
2.17.1

