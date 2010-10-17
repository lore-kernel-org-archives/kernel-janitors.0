From: Vasiliy Kulikov <segooon@gmail.com>
Date: Sun, 17 Oct 2010 14:41:12 +0000
Subject: [PATCH 1/8] char: applicom: fix information leak to userland
Message-Id: <1287326472-7897-1-git-send-email-segooon@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>, Andrew Morton <akpm@linux-foundation.org>, Frederic Weisbecker <fweisbec@gmail.com>, Julia Lawall <julia@diku.dk>, Jiri Kosina <jkosina@suse.cz>, linux-kernel@vger.kernel.org

Structure st_loc is copied to userland with some fields unitialized.
It leads to leaking of stack memory.

Signed-off-by: Vasiliy Kulikov <segooon@gmail.com>
---
 Compile tested.

 drivers/char/applicom.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/drivers/char/applicom.c b/drivers/char/applicom.c
index e7ba774..25373df 100644
--- a/drivers/char/applicom.c
+++ b/drivers/char/applicom.c
@@ -566,6 +566,7 @@ static ssize_t ac_read (struct file *filp, char __user *buf, size_t count, loff_
 				struct mailbox mailbox;
 
 				/* Got a packet for us */
+				memset(&st_loc, 0, sizeof(st_loc));
 				ret = do_ac_read(i, buf, &st_loc, &mailbox);
 				spin_unlock_irqrestore(&apbs[i].mutex, flags);
 				set_current_state(TASK_RUNNING);
-- 
1.7.0.4

