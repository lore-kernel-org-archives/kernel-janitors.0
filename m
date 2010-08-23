From: Dan Carpenter <error27@gmail.com>
Date: Mon, 23 Aug 2010 21:21:03 +0000
Subject: [patch] pda_power: remove unneeded assignment
Message-Id: <20100823212103.GA7340@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Anton Vorontsov <cbouatmailru@gmail.com>
Cc: Daniel Mack <daniel@caiaq.de>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

We never use the "ret" value from this assignment, and also
PTR_ERR(NULL) is zero.  I looked at it and this driver is designed to
accept a NULL value for "ac_draw".  So there isn't a bug in the original
code and we can just remove this confusing assignment.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/power/pda_power.c b/drivers/power/pda_power.c
index 69f8aa3..63a6a4d 100644
--- a/drivers/power/pda_power.c
+++ b/drivers/power/pda_power.c
@@ -279,7 +279,6 @@ static int pda_power_probe(struct platform_device *pdev)
 	if (IS_ERR(ac_draw)) {
 		dev_dbg(dev, "couldn't get ac_draw regulator\n");
 		ac_draw = NULL;
-		ret = PTR_ERR(ac_draw);
 	}
 
 	if (pdata->is_ac_online) {
