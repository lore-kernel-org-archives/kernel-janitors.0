From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 02 Nov 2017 07:59:31 +0000
Subject: [PATCH 1/3] regulator/core: Use common error handling code in regulator_resolve_supply()
Message-Id: <61939d80-851f-601a-d5df-1278abede5c3@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <471498fb-58af-46d4-2150-614c0f9cdc22@users.sourceforge.net>
In-Reply-To: <471498fb-58af-46d4-2150-614c0f9cdc22@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 1 Nov 2017 22:20:13 +0100

* Add a jump target so that a bit of exception handling can be better
  reused at the end of this function.

* Adjust two condition checks.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/regulator/core.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/regulator/core.c b/drivers/regulator/core.c
index b64b7916507f..14fdf2f17a62 100644
--- a/drivers/regulator/core.c
+++ b/drivers/regulator/core.c
@@ -1554,23 +1554,19 @@ static int regulator_resolve_supply(struct regulator_dev *rdev)
 	 */
 	if (r->dev.parent && r->dev.parent != rdev->dev.parent) {
 		if (!device_is_bound(r->dev.parent)) {
-			put_device(&r->dev);
-			return -EPROBE_DEFER;
+			ret = -EPROBE_DEFER;
+			goto put_device;
 		}
 	}
 
 	/* Recursively resolve the supply of the supply */
 	ret = regulator_resolve_supply(r);
-	if (ret < 0) {
-		put_device(&r->dev);
-		return ret;
-	}
+	if (ret)
+		goto put_device;
 
 	ret = set_supply(rdev, r);
-	if (ret < 0) {
-		put_device(&r->dev);
-		return ret;
-	}
+	if (ret)
+		goto put_device;
 
 	/* Cascade always-on state to supply */
 	if (_regulator_is_enabled(rdev)) {
@@ -1583,6 +1579,10 @@ static int regulator_resolve_supply(struct regulator_dev *rdev)
 	}
 
 	return 0;
+
+put_device:
+	put_device(&r->dev);
+	return ret;
 }
 
 /* Internal regulator request function */
-- 
2.14.3

