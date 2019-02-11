From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 11 Feb 2019 18:45:45 +0000
Subject: [PATCH] vmw_balloon: release lock on error in vmballoon_reset()
Message-Id: <20190211184545.GC22106@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julien Freche <jfreche@vmware.com>, Xavier Deguillard <xdeguillard@vmware.com>, Nadav Amit <namit@vmware.com>
Cc: "VMware, Inc." <pv-drivers@vmware.com>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

We added some locking to this function but forgot to drop the lock on
these two error paths.  This bug would lead to an immediate deadlock.

Fixes: c7b3690fb152 ("vmw_balloon: stats rework")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/misc/vmw_balloon.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/misc/vmw_balloon.c b/drivers/misc/vmw_balloon.c
index 6542a7711cac..ad807d5a3141 100644
--- a/drivers/misc/vmw_balloon.c
+++ b/drivers/misc/vmw_balloon.c
@@ -1330,7 +1330,7 @@ static void vmballoon_reset(struct vmballoon *b)
 	vmballoon_pop(b);
 
 	if (vmballoon_send_start(b, VMW_BALLOON_CAPABILITIES))
-		return;
+		goto unlock;
 
 	if ((b->capabilities & VMW_BALLOON_BATCHED_CMDS) != 0) {
 		if (vmballoon_init_batching(b)) {
@@ -1341,7 +1341,7 @@ static void vmballoon_reset(struct vmballoon *b)
 			 * The guest will retry in one second.
 			 */
 			vmballoon_send_start(b, 0);
-			return;
+			goto unlock;
 		}
 	} else if ((b->capabilities & VMW_BALLOON_BASIC_CMDS) != 0) {
 		vmballoon_deinit_batching(b);
@@ -1357,6 +1357,7 @@ static void vmballoon_reset(struct vmballoon *b)
 	if (vmballoon_send_guest_id(b))
 		pr_err("failed to send guest ID to the host\n");
 
+unlock:
 	up_write(&b->conf_sem);
 }
 
-- 
2.17.1
