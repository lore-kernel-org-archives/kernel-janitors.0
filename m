From: Colin King <colin.king@canonical.com>
Date: Fri, 15 Nov 2019 09:03:56 +0000
Subject: [PATCH][next] ftrace/selftests: fix spelling mistake "wakeing" -> "waking"
Message-Id: <20191115090356.39572-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Steven Rostedt <rostedt@goodmis.org>, Ingo Molnar <mingo@redhat.com>, Shuah Khan <shuah@kernel.org>, linux-kselftest@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There are a few identical spelling mistakes, fix these.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 tools/testing/selftests/ftrace/test.d/direct/ftrace-direct.tc | 2 +-
 tools/testing/selftests/ftrace/test.d/direct/kprobe-direct.tc | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/ftrace/test.d/direct/ftrace-direct.tc b/tools/testing/selftests/ftrace/test.d/direct/ftrace-direct.tc
index cbc7a30c2e0f..d75a8695bc21 100644
--- a/tools/testing/selftests/ftrace/test.d/direct/ftrace-direct.tc
+++ b/tools/testing/selftests/ftrace/test.d/direct/ftrace-direct.tc
@@ -11,7 +11,7 @@ fi
 echo "Let the module run a little"
 sleep 1
 
-grep -q "my_direct_func: wakeing up" trace
+grep -q "my_direct_func: waking up" trace
 
 rmmod ftrace-direct
 
diff --git a/tools/testing/selftests/ftrace/test.d/direct/kprobe-direct.tc b/tools/testing/selftests/ftrace/test.d/direct/kprobe-direct.tc
index 017a7409b103..801ecb63e84c 100644
--- a/tools/testing/selftests/ftrace/test.d/direct/kprobe-direct.tc
+++ b/tools/testing/selftests/ftrace/test.d/direct/kprobe-direct.tc
@@ -16,7 +16,7 @@ fi
 echo "Let the module run a little"
 sleep 1
 
-grep -q "my_direct_func: wakeing up" trace
+grep -q "my_direct_func: waking up" trace
 
 rmmod ftrace-direct
 
@@ -26,7 +26,7 @@ start_direct() {
 	echo > trace
 	modprobe ftrace-direct
 	sleep 1
-	grep -q "my_direct_func: wakeing up" trace
+	grep -q "my_direct_func: waking up" trace
 }
 
 stop_direct() {
-- 
2.20.1
