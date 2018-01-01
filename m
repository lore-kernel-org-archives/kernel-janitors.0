From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 01 Jan 2018 17:54:48 +0000
Subject: [PATCH 2/2] benet: Delete an unnecessary return statement in be_work_add_vxlan_port()
Message-Id: <2b2444d9-5cee-5300-f5c2-e543505deb3a@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <86e577a3-77a4-2e74-dd2d-4d63e90ffb72@users.sourceforge.net>
In-Reply-To: <86e577a3-77a4-2e74-dd2d-4d63e90ffb72@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netdev@vger.kernel.org, Ajit Khaparde <ajit.khaparde@broadcom.com>, Sathya Perla <sathya.perla@broadcom.com>, Somnath Kotur <somnath.kotur@broadcom.com>, Sriharsha Basavapatna <sriharsha.basavapatna@broadcom.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 1 Jan 2018 18:45:17 +0100

The script "checkpatch.pl" pointed information out like the following.

WARNING: void function return statements are not generally useful

Thus remove such a statement in the affected function.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/net/ethernet/emulex/benet/be_main.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/net/ethernet/emulex/benet/be_main.c b/drivers/net/ethernet/emulex/benet/be_main.c
index 475d94762306..38cc8f875846 100644
--- a/drivers/net/ethernet/emulex/benet/be_main.c
+++ b/drivers/net/ethernet/emulex/benet/be_main.c
@@ -5001,7 +5001,6 @@ static void be_work_add_vxlan_port(struct work_struct *work)
 	be_disable_vxlan_offloads(adapter);
 done:
 	kfree(cmd_work);
-	return;
 }
 
 static void be_work_del_vxlan_port(struct work_struct *work)
-- 
2.15.1

