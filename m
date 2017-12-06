From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 06 Dec 2017 19:12:34 +0000
Subject: [PATCH] tty/vt/selection: Delete an error message for a failed memory allocation in set_selection()
Message-Id: <353369d3-29c4-18c4-85d1-a51f173f663c@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org, Adam Borowski <kilobyte@angband.pl>, Al Viro <viro@zeniv.linux.org.uk>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jslaby@suse.com>, Kate Stewart <kstewart@linuxfoundation.org>
Cc: LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 6 Dec 2017 20:07:34 +0100

Omit an extra message for a memory allocation failure in this function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/tty/vt/selection.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/tty/vt/selection.c b/drivers/tty/vt/selection.c
index af4da9507180..d6087f2757ab 100644
--- a/drivers/tty/vt/selection.c
+++ b/drivers/tty/vt/selection.c
@@ -286,7 +286,6 @@ int set_selection(const struct tiocl_selection __user *sel, struct tty_struct *t
 	multiplier = use_unicode ? 3 : 1;  /* chars can take up to 3 bytes */
 	bp = kmalloc(((sel_end-sel_start)/2+1)*multiplier, GFP_KERNEL);
 	if (!bp) {
-		printk(KERN_WARNING "selection: kmalloc() failed\n");
 		clear_selection();
 		return -ENOMEM;
 	}
-- 
2.15.1

