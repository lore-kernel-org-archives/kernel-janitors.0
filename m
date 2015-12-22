From: Richard Cochran <richardcochran@gmail.com>
Date: Tue, 22 Dec 2015 21:19:58 +0000
Subject: [PATCH] posix-clock: fix return code on the poll method's error path
Message-Id: <1450819198-17420-1-git-send-email-richardcochran@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <56766488.9050402@users.sourceforge.net>
In-Reply-To: <56766488.9050402@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: John Stultz <john.stultz@linaro.org>, Julia Lawall <julia.lawall@lip6.fr>, Markus Elfring <elfring@users.sourceforge.net>, Thomas Gleixner <tglx@linutronix.de>, kernel-janitors@vger.kernel.org

The posix_clock_poll function is supposed to return a bit mask of
POLLxxx values.  However, in case the hardware has disappeared (due to
hot plugging for example) this code returns -ENODEV in a futile
attempt to throw an error at the file descriptor level.  The kernel's
file_operations interface does not accept such error codes from the
poll method.  Instead, this function aught to return POLLERR.

The value -ENODEV does, in fact, contain the POLLERR bit (and almost
all the other POLLxxx bits as well), but only by chance.  This patch
fixes code to return a proper bit mask.

Credit goes to Markus Elfring for pointing out the suspicious
signed/unsigned mismatch.

Signed-off-by: Richard Cochran <richardcochran@gmail.com>
---
 kernel/time/posix-clock.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/time/posix-clock.c b/kernel/time/posix-clock.c
index ce033c7..9cff0ab 100644
--- a/kernel/time/posix-clock.c
+++ b/kernel/time/posix-clock.c
@@ -69,10 +69,10 @@ static ssize_t posix_clock_read(struct file *fp, char __user *buf,
 static unsigned int posix_clock_poll(struct file *fp, poll_table *wait)
 {
 	struct posix_clock *clk = get_posix_clock(fp);
-	int result = 0;
+	unsigned int result = 0;
 
 	if (!clk)
-		return -ENODEV;
+		return POLLERR;
 
 	if (clk->ops.poll)
 		result = clk->ops.poll(clk, fp, wait);
-- 
2.1.4

