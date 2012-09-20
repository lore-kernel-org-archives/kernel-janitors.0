From: Fengguang Wu <fengguang.wu@intel.com>
Date: Thu, 20 Sep 2012 21:24:47 +0000
Subject: [rcu:rcu/next 5/78] kernel/rcutree.c:1131:41: error: 'flags' undeclared
Message-Id: <20120920212447.GB5446@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Paul,

FYI, kernel build failed on

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-rcu.git rcu/next
head:   d58ab773ab8bc98c81c7d49c04bc88b6e7968385
commit: 552116942862340a4a0577cbac194ddc6185e4cb [5/78] rcu: Move RCU grace-period cleanup into kthread
config: x86_64-allmodconfig

All related error/warning messages:

kernel/rcutree.c: In function 'rcu_gp_kthread':
kernel/rcutree.c:1131:41: error: 'flags' undeclared (first use in this function)
kernel/rcutree.c:1131:41: note: each undeclared identifier is reported only once for each function it appears in
kernel/rcutree.c:1131:74: warning: comparison of distinct pointer types lacks a cast [enabled by default]
kernel/rcutree.c:1176:74: warning: comparison of distinct pointer types lacks a cast [enabled by default]

vim +1131 kernel/rcutree.c
  1125				if (!ACCESS_ONCE(rnp->qsmask) &&
  1126				    !rcu_preempt_blocked_readers_cgp(rnp))
  1127					break;
  1128				flush_signals(current);
  1129			}
  1130	
> 1131			raw_spin_lock_irqsave(&rnp->lock, flags);
  1132			gp_duration = jiffies - rsp->gp_start;
  1133			if (gp_duration > rsp->gp_max)
  1134				rsp->gp_max = gp_duration;

---
0-DAY kernel build testing backend         Open Source Technology Centre
Fengguang Wu, Yuanhan Liu                              Intel Corporation
