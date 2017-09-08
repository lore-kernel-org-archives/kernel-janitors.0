From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 08 Sep 2017 10:43:51 +0000
Subject: [PATCH] tsacct: Fix a truncation bug in taskstats
Message-Id: <20170908104351.wjjw4mfkcvmtq5dx@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ingo Molnar <mingo@kernel.org>
Cc: Frederic Weisbecker <fweisbec@gmail.com>, Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

The KB_MASK is used to hide the low bits which prevent an information
leak about keyboard timing etc.  The problem is that it's a 32 bit mask
instead of 64 bits so it zeroes out the high 32 bits as well.

Fixes: 58c3c3aa01b4 ("Make taskstats round statistics down to nearest 1k bytes/events")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/kernel/tsacct.c b/kernel/tsacct.c
index 370724b45391..ea9375c94126 100644
--- a/kernel/tsacct.c
+++ b/kernel/tsacct.c
@@ -87,7 +87,7 @@ void bacct_add_tsk(struct user_namespace *user_ns,
 
 #define KB 1024
 #define MB (1024*KB)
-#define KB_MASK (~(KB-1))
+#define KB_MASK (~((u64)KB-1))
 /*
  * fill in extended accounting fields
  */
