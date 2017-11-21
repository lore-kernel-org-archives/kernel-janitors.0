From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 21 Nov 2017 20:10:56 +0000
Subject: [PATCH] selftests: posix_timers: Make signal handling safer
Message-Id: <7ba0d855-8b55-cb38-2740-c2a3495f3083@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 21 Nov 2017 20:56:51 +0100

Use the data type "sig_atomic_t" for the variable "done"
so that it can be safely modified by a signal handler.

Fixes: 0bc4b0cf15708fca04095232c4e448634e94d029 ("selftests: add basic posix timers selftests")

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 tools/testing/selftests/timers/posix_timers.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/timers/posix_timers.c b/tools/testing/selftests/timers/posix_timers.c
index 15cf56d32155..d64732c8b69a 100644
--- a/tools/testing/selftests/timers/posix_timers.c
+++ b/tools/testing/selftests/timers/posix_timers.c
@@ -20,7 +20,7 @@
 #define DELAY 2
 #define USECS_PER_SEC 1000000
 
-static volatile int done;
+static sig_atomic_t done;
 
 /* Busy loop in userspace to elapse ITIMER_VIRTUAL */
 static void user_loop(void)
-- 
2.15.0

