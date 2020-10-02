From: Colin King <colin.king@canonical.com>
Date: Fri, 02 Oct 2020 13:25:01 +0000
Subject: [PATCH][V2] selftests/ftrace: check for do_sys_openat2 in user-memory test
Message-Id: <20201002132501.88992-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Steven Rostedt <rostedt@goodmis.org>, Ingo Molnar <mingo@redhat.com>, Shuah Khan <shuah@kernel.org>, Tom Zanussi <zanussi@kernel.org>, Masami Hiramatsu <mhiramat@kernel.org>, linux-kselftest@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

More recent libc implementations are now using openat/openat2 system
calls so also add do_sys_openat2 to the tracing so that the test
passes on these systems because do_sys_open may not be called.

Thanks to Masami Hiramatsu for the help on getting this fix to work
correctly.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---

V2: write myevent2 using >> rather than >, also enable and disable
    myevent2
---
 .../selftests/ftrace/test.d/kprobe/kprobe_args_user.tc        | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tools/testing/selftests/ftrace/test.d/kprobe/kprobe_args_user.tc b/tools/testing/selftests/ftrace/test.d/kprobe/kprobe_args_user.tc
index a30a9c07290d..d25d01a19778 100644
--- a/tools/testing/selftests/ftrace/test.d/kprobe/kprobe_args_user.tc
+++ b/tools/testing/selftests/ftrace/test.d/kprobe/kprobe_args_user.tc
@@ -9,12 +9,16 @@ grep -A10 "fetcharg:" README | grep -q '\[u\]<offset>' || exit_unsupported
 :;: "user-memory access syntax and ustring working on user memory";:
 echo 'p:myevent do_sys_open path=+0($arg2):ustring path2=+u0($arg2):string' \
 	> kprobe_events
+echo 'p:myevent2 do_sys_openat2 path=+0($arg2):ustring path2=+u0($arg2):string' \
+	>> kprobe_events
 
 grep myevent kprobe_events | \
 	grep -q 'path=+0($arg2):ustring path2=+u0($arg2):string'
 echo 1 > events/kprobes/myevent/enable
+echo 1 > events/kprobes/myevent2/enable
 echo > /dev/null
 echo 0 > events/kprobes/myevent/enable
+echo 0 > events/kprobes/myevent2/enable
 
 grep myevent trace | grep -q 'path="/dev/null" path2="/dev/null"'
 
-- 
2.27.0
