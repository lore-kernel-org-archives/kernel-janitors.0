From: Colin King <colin.king@canonical.com>
Date: Fri, 14 Sep 2018 12:38:50 +0000
Subject: [PATCH][regulator-next] regulator: pfuze100-regulator: fix spelling mistake "standy" -> "standby"
Message-Id: <20180914123850.5795-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Trivial fix to spelling mistake in dev_info message

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/regulator/pfuze100-regulator.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/regulator/pfuze100-regulator.c b/drivers/regulator/pfuze100-regulator.c
index 1e43a9de3bd5..dd41a9bb3f5c 100644
--- a/drivers/regulator/pfuze100-regulator.c
+++ b/drivers/regulator/pfuze100-regulator.c
@@ -576,7 +576,7 @@ static struct pfuze_chip *syspm_pfuze_chip;
 
 static void pfuze_power_off_prepare(void)
 {
-	dev_info(syspm_pfuze_chip->dev, "Configure standy mode for power off");
+	dev_info(syspm_pfuze_chip->dev, "Configure standby mode for power off");
 
 	/* Switch from default mode: APS/APS to APS/Off */
 	regmap_update_bits(syspm_pfuze_chip->regmap, PFUZE100_SW1ABMODE,
-- 
2.17.1
