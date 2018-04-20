From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 20 Apr 2018 09:21:05 +0000
Subject: [PATCH] mfd: tps65911-comparator: Fix a build error
Message-Id: <20180420092105.GA28058@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <20180420085938.ymf2jc46dswylxh4@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lee Jones <lee.jones@linaro.org>, Rhyland Klein <rklein@nvidia.com>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

In 2012, we changed the tps65910 API and fixed most drivers but forgot
to update this one.

Fixes: 3f7e82759c69 ("mfd: Commonize tps65910 regmap access through header")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/mfd/tps65911-comparator.c b/drivers/mfd/tps65911-comparator.c
index 887409c3938d..90cfdd1f88c6 100644
--- a/drivers/mfd/tps65911-comparator.c
+++ b/drivers/mfd/tps65911-comparator.c
@@ -74,7 +74,7 @@ static int comp_threshold_set(struct tps65910 *tps65910, int id, int voltage)
 		return -EINVAL;
 
 	val = index << 1;
-	ret = tps65910->write(tps65910, tps_comp.reg, 1, &val);
+	ret = tps65910_reg_write(tps65910, tps_comp.reg, val);
 
 	return ret;
 }
@@ -82,10 +82,10 @@ static int comp_threshold_set(struct tps65910 *tps65910, int id, int voltage)
 static int comp_threshold_get(struct tps65910 *tps65910, int id)
 {
 	struct comparator tps_comp = tps_comparators[id - 1];
+	unsigned int val;
 	int ret;
-	u8 val;
 
-	ret = tps65910->read(tps65910, tps_comp.reg, 1, &val);
+	ret = tps65910_reg_read(tps65910, tps_comp.reg, &val);
 	if (ret < 0)
 		return ret;
 
