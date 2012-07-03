From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 03 Jul 2012 10:45:11 +0000
Subject: [patch] printk: remove some dead code
Message-Id: <20120703104511.GA29501@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kay Sievers <kay@vrfy.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andrew Morton <akpm@linux-foundation.org>, Peter Zijlstra <a.p.zijlstra@chello.nl>, Ingo Molnar <mingo@elte.hu>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Static checkers complain about the impossible condition here.

In 084681d14e ('printk: flush continuation lines immediately to
console'), we changed msg->level from being a u16 to being an unsigned
3 bit bitfield.  That means we can remove the code here to handle log
levels which are in the tens or hundreds column.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/kernel/printk.c b/kernel/printk.c
index 660ba72..3edc531 100644
--- a/kernel/printk.c
+++ b/kernel/printk.c
@@ -822,15 +822,10 @@ static size_t print_prefix(const struct log *msg, bool syslog, char *buf)
 	size_t len = 0;
 
 	if (syslog) {
-		if (buf) {
+		if (buf)
 			len += sprintf(buf, "<%u>", msg->level);
-		} else {
+		else
 			len += 3;
-			if (msg->level > 9)
-				len++;
-			if (msg->level > 99)
-				len++;
-		}
 	}
 
 	len += print_time(msg->ts_nsec, buf ? buf + len : NULL);
