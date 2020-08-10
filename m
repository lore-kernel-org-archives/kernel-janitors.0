From: Colin King <colin.king@canonical.com>
Date: Mon, 10 Aug 2020 10:07:50 +0000
Subject: [PATCH] ktest.pl: fix spelling mistake "Cant" -> "Can't"
Message-Id: <20200810100750.61475-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Steven Rostedt <rostedt@goodmis.org>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake in an error message. Fix it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 tools/testing/ktest/ktest.pl | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/ktest/ktest.pl b/tools/testing/ktest/ktest.pl
index 917810fa4c85..0817464fa363 100755
--- a/tools/testing/ktest/ktest.pl
+++ b/tools/testing/ktest/ktest.pl
@@ -1540,7 +1540,7 @@ sub create_pty {
     my $TIOCGPTN = 0x80045430;
 
     sysopen($ptm, "/dev/ptmx", O_RDWR | O_NONBLOCK) or
-	dodie "Cant open /dev/ptmx";
+	dodie "Can't open /dev/ptmx";
 
     # unlockpt()
     $tmp = pack("i", 0);
-- 
2.27.0
