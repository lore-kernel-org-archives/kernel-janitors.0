From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 24 Oct 2014 08:16:46 +0000
Subject: [patch] regulator: max77802: precedence error in max77802_set_suspend_mode()
Message-Id: <20141024081646.GB11140@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Liam Girdwood <lgirdwood@gmail.com>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Cc: Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

The "!" operation has higher precedence that the comparison.

Fixes: 2e0eaa1aa008 ('regulator: max77802: Add set suspend mode for BUCKs and simplify code')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/regulator/max77802.c b/drivers/regulator/max77802.c
index 5839c45..57e37fd 100644
--- a/drivers/regulator/max77802.c
+++ b/drivers/regulator/max77802.c
@@ -179,7 +179,7 @@ static int max77802_set_suspend_mode(struct regulator_dev *rdev,
 	 * If the regulator has been disabled for suspend
 	 * then is invalid to try setting a suspend mode.
 	 */
-	if (!max77802->opmode[id] = MAX77802_OFF_PWRREQ) {
+	if (max77802->opmode[id] != MAX77802_OFF_PWRREQ) {
 		dev_warn(&rdev->dev, "%s: is disabled, mode: 0x%x not set\n",
 			 rdev->desc->name, mode);
 		return 0;
