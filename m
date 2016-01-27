From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 27 Jan 2016 20:24:22 +0000
Subject: re: perf: Fix perf_event_exit_task() race
Message-Id: <20160127202422.GA7045@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Peter Zijlstra,

The patch 63b6da39bb38: "perf: Fix perf_event_exit_task() race" from
Jan 14, 2016, leads to the following static checker warning:

	kernel/events/core.c:1235 perf_lock_task_context()
	error: potential NULL dereference 'ctx'.

kernel/events/core.c
  1209          ctx = rcu_dereference(task->perf_event_ctxp[ctxn]);
  1210          if (ctx) {
  1211                  /*
  1212                   * If this context is a clone of another, it might
  1213                   * get swapped for another underneath us by
  1214                   * perf_event_task_sched_out, though the
  1215                   * rcu_read_lock() protects us from any context
  1216                   * getting freed.  Lock the context and check if it
  1217                   * got swapped before we could get the lock, and retry
  1218                   * if so.  If we locked the right context, then it
  1219                   * can't get swapped on us any more.
  1220                   */
  1221                  raw_spin_lock(&ctx->lock);
  1222                  if (ctx != rcu_dereference(task->perf_event_ctxp[ctxn])) {
  1223                          raw_spin_unlock(&ctx->lock);
  1224                          rcu_read_unlock();
  1225                          local_irq_restore(*flags);
  1226                          goto retry;
  1227                  }
  1228  
  1229                  if (ctx->task = TASK_TOMBSTONE ||
  1230                      !atomic_inc_not_zero(&ctx->refcount)) {
  1231                          raw_spin_unlock(&ctx->lock);
  1232                          ctx = NULL;
                                ^^^^^^^^^^
ctx is NULL.

  1233                  }
  1234  
  1235                  WARN_ON_ONCE(ctx->task != task);
                                     ^^^^^^^^^^^^^^^^^
The patch adds a NULL dereference.

  1236          }
  1237          rcu_read_unlock();
  1238          if (!ctx)
  1239                  local_irq_restore(*flags);
  1240          return ctx;
  1241  }

regards,
dan carpenter
