From: Colin King <colin.king@canonical.com>
Date: Fri, 20 Apr 2018 09:26:23 +0000
Subject: [PATCH] regulator: wm8350: fix missing increment of loop index i
Message-Id: <20180420092623.1327-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, patches@opensource.cirrus.com
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

It seems that the loop index i is not being incremented and hence
potentially the while loop could spin forever. Fortunately with the
data being used this does not appear to happen at the moment.

Fixes: da09155ac8d3 ("regulator: Add WM8350 regulator support")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/regulator/wm8350-regulator.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/regulator/wm8350-regulator.c b/drivers/regulator/wm8350-regulator.c
index da9106bd2109..8ad11b074b49 100644
--- a/drivers/regulator/wm8350-regulator.c
+++ b/drivers/regulator/wm8350-regulator.c
@@ -911,6 +911,7 @@ static unsigned int get_mode(int uA, const struct wm8350_dcdc_efficiency *eff)
 	while (eff[i].uA_load_min != -1) {
 		if (uA >= eff[i].uA_load_min && uA <= eff[i].uA_load_max)
 			return eff[i].mode;
+		i++;
 	}
 	return REGULATOR_MODE_NORMAL;
 }
-- 
2.17.0

