From: Diego Liziero <diegoliz@gmail.com>
Date: Tue, 14 Apr 2009 01:04:47 +0000
Subject: [PATCH] drivers/regulator: fix when type is different from REGULATOR_VOLTAGE
Message-Id: <49E3E12F.20808@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


From: Diego Liziero <diegoliz@gmail.com>

When regulator_desc->type is something different from REGULATOR_VOLTAGE or REGULATOR_CURRENT
the if should probably return ERR_PTR(-EINVAL)

The semantic patch that makes this change is as follows:
(http://www.emn.fr/x-info/coccinelle/)

@@ expression E; constant C; @@
(
- !E = C
+ E != C
)

Signed-off-by: Diego Liziero <diegoliz@gmail.com>

---
diff = 
--- ./drivers/regulator/core.c	2009-04-13 01:21:28.000000000 +0200
+++ /tmp/cocci-output-26453-5bbb39-core.c	2009-04-13 20:38:48.000000000 +0200
@@ -2001,8 +2001,8 @@ struct regulator_dev *regulator_register
 	if (regulator_desc->name = NULL || regulator_desc->ops = NULL)
 		return ERR_PTR(-EINVAL);
 
-	if (!regulator_desc->type = REGULATOR_VOLTAGE &&
-	    !regulator_desc->type = REGULATOR_CURRENT)
+	if (regulator_desc->type != REGULATOR_VOLTAGE &&
+	    regulator_desc->type != REGULATOR_CURRENT)
 		return ERR_PTR(-EINVAL);
 
 	if (!init_data)
