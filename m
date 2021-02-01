From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 01 Feb 2021 12:22:07 +0000
Subject: [PATCH] misc: bcm-vk: unlock on error in bcm_to_h_msg_dequeue()
Message-Id: <YBfyb+jU5lDUe+5g@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Scott Branden <scott.branden@broadcom.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Olof Johansson <olof@lixom.net>, Desmond Yan <desmond.yan@broadcom.com>, bcm-kernel-feedback-list@broadcom.com, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Unlock before returning on this error path.

Fixes: 111d746bb476 ("misc: bcm-vk: add VK messaging support")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/misc/bcm-vk/bcm_vk_msg.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/misc/bcm-vk/bcm_vk_msg.c b/drivers/misc/bcm-vk/bcm_vk_msg.c
index eec90494777d..fc972e43258a 100644
--- a/drivers/misc/bcm-vk/bcm_vk_msg.c
+++ b/drivers/misc/bcm-vk/bcm_vk_msg.c
@@ -849,7 +849,8 @@ s32 bcm_to_h_msg_dequeue(struct bcm_vk *vk)
 				 * that is fatal.
 				 */
 				dev_crit(dev, "Kernel mem allocation failure.\n");
-				return -ENOMEM;
+				total = -ENOMEM;
+				goto idx_err;
 			}
 
 			/* flush rd pointer after a message is dequeued */
-- 
2.29.2
