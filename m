From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 13 Jan 2020 12:59:33 +0000
Subject: [PATCH] regulator: mpq7920: Check the correct variable in mpq7920_regulator_register()
Message-Id: <20200113125805.xri6jqoxy2ldzqyg@kili.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Saravanan Sekar <sravanhome@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

There is a typo in the error checking.  We should be checking
"->rdev[i]" instead of just "->rdev".

Fixes: 6501c1f54a17 ("regulator: mpq7920: add mpq7920 regulator driver")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/regulator/mpq7920.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/regulator/mpq7920.c b/drivers/regulator/mpq7920.c
index ab1b847c57e5..80f3131f0d1b 100644
--- a/drivers/regulator/mpq7920.c
+++ b/drivers/regulator/mpq7920.c
@@ -274,8 +274,8 @@ static inline int mpq7920_regulator_register(
 
 		info->rdev[i] = devm_regulator_register(info->dev, rdesc,
 					 config);
-		if (IS_ERR(info->rdev))
-			return PTR_ERR(info->rdev);
+		if (IS_ERR(info->rdev[i]))
+			return PTR_ERR(info->rdev[i]);
 	}
 
 	return 0;
-- 
2.11.0
