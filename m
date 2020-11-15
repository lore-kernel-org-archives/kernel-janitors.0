From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Sun, 15 Nov 2020 15:53:36 +0000
Subject: [PATCH] tracing: clean up after filter logic rewriting
Message-Id: <20201115155336.20248-1-lukas.bulwahn@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Steven Rostedt <rostedt@goodmis.org>, Ingo Molnar <mingo@redhat.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Tom Rix <trix@redhat.com>, Nathan Chancellor <natechancellor@gmail.com>, Nick Desaulniers <ndesaulniers@google.com>, clang-built-linux@googlegroups.com, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Lukas Bulwahn <lukas.bulwahn@gmail.com>

The functions event_{set,clear,}_no_set_filter_flag were only used in
replace_system_preds() [now, renamed to process_system_preds()].

Commit 80765597bc58 ("tracing: Rewrite filter logic to be simpler and
faster") removed the use of those functions in replace_system_preds().

Since then, the functions event_{set,clear,}_no_set_filter_flag were
unused. Fortunately, make CC=clang W=1 indicates this with
-Wunused-function warnings on those three functions.

So, clean up these obsolete unused functions.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
applies cleanly on current master and next-20201113

Steven, please pick this minor non-urgent clean-up patch.

It possible that there is even more clean up possible, e.g., removing
some values from the whole enum, but I will keep that Steven to decide.

 kernel/trace/trace_events_filter.c | 21 ---------------------
 1 file changed, 21 deletions(-)

diff --git a/kernel/trace/trace_events_filter.c b/kernel/trace/trace_events_filter.c
index 78a678eeb140..c4fb3ffe018f 100644
--- a/kernel/trace/trace_events_filter.c
+++ b/kernel/trace/trace_events_filter.c
@@ -1561,27 +1561,6 @@ static inline void event_clear_filter(struct trace_event_file *file)
 	RCU_INIT_POINTER(file->filter, NULL);
 }
 
-static inline void
-event_set_no_set_filter_flag(struct trace_event_file *file)
-{
-	file->flags |= EVENT_FILE_FL_NO_SET_FILTER;
-}
-
-static inline void
-event_clear_no_set_filter_flag(struct trace_event_file *file)
-{
-	file->flags &= ~EVENT_FILE_FL_NO_SET_FILTER;
-}
-
-static inline bool
-event_no_set_filter_flag(struct trace_event_file *file)
-{
-	if (file->flags & EVENT_FILE_FL_NO_SET_FILTER)
-		return true;
-
-	return false;
-}
-
 struct filter_list {
 	struct list_head	list;
 	struct event_filter	*filter;
-- 
2.17.1
