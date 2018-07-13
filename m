From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 13 Jul 2018 14:55:15 +0000
Subject: [PATCH] pinctrl: freescale: off by one in imx1_pinconf_group_dbg_show()
Message-Id: <20180713145514.r7ukvw23kcdwc3pv@kili.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

The info->groups[] array is allocated in imx1_pinctrl_parse_dt().  It
has info->ngroups elements.  Thus the > here should be >= to prevent
reading one element beyond the end of the array.

Fixes: 30612cd90005 ("pinctrl: imx1 core driver")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/pinctrl/freescale/pinctrl-imx1-core.c b/drivers/pinctrl/freescale/pinctrl-imx1-core.c
index c3bdd90b1422..deb7870b3d1a 100644
--- a/drivers/pinctrl/freescale/pinctrl-imx1-core.c
+++ b/drivers/pinctrl/freescale/pinctrl-imx1-core.c
@@ -429,7 +429,7 @@ static void imx1_pinconf_group_dbg_show(struct pinctrl_dev *pctldev,
 	const char *name;
 	int i, ret;
 
-	if (group > info->ngroups)
+	if (group >= info->ngroups)
 		return;
 
 	seq_puts(s, "\n");
