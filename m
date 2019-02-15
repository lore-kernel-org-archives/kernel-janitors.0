From: Colin King <colin.king@canonical.com>
Date: Fri, 15 Feb 2019 09:45:54 +0000
Subject: [PATCH][V3] regulator: axp20x: remove a redundant null check on rdev
Message-Id: <20190215094554.28593-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Chen-Yu Tsai <wens@csie.org>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Currently rdev is dereferenced when assigning desc before rdev is null
checked, this is leading to static analysis warnings.  However, rdev
can never be null, so the null check is redundant and can be removed.

Detected by CoverityScan, CID#1476031 ("Dereference before null check")

Fixes: 77e3e3b165db ("regulator: axp20x: add software based soft_start for AXP209 LDO3")
Signed-off-by: Colin Ian King <colin.king@canonical.com>

--

V2: Fix 2nd occurrance of this thinko
V3: Remove null check, Dan Carpenter noted that rdev can never be null.
---
 drivers/regulator/axp20x-regulator.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/regulator/axp20x-regulator.c b/drivers/regulator/axp20x-regulator.c
index 6d081c8321a1..db1750df579d 100644
--- a/drivers/regulator/axp20x-regulator.c
+++ b/drivers/regulator/axp20x-regulator.c
@@ -372,9 +372,6 @@ static int axp20x_set_ramp_delay(struct regulator_dev *rdev, int ramp)
 	const int *slew_rates;
 	int rate_count = 0;
 
-	if (!rdev)
-		return -EINVAL;
-
 	desc = rdev->desc;
 
 	switch (axp20x->variant) {
-- 
2.20.1
