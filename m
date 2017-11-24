From: Colin King <colin.king@canonical.com>
Date: Fri, 24 Nov 2017 13:13:45 +0000
Subject: [PATCH] atm: firestream: use setup_timer instead of init_timer
Message-Id: <20171124131345.31421-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Chas Williams <3chas3@gmail.com>, linux-atm-general@lists.sourceforge.net, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Use setup_timer function instead of initializing timer with the
function and data fields.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/atm/firestream.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/atm/firestream.c b/drivers/atm/firestream.c
index 6b6368a56526..534001270be5 100644
--- a/drivers/atm/firestream.c
+++ b/drivers/atm/firestream.c
@@ -1885,9 +1885,7 @@ static int fs_init(struct fs_dev *dev)
 	}
 
 #ifdef FS_POLL_FREQ
-	init_timer (&dev->timer);
-	dev->timer.data = (unsigned long) dev;
-	dev->timer.function = fs_poll;
+	setup_timer(&dev->timer, fs_poll, (unsigned long)dev);
 	dev->timer.expires = jiffies + FS_POLL_FREQ;
 	add_timer (&dev->timer);
 #endif
-- 
2.14.1

