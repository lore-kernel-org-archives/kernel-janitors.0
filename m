From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sat, 21 Sep 2019 06:00:59 +0000
Subject: [PATCH] firmware: turris-mox-rwtm: small white space cleanup
Message-Id: <20190921060059.GC18726@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Marek Behun <marek.behun@nic.cz>, Arnd Bergmann <arnd@arndb.de>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

This patch deletes a stray tab.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
I don't use Fixes tags for whitespace but the commit that added this
driver was commit 389711b37493 ("firmware: Add Turris Mox rWTM firmware
driver").  When we're adding a driver, it really helps if we use the
prefix that the driver will have.  So instead of "firmware:" it would be
"firmware: turris-mox-rwtm:" or whatever...

Presumably everyone will copy whatever I choose so this only really
affects me.

 drivers/firmware/turris-mox-rwtm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/firmware/turris-mox-rwtm.c b/drivers/firmware/turris-mox-rwtm.c
index 72be58960e54..e27f68437b56 100644
--- a/drivers/firmware/turris-mox-rwtm.c
+++ b/drivers/firmware/turris-mox-rwtm.c
@@ -197,7 +197,7 @@ static int mox_get_board_info(struct mox_rwtm *rwtm)
 		rwtm->serial_number = reply->status[1];
 		rwtm->serial_number <<= 32;
 		rwtm->serial_number |= reply->status[0];
-			rwtm->board_version = reply->status[2];
+		rwtm->board_version = reply->status[2];
 		rwtm->ram_size = reply->status[3];
 		reply_to_mac_addr(rwtm->mac_address1, reply->status[4],
 				  reply->status[5]);
-- 
2.20.1
