From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 29 Oct 2014 08:43:25 +0000
Subject: [patch] goldfish: off by one in goldfish_tty_console_setup()
Message-Id: <20141029084325.GB8939@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Jiri Slaby <jslaby@suse.cz>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

The goldfish_ttys[] array has "goldfish_tty_line_count" number of
elements.  It's allocated in goldfish_tty_create_driver().  This test
should be >= instead of >.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/tty/goldfish.c b/drivers/tty/goldfish.c
index 09495f5..2f68540 100644
--- a/drivers/tty/goldfish.c
+++ b/drivers/tty/goldfish.c
@@ -155,7 +155,7 @@ static struct tty_driver *goldfish_tty_console_device(struct console *c,
 
 static int goldfish_tty_console_setup(struct console *co, char *options)
 {
-	if ((unsigned)co->index > goldfish_tty_line_count)
+	if ((unsigned)co->index >= goldfish_tty_line_count)
 		return -ENODEV;
 	if (goldfish_ttys[co->index].base = 0)
 		return -ENODEV;
