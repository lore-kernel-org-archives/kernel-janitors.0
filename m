From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Sun, 24 Jan 2021 06:32:53 +0000
Subject: [PATCH] driver core: Fix a reource leak in 'fw_devlink_create_devlink()'
Message-Id: <20210124063253.720637-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: gregkh@linuxfoundation.org, rafael@kernel.org, saravanak@google.com
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

In 'fw_devlink_create_devlink()', all exit paths, successful or not,
release the reference taken on 'sup_dev'.
All but this one.

Use the existing error handling case to call the missing 'put_device()'.

Fixes: f9aa460672c9c ("driver core: Refactor fw_devlink feature")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
Speculative and compile tested only
---
 drivers/base/core.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/base/core.c b/drivers/base/core.c
index e08d376631cc..8775717a6bf7 100644
--- a/drivers/base/core.c
+++ b/drivers/base/core.c
@@ -1623,8 +1623,10 @@ static int fw_devlink_create_devlink(struct device *con,
 	 * cycles. So cycle detection isn't necessary and shouldn't be
 	 * done.
 	 */
-	if (flags & DL_FLAG_SYNC_STATE_ONLY)
-		return -EAGAIN;
+	if (flags & DL_FLAG_SYNC_STATE_ONLY) {
+		ret = -EAGAIN;
+		goto out;
+	}
 
 	/*
 	 * If we can't find the supplier device from its fwnode, it might be
-- 
2.27.0
