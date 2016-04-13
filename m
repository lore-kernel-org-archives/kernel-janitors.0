From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 13 Apr 2016 06:44:31 +0000
Subject: [patch] tty: hvc_console: silence unintialized variable warning
Message-Id: <20160413064431.GF8092@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Anton Blanchard <anton@samba.org>
Cc: Jiri Slaby <jslaby@suse.com>, Paul Gortmaker <paul.gortmaker@windriver.com>, Peter Hurley <peter@hurleysoftware.com>, Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

If ->get_char() returns a negative error code and that can mean that
"ch" is uninitialized.  The callers of this function expect NO_POLL_CHAR
on error so let's return that.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/tty/hvc/hvc_console.c b/drivers/tty/hvc/hvc_console.c
index e46d628..325747a 100644
--- a/drivers/tty/hvc/hvc_console.c
+++ b/drivers/tty/hvc/hvc_console.c
@@ -814,7 +814,7 @@ static int hvc_poll_get_char(struct tty_driver *driver, int line)
 
 	n = hp->ops->get_chars(hp->vtermno, &ch, 1);
 
-	if (n = 0)
+	if (n <= 0)
 		return NO_POLL_CHAR;
 
 	return ch;
