From: Colin King <colin.king@canonical.com>
Date: Thu, 06 Aug 2020 16:43:22 +0000
Subject: [PATCH][next] thermal: mediatek: remove redundant initialization of variables
Message-Id: <20200806164322.91568-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Zhang Rui <rui.zhang@intel.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, Amit Kucheria <amitk@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There are several variables that are being initialized with values
that are never read and the variables are being re-assigned later
on. Remove the redundant initializations.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/thermal/mtk_thermal.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/thermal/mtk_thermal.c b/drivers/thermal/mtk_thermal.c
index 0bd7aa564bc2..88f3cf75af0d 100644
--- a/drivers/thermal/mtk_thermal.c
+++ b/drivers/thermal/mtk_thermal.c
@@ -573,12 +573,12 @@ static int raw_to_mcelsius_v1(struct mtk_thermal *mt, int sensno, s32 raw)
 
 static int raw_to_mcelsius_v2(struct mtk_thermal *mt, int sensno, s32 raw)
 {
-	s32 format_1 = 0;
-	s32 format_2 = 0;
-	s32 g_oe = 1;
-	s32 g_gain = 1;
-	s32 g_x_roomt = 0;
-	s32 tmp = 0;
+	s32 format_1;
+	s32 format_2;
+	s32 g_oe;
+	s32 g_gain;
+	s32 g_x_roomt;
+	s32 tmp;
 
 	if (raw = 0)
 		return 0;
-- 
2.27.0
