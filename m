From: Dan Carpenter <error27@gmail.com>
Date: Sat, 10 Jul 2010 10:06:44 +0000
Subject: [patch] trace: strlen() return doesn't account for the NULL
Message-Id: <20100710100644.GV19184@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Frederic Weisbecker <fweisbec@gmail.com>, Ingo Molnar <mingo@redhat.com>, Li Zefan <lizf@cn.fujitsu.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

We need to add one to the strlen() return because of the NULL
character.  The type->name here generally comes from the kernel and I
don't think any of them come close to being MAX_TRACER_SIZE (100)
characters long so this is basically a cleanup.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/kernel/trace/trace.c b/kernel/trace/trace.c
index 086d363..5f13c35 100644
--- a/kernel/trace/trace.c
+++ b/kernel/trace/trace.c
@@ -729,7 +729,7 @@ __acquires(kernel_lock)
 		return -1;
 	}
 
-	if (strlen(type->name) > MAX_TRACER_SIZE) {
+	if (strlen(type->name) >= MAX_TRACER_SIZE) {
 		pr_info("Tracer has a name longer than %d\n", MAX_TRACER_SIZE);
 		return -1;
 	}
