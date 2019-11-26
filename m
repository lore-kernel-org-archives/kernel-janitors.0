From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 26 Nov 2019 12:19:34 +0000
Subject: [PATCH] Silence an uninitialized variable warning
Message-Id: <20191126121934.kuolgbm55dirfbay@kili.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Ingo Molnar <mingo@redhat.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Smatch complains that "ret" could be uninitialized if we don't enter the
loop.  I don't know if that's possible, but it's nicer to return a
literal zero instead.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 kernel/trace/trace_syscalls.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/trace/trace_syscalls.c b/kernel/trace/trace_syscalls.c
index 73140d80dd46..63528f458826 100644
--- a/kernel/trace/trace_syscalls.c
+++ b/kernel/trace/trace_syscalls.c
@@ -286,7 +286,7 @@ static int __init syscall_enter_define_fields(struct trace_event_call *call)
 		offset += sizeof(unsigned long);
 	}
 
-	return ret;
+	return 0;
 }
 
 static void ftrace_syscall_enter(void *data, struct pt_regs *regs, long id)
-- 
2.11.0
