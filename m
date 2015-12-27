From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 27 Dec 2015 17:33:00 +0000
Subject: [PATCH] [media] si2165: Refactoring for si2165_writereg_mask8()
Message-Id: <568020CC.1060004@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
In-Reply-To: <566ABCD9.1060404@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-media@vger.kernel.org, Mauro Carvalho Chehab <mchehab@osg.samsung.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 27 Dec 2015 18:23:57 +0100

This issue was detected by using the Coccinelle software.

1. Let us return directly if a call of the si2165_readreg8()
   function failed.

2. Reduce the scope for the local variables "ret" and "tmp" to one branch
   of an if statement.

3. Delete the jump label "err" then.

4. Return the value from a call of the si2165_writereg8() function
   without using an extra assignment for the variable "ret" at the end.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/media/dvb-frontends/si2165.c | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/drivers/media/dvb-frontends/si2165.c b/drivers/media/dvb-frontends/si2165.c
index 2b93241..e8518ae 100644
--- a/drivers/media/dvb-frontends/si2165.c
+++ b/drivers/media/dvb-frontends/si2165.c
@@ -225,22 +225,18 @@ static int si2165_writereg32(struct si2165_state *state, const u16 reg, u32 val)
 static int si2165_writereg_mask8(struct si2165_state *state, const u16 reg,
 				 u8 val, u8 mask)
 {
-	int ret;
-	u8 tmp;
-
 	if (mask != 0xff) {
-		ret = si2165_readreg8(state, reg, &tmp);
+		u8 tmp;
+		int ret = si2165_readreg8(state, reg, &tmp);
+
 		if (ret < 0)
-			goto err;
+			return ret;
 
 		val &= mask;
 		tmp &= ~mask;
 		val |= tmp;
 	}
-
-	ret = si2165_writereg8(state, reg, val);
-err:
-	return ret;
+	return si2165_writereg8(state, reg, val);
 }
 
 #define REG16(reg, val) { (reg), (val) & 0xff }, { (reg)+1, (val)>>8 & 0xff }
-- 
2.6.3

