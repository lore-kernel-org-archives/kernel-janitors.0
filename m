From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sun, 24 Feb 2013 11:55:34 +0000
Subject: [PATCH 2/2] drivers/regulator/s5m8767.c: adjust duplicate test
Message-Id: <1361706934-15434-3-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1361706934-15434-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1361706934-15434-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Sangbeom Kim <sbkim73@samsung.com>
Cc: kernel-janitors@vger.kernel.org, Liam Girdwood <lrg@ti.com>, Mark Brown <broonie@opensource.wolfsonmicro.com>, linux-kernel@vger.kernel.org

From: Julia Lawall <Julia.Lawall@lip6.fr>

Delete successive tests to the same location.

A simplified version of the semantic match that finds this problem is as
follows: (http://coccinelle.lip6.fr/)

// <smpl>
@s exists@
local idexpression y;
expression x,e;
@@

*if ( \(x = NULL\|IS_ERR(x)\|y != 0\) )
 { ... when forall
   return ...; }
... when != \(y = e\|y += e\|y -= e\|y |= e\|y &= e\|y++\|y--\|&y\)
*if ( \(x = NULL\|IS_ERR(x)\|y != 0\) )
 { ... when forall
   return ...; }
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/regulator/s5m8767.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/regulator/s5m8767.c b/drivers/regulator/s5m8767.c
index 8a83194..8e56198 100644
--- a/drivers/regulator/s5m8767.c
+++ b/drivers/regulator/s5m8767.c
@@ -549,7 +549,7 @@ static int s5m8767_pmic_dt_parse_pdata(struct platform_device *pdev,
 
 	rmode = devm_kzalloc(&pdev->dev, sizeof(*rmode) *
 				pdata->num_regulators, GFP_KERNEL);
-	if (!rdata) {
+	if (!rmode) {
 		dev_err(iodev->dev,
 			"could not allocate memory for regulator mode\n");
 		return -ENOMEM;

