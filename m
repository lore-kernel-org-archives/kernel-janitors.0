From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Tue, 17 Nov 2020 05:37:03 +0000
Subject: [PATCH] ring-buffer: remove obsolete rb_event_is_commit()
Message-Id: <20201117053703.11275-1-lukas.bulwahn@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Steven Rostedt <rostedt@goodmis.org>, Ingo Molnar <mingo@redhat.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Tom Rix <trix@redhat.com>, Nathan Chancellor <natechancellor@gmail.com>, Nick Desaulniers <ndesaulniers@google.com>, clang-built-linux@googlegroups.com, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Lukas Bulwahn <lukas.bulwahn@gmail.com>

Commit a389d86f7fd0 ("ring-buffer: Have nested events still record running
time stamp") removed the only uses of rb_event_is_commit() in
rb_update_event() and rb_update_write_stamp().

Hence, since then, make CC=clang W=1 warns:

  kernel/trace/ring_buffer.c:2763:1:
    warning: unused function 'rb_event_is_commit' [-Wunused-function]

Remove this obsolete function.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
applies cleanly on current master and next-20201116

Steven, please pick this minor non-urgent clean-up patch.

 kernel/trace/ring_buffer.c | 17 -----------------
 1 file changed, 17 deletions(-)

diff --git a/kernel/trace/ring_buffer.c b/kernel/trace/ring_buffer.c
index ab68f28b8f4b..799d790ab365 100644
--- a/kernel/trace/ring_buffer.c
+++ b/kernel/trace/ring_buffer.c
@@ -2629,9 +2629,6 @@ rb_add_time_stamp(struct ring_buffer_event *event, u64 delta, bool abs)
 	return skip_time_extend(event);
 }
 
-static inline bool rb_event_is_commit(struct ring_buffer_per_cpu *cpu_buffer,
-				     struct ring_buffer_event *event);
-
 #ifndef CONFIG_HAVE_UNSTABLE_SCHED_CLOCK
 static inline bool sched_clock_stable(void)
 {
@@ -2759,20 +2756,6 @@ static unsigned rb_calculate_event_length(unsigned length)
 	return length;
 }
 
-static __always_inline bool
-rb_event_is_commit(struct ring_buffer_per_cpu *cpu_buffer,
-		   struct ring_buffer_event *event)
-{
-	unsigned long addr = (unsigned long)event;
-	unsigned long index;
-
-	index = rb_event_index(event);
-	addr &= PAGE_MASK;
-
-	return cpu_buffer->commit_page->page = (void *)addr &&
-		rb_commit_index(cpu_buffer) = index;
-}
-
 static u64 rb_time_delta(struct ring_buffer_event *event)
 {
 	switch (event->type_len) {
-- 
2.17.1
