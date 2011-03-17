From: Dan Carpenter <error27@gmail.com>
Date: Thu, 17 Mar 2011 11:43:07 +0000
Subject: [patch] genirq: incorrect unlock in __setup_irq()
Message-Id: <20110317114307.GJ2008@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Thomas Gleixner <tglx@linutronix.de>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

goto out_thread is called before we take the lock.  It causes a gcc
warning: "kernel/irq/manage.c:858: warning: ‘flags’ may be used
uninitialized in this function"

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/kernel/irq/manage.c b/kernel/irq/manage.c
index acd599a..cdcdf13 100644
--- a/kernel/irq/manage.c
+++ b/kernel/irq/manage.c
@@ -1065,9 +1065,9 @@ mismatch:
 
 out_mask:
 	free_cpumask_var(mask);
+	raw_spin_unlock_irqrestore(&desc->lock, flags);
 
 out_thread:
-	raw_spin_unlock_irqrestore(&desc->lock, flags);
 	if (new->thread) {
 		struct task_struct *t = new->thread;
 
