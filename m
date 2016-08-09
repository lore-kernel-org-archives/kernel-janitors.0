From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Tue, 09 Aug 2016 10:11:26 +0000
Subject: [PATCH] selftests/timers: Add missing error code assignment before test
Message-Id: <1470737486-5924-1-git-send-email-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: john.stultz@linaro.org, tglx@linutronix.de, shuahkh@osg.samsung.com
Cc: linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

In order to work, the 'err' return value has to be updated otherwise the
test can never be true.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 tools/testing/selftests/timers/posix_timers.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/timers/posix_timers.c b/tools/testing/selftests/timers/posix_timers.c
index 5a246a0..15cf56d 100644
--- a/tools/testing/selftests/timers/posix_timers.c
+++ b/tools/testing/selftests/timers/posix_timers.c
@@ -122,7 +122,7 @@ static int check_itimer(int which)
 	else if (which = ITIMER_REAL)
 		idle_loop();
 
-	gettimeofday(&end, NULL);
+	err = gettimeofday(&end, NULL);
 	if (err < 0) {
 		perror("Can't call gettimeofday()\n");
 		return -1;
@@ -175,7 +175,7 @@ static int check_timer_create(int which)
 
 	user_loop();
 
-	gettimeofday(&end, NULL);
+	err = gettimeofday(&end, NULL);
 	if (err < 0) {
 		perror("Can't call gettimeofday()\n");
 		return -1;
-- 
2.7.4


---
L'absence de virus dans ce courrier électronique a été vérifiée par le logiciel antivirus Avast.
https://www.avast.com/antivirus

