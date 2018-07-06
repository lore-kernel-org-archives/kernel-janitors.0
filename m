From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 06 Jul 2018 08:37:18 +0000
Subject: [PATCH] regulator: max8997:  clean up a condition in max8997_list_voltage()
Message-Id: <20180706083718.n3b7ejg42fknnwb2@kili.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Liam Girdwood <lgirdwood@gmail.com>
Cc: Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

The current code generates a static cehcker warnings because "rid < 0"
is always false:

    drivers/regulator/max8997-regulator.c:169 max8997_list_voltage()
    warn: condition is always false

The problem is that because of type promotion, if "rid" is negative the
comparison against ARRAY_SIZE() is type promoted to size_t and it's
treated as a very high positive value.  I've changed the order of the
checks so now everyone is happy.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

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
