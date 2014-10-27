From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 27 Oct 2014 10:45:06 +0000
Subject: [patch v2] regulator: max77802: fix a test in max77802_set_suspend_mode()
Message-Id: <20141027104506.GA22704@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <71442C69-B48C-46B8-93A1-068AC26E01C2@collabora.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Liam Girdwood <lgirdwood@gmail.com>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Cc: Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

The original test triggers a static checker warning.  Javier Martinez
Canillas says that the "!" is a typo and should be removed.

Fixes: 2e0eaa1aa008 ('regulator: max77802: Add set suspend mode for BUCKs and simplify code')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
v2:  The first version of this patch was buggy.  Thanks Javier for
your review.

diff --git a/drivers/regulator/max77802.c b/drivers/regulator/max77802.c
index 5839c45..7718c8a 100644
--- a/drivers/regulator/max77802.c
+++ b/drivers/regulator/max77802.c
@@ -179,7 +179,7 @@ static int max77802_set_suspend_mode(struct regulator_dev *rdev,
 	 * If the regulator has been disabled for suspend
 	 * then is invalid to try setting a suspend mode.
 	 */
-	if (!max77802->opmode[id] = MAX77802_OFF_PWRREQ) {
+	if (max77802->opmode[id] = MAX77802_OFF_PWRREQ) {
 		dev_warn(&rdev->dev, "%s: is disabled, mode: 0x%x not set\n",
 			 rdev->desc->name, mode);
 		return 0;
