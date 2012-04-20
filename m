From: Emil Goode <emilgoode@gmail.com>
Date: Fri, 20 Apr 2012 15:52:34 +0000
Subject: [PATCH] drivers/tty: Use get_user instead of dereferencing user pointer
Message-Id: <1334937154-23037-1-git-send-email-emilgoode@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: gregkh@linuxfoundation.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Emil Goode <emilgoode@gmail.com>

We should use the get_user macro instead of dereferencing user
pointers directly.

This patch fixes the following sparse warning:
drivers/tty/n_tty.c:1648:51: warning:
	dereference of noderef expression

Signed-off-by: Emil Goode <emilgoode@gmail.com>
---
I'm a newbie so please review carefully.
Not sure if I should add error handling for the get_user call here.

 drivers/tty/n_tty.c |    4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/tty/n_tty.c b/drivers/tty/n_tty.c
index 94b6eda..5ff63cc 100644
--- a/drivers/tty/n_tty.c
+++ b/drivers/tty/n_tty.c
@@ -1630,6 +1630,7 @@ static int copy_from_read_buf(struct tty_struct *tty,
 	int retval;
 	size_t n;
 	unsigned long flags;
+	unsigned char ch;
 
 	retval = 0;
 	spin_lock_irqsave(&tty->read_lock, flags);
@@ -1645,7 +1646,8 @@ static int copy_from_read_buf(struct tty_struct *tty,
 		tty->read_cnt -= n;
 		/* Turn single EOF into zero-length read */
 		if (L_EXTPROC(tty) && tty->icanon && n = 1) {
-			if (!tty->read_cnt && (*b)[n-1] = EOF_CHAR(tty))
+			get_user(ch, b[n-1]);
+			if (!tty->read_cnt && ch = EOF_CHAR(tty))
 				n--;
 		}
 		spin_unlock_irqrestore(&tty->read_lock, flags);
-- 
1.7.9.5

