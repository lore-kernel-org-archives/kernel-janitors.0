From: Yuanhan Liu <yuanhan.liu@intel.com>
Date: Fri, 19 Oct 2012 02:34:30 +0000
Subject: [tip:numa/core 15/20] kernel/sched/fair.c:972:1: warning: no return statement in function returning
Message-Id: <20121019023430.GA25055@yliu-dev.sh.intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Peter,

FYI, there are new compile warnings show up in

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git numa/core
head:   e99e955b90d7aaa4418cace9734e8069921ba440
commit: bb527e7df7bd5f05dca74868f61b7a9a17ee54c1 [15/20] sched/numa: More NUMA_PULL_BIAS fixes
config: x86_64-allyesconfig # make ARCH=x86_64 allyesconfig

All warnings:

kernel/sched/fair.c: In function 'account_numa_enqueue':
kernel/sched/fair.c:972:1: warning: no return statement in function returning non-void [-Wreturn-type]

vim +972 kernel/sched/fair.c

4ae834f7 Peter Zijlstra 2012-07-16  956  
96249815 Peter Zijlstra 2012-10-09  957  		if (!time_before(jiffies, curr->mm->numa_next_scan)) {
4ae834f7 Peter Zijlstra 2012-07-16  958  			/*
4ae834f7 Peter Zijlstra 2012-07-16  959  			 * We can re-use curr->rcu because we checked curr->mm
4ae834f7 Peter Zijlstra 2012-07-16  960  			 * != NULL so release_task()->call_rcu() was not called
4ae834f7 Peter Zijlstra 2012-07-16  961  			 * yet and exit_task_work() is called before
4ae834f7 Peter Zijlstra 2012-07-16  962  			 * exit_notify().
4ae834f7 Peter Zijlstra 2012-07-16  963  			 */
4ae834f7 Peter Zijlstra 2012-07-16  964  			init_task_work(&curr->rcu, task_numa_work);
4ae834f7 Peter Zijlstra 2012-07-16  965  			task_work_add(curr, &curr->rcu, true);
4ae834f7 Peter Zijlstra 2012-07-16  966  		}
4ae834f7 Peter Zijlstra 2012-07-16  967  	}
4ae834f7 Peter Zijlstra 2012-07-16  968  }
4ae834f7 Peter Zijlstra 2012-07-16  969  #else
bb527e7d Peter Zijlstra 2012-10-11  970  static struct list_head *account_numa_enqueue(struct rq *rq, struct task_struct *p)
4ae834f7 Peter Zijlstra 2012-07-16  971  {
4ae834f7 Peter Zijlstra 2012-07-16 @972  }
4ae834f7 Peter Zijlstra 2012-07-16  973  
bb527e7d Peter Zijlstra 2012-10-11  974  static void account_numa_dequeue(struct rq *rq, struct task_struct *p)
4ae834f7 Peter Zijlstra 2012-07-16  975  {
4ae834f7 Peter Zijlstra 2012-07-16  976  }
4ae834f7 Peter Zijlstra 2012-07-16  977  
4ae834f7 Peter Zijlstra 2012-07-16  978  static void task_tick_numa(struct rq *rq, struct task_struct *curr)
4ae834f7 Peter Zijlstra 2012-07-16  979  {
4ae834f7 Peter Zijlstra 2012-07-16  980  }

---
0-DAY kernel build testing backend         Open Source Technology Center
Fengguang Wu, Yuanhan Liu                              Intel Corporation
