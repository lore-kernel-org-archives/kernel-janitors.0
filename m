From: Dan Carpenter <error27@gmail.com>
Date: Sat, 06 Aug 2011 14:26:41 +0000
Subject: [patch] qla3xxx: remove an extra semi-colon
Message-Id: <20110806142641.GB10373@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ron Mercer <ron.mercer@qlogic.com>
Cc: "supporter:QLOGIC QLA3XXX NE..." <linux-driver@qlogic.com>, "open list:QLOGIC QLA3XXX NE..." <netdev@vger.kernel.org>, kernel-janitors@vger.kernel.org

The define is only used one place, and it's at the end of a line so
the semi-colon doesn't affect anything.  But let's clean it up
anyway.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/net/qla3xxx.c b/drivers/net/qla3xxx.c
index 2f69140..ccde806 100644
--- a/drivers/net/qla3xxx.c
+++ b/drivers/net/qla3xxx.c
@@ -1650,7 +1650,7 @@ static int ql_mii_setup(struct ql3_adapter *qdev)
 				 SUPPORTED_1000baseT_Half |	\
 				 SUPPORTED_1000baseT_Full |	\
 				 SUPPORTED_Autoneg |		\
-				 SUPPORTED_TP);			\
+				 SUPPORTED_TP)			\
 
 static u32 ql_supported_modes(struct ql3_adapter *qdev)
 {
