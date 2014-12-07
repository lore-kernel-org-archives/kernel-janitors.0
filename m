From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sun, 07 Dec 2014 19:21:01 +0000
Subject: [PATCH 19/20] TTY: fix misspelling of current function in string
Message-Id: <1417980062-25151-20-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1417980062-25151-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1417980062-25151-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: kernel-janitors@vger.kernel.org, linux@rasmusvillemoes.dk, joe@perches.com, Jiri Slaby <jslaby@suse.cz>, linux-kernel@vger.kernel.org

Replace a misspelled function name by %s and then __func__.

This was done using Coccinelle, including the use of Levenshtein distance,
as proposed by Rasmus Villemoes.

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
The semantic patch is difficult to summarize, but is available in the cover
letter of this patch series.

 drivers/tty/rocket.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/tty/rocket.c b/drivers/tty/rocket.c
index 383c4c7..c8dd8dc 100644
--- a/drivers/tty/rocket.c
+++ b/drivers/tty/rocket.c
@@ -1390,7 +1390,7 @@ static void rp_unthrottle(struct tty_struct *tty)
 	       tty->ldisc.chars_in_buffer(tty));
 #endif
 
-	if (rocket_paranoia_check(info, "rp_throttle"))
+	if (rocket_paranoia_check(info, "rp_unthrottle"))
 		return;
 
 	if (I_IXOFF(tty))
@@ -1458,7 +1458,7 @@ static void rp_wait_until_sent(struct tty_struct *tty, int timeout)
 
 	orig_jiffies = jiffies;
 #ifdef ROCKET_DEBUG_WAIT_UNTIL_SENT
-	printk(KERN_INFO "In RP_wait_until_sent(%d) (jiff=%lu)...\n", timeout,
+	printk(KERN_INFO "In %s(%d) (jiff=%lu)...\n", __func__, timeout,
 	       jiffies);
 	printk(KERN_INFO "cps=%d...\n", info->cps);
 #endif

