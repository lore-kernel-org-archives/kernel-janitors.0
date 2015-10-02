From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 02 Oct 2015 15:14:22 +0000
Subject: [patch] drm/i915: unlock on error in i915_ppgtt_info()
Message-Id: <20151002151422.GA6049@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Daniel Vetter <daniel.vetter@intel.com>, Geliang Tang <geliangtang@163.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>, David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org

We need to call intel_runtime_pm_put() and mutex_unlock() before
returning.

Fixes: 7cb5dff8d59d ('drm/i915: fix task reference leak in i915_debugfs.c')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/gpu/drm/i915/i915_debugfs.c b/drivers/gpu/drm/i915/i915_debugfs.c
index afa7982..dcc50f3 100644
--- a/drivers/gpu/drm/i915/i915_debugfs.c
+++ b/drivers/gpu/drm/i915/i915_debugfs.c
@@ -2294,18 +2294,21 @@ static int i915_ppgtt_info(struct seq_file *m, void *data)
 		struct task_struct *task;
 
 		task = get_pid_task(file->pid, PIDTYPE_PID);
-		if (!task)
-			return -ESRCH;
+		if (!task) {
+			ret = -ESRCH;
+			goto out_put;
+		}
 		seq_printf(m, "\nproc: %s\n", task->comm);
 		put_task_struct(task);
 		idr_for_each(&file_priv->context_idr, per_file_ctx,
 			     (void *)(unsigned long)m);
 	}
 
+out_put:
 	intel_runtime_pm_put(dev_priv);
 	mutex_unlock(&dev->struct_mutex);
 
-	return 0;
+	return ret;
 }
 
 static int count_irq_waiters(struct drm_i915_private *i915)
