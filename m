From: Julia Lawall <julia@diku.dk>
Date: Sat, 21 Nov 2009 21:18:44 +0000
Subject: [PATCH] drivers/regulator: use PTR_ERR to get error code
Message-Id: <Pine.LNX.4.64.0911212218210.28848@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Liam Girdwood <lrg@slimlogic.co.uk>, Mark Brown <broonie@opensource.wolfsonmicro.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

IS_ERR returns only 1 or 0.  The callsite of setup_regulators expects a
negative integer in an error case.  Thus, PTR_ERR has to be used to extract
it.

The semantic match that finds this problem is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@@
expression E,E1;
@@

*E = IS_ERR(...)
 ... when != E = E1
*return E;
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 drivers/regulator/lp3971.c          |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/regulator/lp3971.c b/drivers/regulator/lp3971.c
index 7803a32..76d08c2 100644
--- a/drivers/regulator/lp3971.c
+++ b/drivers/regulator/lp3971.c
@@ -446,8 +446,8 @@ static int setup_regulators(struct lp3971 *lp3971,
 		lp3971->rdev[i] = regulator_register(&regulators[id],
 			lp3971->dev, pdata->regulators[i].initdata, lp3971);
 
-		err = IS_ERR(lp3971->rdev[i]);
-		if (err) {
+		if (IS_ERR(lp3971->rdev[i])) {
+			err = PTR_ERR(lp3971->rdev[i]);
 			dev_err(lp3971->dev, "regulator init failed: %d\n",
 				err);
 			goto error;
