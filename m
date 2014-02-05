From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 05 Feb 2014 13:29:21 +0000
Subject: [patch] tg3: cleanup an error path in tg3_phy_reset_5703_4_5()
Message-Id: <20140205132920.GE800@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Nithin Nayak Sujir <nsujir@broadcom.com>
Cc: Michael Chan <mchan@broadcom.com>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

In the original code, if tg3_readphy() fails then it does an unnecessary
check to verify "err" is still zero and then returns -EBUSY.

My static checker complains about the unnecessary "if (!err)" check and
anyway it is better to propagate the -EBUSY error code from
tg3_readphy() instead of hard coding it here.  And really the original
code is confusing to look at.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/net/ethernet/broadcom/tg3.c b/drivers/net/ethernet/broadcom/tg3.c
index e2ca03e23dc1..c466e12b601e 100644
--- a/drivers/net/ethernet/broadcom/tg3.c
+++ b/drivers/net/ethernet/broadcom/tg3.c
@@ -2609,13 +2609,14 @@ static int tg3_phy_reset_5703_4_5(struct tg3 *tp)
 
 	tg3_writephy(tp, MII_CTRL1000, phy9_orig);
 
-	if (!tg3_readphy(tp, MII_TG3_EXT_CTRL, &reg32)) {
-		reg32 &= ~0x3000;
-		tg3_writephy(tp, MII_TG3_EXT_CTRL, reg32);
-	} else if (!err)
-		err = -EBUSY;
+	err = tg3_readphy(tp, MII_TG3_EXT_CTRL, &reg32);
+	if (err)
+		return err;
 
-	return err;
+	reg32 &= ~0x3000;
+	tg3_writephy(tp, MII_TG3_EXT_CTRL, reg32);
+
+	return 0;
 }
 
 static void tg3_carrier_off(struct tg3 *tp)
