From: Colin King <colin.king@canonical.com>
Date: Fri, 10 Apr 2020 13:34:06 +0000
Subject: [PATCH] regulator: tps80031: remove redundant assignment to variables ret and val
Message-Id: <20200410133406.24458-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The variables ret and val are being initialized with values that are
never read and are being updated later with a new value.  The
initializations are redundant and can be removed.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/regulator/tps80031-regulator.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/regulator/tps80031-regulator.c b/drivers/regulator/tps80031-regulator.c
index 85a6a8ca8c1b..a29e65230132 100644
--- a/drivers/regulator/tps80031-regulator.c
+++ b/drivers/regulator/tps80031-regulator.c
@@ -271,7 +271,7 @@ static int tps80031_vbus_is_enabled(struct regulator_dev *rdev)
 {
 	struct tps80031_regulator *ri = rdev_get_drvdata(rdev);
 	struct device *parent = to_tps80031_dev(rdev);
-	int ret = -EIO;
+	int ret;
 	uint8_t ctrl1 = 0;
 	uint8_t ctrl3 = 0;
 
@@ -322,7 +322,7 @@ static int tps80031_vbus_disable(struct regulator_dev *rdev)
 {
 	struct tps80031_regulator *ri = rdev_get_drvdata(rdev);
 	struct device *parent = to_tps80031_dev(rdev);
-	int ret = 0;
+	int ret;
 
 	if (ri->config_flags & TPS80031_VBUS_DISCHRG_EN_PDN) {
 		ret = tps80031_write(parent, TPS80031_SLAVE_ID2,
@@ -530,7 +530,8 @@ static int tps80031_regulator_config(struct device *parent,
 	case TPS80031_REGULATOR_LDOUSB:
 		if (ri->config_flags & (TPS80031_USBLDO_INPUT_VSYS |
 			TPS80031_USBLDO_INPUT_PMID)) {
-			unsigned val = 0;
+			unsigned val;
+
 			if (ri->config_flags & TPS80031_USBLDO_INPUT_VSYS)
 				val = MISC2_LDOUSB_IN_VSYS;
 			else
-- 
2.25.1
