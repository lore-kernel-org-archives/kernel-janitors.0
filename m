From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 20 Dec 2015 08:19:20 +0000
Subject: [PATCH] posix-clock: Use an unsigned data type for a variable
Message-Id: <56766488.9050402@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LKML <linux-kernel@vger.kernel.org>, Richard Cochran <richardcochran@gmail.com>
Cc: kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 20 Dec 2015 09:09:34 +0100

The data type "int" was used by the variable "result" in the
function "posix_clock_poll" even though the type "uint" will usually
be needed for the return value from a call of the function which was
assigned to the pointer "poll" of the variable "clk".
Reuse the type from this poll call instead.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 kernel/time/posix-clock.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/time/posix-clock.c b/kernel/time/posix-clock.c
index ce033c7..ac0b733 100644
--- a/kernel/time/posix-clock.c
+++ b/kernel/time/posix-clock.c
@@ -69,7 +69,7 @@ static ssize_t posix_clock_read(struct file *fp, char __user *buf,
 static unsigned int posix_clock_poll(struct file *fp, poll_table *wait)
 {
 	struct posix_clock *clk = get_posix_clock(fp);
-	int result = 0;
+	uint result = 0;
 
 	if (!clk)
 		return -ENODEV;
-- 
2.6.3

