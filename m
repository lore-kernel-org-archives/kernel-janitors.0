From: Mark Brown <broonie@kernel.org>
Date: Mon, 09 Jul 2018 11:16:46 +0000
Subject: Applied "regulator: max8997: clean up a condition in max8997_list_voltage()" to the regulator tree
Message-Id: <E1fcU9u-0005dI-QC@debutante>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <20180706083718.n3b7ejg42fknnwb2@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.orglinux-kernel@vger.kernel.org

The patch

   regulator: max8997: clean up a condition in max8997_list_voltage()

has been applied to the regulator tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git 

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

From 1aa1b918946537c089716bffd1399e30a2981cb7 Mon Sep 17 00:00:00 2001
From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 6 Jul 2018 11:37:18 +0300
Subject: [PATCH] regulator: max8997: clean up a condition in
 max8997_list_voltage()

The current code generates a static cehcker warnings because "rid < 0"
is always false:

    drivers/regulator/max8997-regulator.c:169 max8997_list_voltage()
    warn: condition is always false

The problem is that because of type promotion, if "rid" is negative the
comparison against ARRAY_SIZE() is type promoted to size_t and it's
treated as a very high positive value.  I've changed the order of the
checks so now everyone is happy.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 drivers/regulator/max8997-regulator.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/regulator/max8997-regulator.c b/drivers/regulator/max8997-regulator.c
index a8ea30ee18a6..029a6ee426ab 100644
--- a/drivers/regulator/max8997-regulator.c
+++ b/drivers/regulator/max8997-regulator.c
@@ -165,8 +165,7 @@ static int max8997_list_voltage(struct regulator_dev *rdev,
 	int rid = rdev_get_id(rdev);
 	int val;
 
-	if (rid >= ARRAY_SIZE(reg_voltage_map) ||
-			rid < 0)
+	if (rid < 0 || rid >= ARRAY_SIZE(reg_voltage_map))
 		return -EINVAL;
 
 	desc = reg_voltage_map[rid];
-- 
2.18.0.rc2

