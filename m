From: Andreas Platschek <andi.platschek@gmail.com>
Date: Thu, 21 Nov 2013 19:12:12 +0000
Subject: [PATCH] tty: replace mutex_lock() with tty_write_lock()
Message-Id: <1385061132-7254-1-git-send-email-andi.platschek@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: gregkh@linuxfoundation.org
Cc: jslaby@suse.cz, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Andreas Platschek <andi.platschek@gmail.com>

Use tty_write_lock()/tty_write_unlock() consistently.

This takes care of the following sparse warning:
drivers/tty/tty_io.c:1169:17: warning: context imbalance in 'tty_write_message' - unexpected unlock

Signed-off-by: Andreas Platschek <andi.platschek@gmail.com>
---
 drivers/tty/tty_io.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/tty/tty_io.c b/drivers/tty/tty_io.c
index 3a1a01a..13dca92 100644
--- a/drivers/tty/tty_io.c
+++ b/drivers/tty/tty_io.c
@@ -1165,7 +1165,7 @@ out:
 void tty_write_message(struct tty_struct *tty, char *msg)
 {
 	if (tty) {
-		mutex_lock(&tty->atomic_write_lock);
+		tty_write_lock(tty,0);
 		tty_lock(tty);
 		if (tty->ops->write && !test_bit(TTY_CLOSING, &tty->flags)) {
 			tty_unlock(tty);
-- 
1.7.10.4

