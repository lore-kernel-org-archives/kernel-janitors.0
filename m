From: "Thomas Hisch" <t.hisch@gmail.com>
Date: Tue, 06 Feb 2007 19:32:29 +0000
Subject: [KJ] signedness of cpu variables
Message-Id: <8ef77f2e0702061132lf8e4a2cj7ae612976029e21b@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

i digged into the kernel source and found a lot of signed int cpu variables.
shouldn't they be replaced by unsigned ints ??

for example everywhere in kernel/cpu.c cpu variables are unsigned except in
check_for_tasks(int cpu). are there any reasons for the signed int parameter
of this  particular function ??

any thoughts ??
is this sth. for the kernel-janitors ?

regards
Thomas Hisch

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
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
