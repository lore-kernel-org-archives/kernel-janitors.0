From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 14 Aug 2013 16:14:03 +0000
Subject: [patch] regulator: 88pm800: forever loop in pm800_regulator_probe()
Message-Id: <20130814161403.GA13601@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Liam Girdwood <lgirdwood@gmail.com>, Axel Lin <axel.lin@ingics.com>
Cc: Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

This is supposed to be testing "i < ARRAY_SIZE()" instead of just
"ARRAY_SIZE()".

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/regulator/88pm800.c b/drivers/regulator/88pm800.c
index 58e9b74..3459f60 100644
--- a/drivers/regulator/88pm800.c
+++ b/drivers/regulator/88pm800.c
@@ -302,7 +302,7 @@ static int pm800_regulator_probe(struct platform_device *pdev)
 		unsigned int count = 0;
 
 		/* Check whether num_regulator is valid. */
-		for (i = 0; ARRAY_SIZE(pdata->regulators); i++) {
+		for (i = 0; i < ARRAY_SIZE(pdata->regulators); i++) {
 			if (pdata->regulators[i])
 				count++;
 		}
