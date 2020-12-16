From: Colin King <colin.king@canonical.com>
Date: Wed, 16 Dec 2020 11:40:51 +0000
Subject: [PATCH] tracing: fix spelling mistake in Kconfig "infinit" -> "infinite"
Message-Id: <20201216114051.12056-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Steven Rostedt <rostedt@goodmis.org>, Ingo Molnar <mingo@redhat.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake in the Kconfig help text. Fix it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 kernel/trace/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/trace/Kconfig b/kernel/trace/Kconfig
index d5a19413d4f8..2c22444d5b9b 100644
--- a/kernel/trace/Kconfig
+++ b/kernel/trace/Kconfig
@@ -545,7 +545,7 @@ config KPROBE_EVENTS_ON_NOTRACE
 	  using kprobe events.
 
 	  If kprobes can use ftrace instead of breakpoint, ftrace related
-	  functions are protected from kprobe-events to prevent an infinit
+	  functions are protected from kprobe-events to prevent an infinite
 	  recursion or any unexpected execution path which leads to a kernel
 	  crash.
 
-- 
2.29.2
