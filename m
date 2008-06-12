From: Vegard Nossum <vegard.nossum@gmail.com>
Date: Thu, 12 Jun 2008 21:07:19 +0000
Subject: [PATCH] kprobes: remove intialization of static per-cpu variable
Message-Id: <20080612210719.GB3283@damson.getinternet.no>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

From: Vegard Nossum <vegard.nossum@gmail.com>
Date: Thu, 12 Jun 2008 22:02:01 +0200
Subject: [PATCH] kprobes: remove intialization of static per-cpu variable

Cc: Masami Hiramatsu <mhiramat@redhat.com>
Signed-off-by: Vegard Nossum <vegard.nossum@gmail.com>
---
 kernel/kprobes.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/kernel/kprobes.c b/kernel/kprobes.c
index 1e0250c..04a0c36 100644
--- a/kernel/kprobes.c
+++ b/kernel/kprobes.c
@@ -70,7 +70,7 @@ static bool kprobe_enabled;
 
 DEFINE_MUTEX(kprobe_mutex);		/* Protects kprobe_table */
 DEFINE_SPINLOCK(kretprobe_lock);	/* Protects kretprobe_inst_table */
-static DEFINE_PER_CPU(struct kprobe *, kprobe_instance) = NULL;
+static DEFINE_PER_CPU(struct kprobe *, kprobe_instance);
 
 /*
  * Normally, functions that we'd want to prohibit kprobes in, are marked
-- 
1.5.4.1

