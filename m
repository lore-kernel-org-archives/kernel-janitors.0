From: Thomas Hisch <t.hisch@gmail.com>
Date: Wed, 07 Feb 2007 10:27:09 +0000
Subject: [KJ] [PATCH] change type of cpu variable to unsigned int
Message-Id: <20070207102709.GA3312@unknown-00-0d-60-79-ca-00.lan>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


change type of cpu variable to unsigned int, as a signed 
cpu variable in this case would not make sense.

Signed-off-by: Thomas Hisch <t.hisch@gmail.com>
---
  
 kernel/cpu.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/kernel/cpu.c b/kernel/cpu.c
index 7406fe6..b0d4fbd 100644
--- a/kernel/cpu.c
+++ b/kernel/cpu.c
@@ -87,7 +87,7 @@ void unregister_cpu_notifier(struct notifier_block *nb)
 }
 EXPORT_SYMBOL(unregister_cpu_notifier);
 
-static inline void check_for_tasks(int cpu)
+static inline void check_for_tasks(unsigned int cpu)
 {
 	struct task_struct *p;
 
-- 
1.5.0.rc3.22.g5057

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
