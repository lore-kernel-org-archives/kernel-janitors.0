From: Fengguang Wu <wfg@linux.intel.com>
Date: Sun, 08 Jul 2012 14:28:52 +0000
Subject: Re: [rcu:fixes.2012.07.06a 12/19] undefined reference to `rcu_is_cpu_idle'
Message-Id: <20120708142852.GA18355@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120707171803.GA24989@localhost>
In-Reply-To: <20120707171803.GA24989@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Sun, Jul 08, 2012 at 07:23:07AM -0700, Paul E. McKenney wrote:
> On Sun, Jul 08, 2012 at 07:47:30PM +0800, Fengguang Wu wrote:
> > On Sun, Jul 08, 2012 at 12:09:08AM -0700, Paul E. McKenney wrote:
> > > On Sun, Jul 08, 2012 at 08:57:07AM +0800, Fengguang Wu wrote:
> > > > On Sat, Jul 07, 2012 at 02:54:42PM -0700, Paul E. McKenney wrote:
> > > > > On Sun, Jul 08, 2012 at 01:18:03AM +0800, wfg@linux.intel.com wrote:
> > > > > > Hi Paul,
> > > > > > 
> > > > > > Kernel build failed on
> > > > > > 
> > > > > > tree:   git://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-rcu.git fixes.2012.07.06a
> > > > > > head:   cfca927972e31a5b3da49bf641c525732ff3c357
> > > > > > commit: 62fde6edf12b60fddb13a3f0a779c8be0bb7447e [12/19] rcu: Make __call_rcu() handle invocation from idle
> > > > > > config: x86_64-randconfig-tip4 (attached as .config)
> > > > > > 
> > > > > > 
> > > > > > kernel/built-in.o: In function `rcu_read_lock_bh_held': (.text+0x167d1): undefined reference to `rcu_is_cpu_idle'
> > > > > > kernel/built-in.o: In function `lockdep_rcu_suspicious': (.text+0x367e8): undefined reference to `rcu_is_cpu_idle'
> > > > > > kernel/built-in.o: In function `lockdep_rcu_suspicious': (.text+0x36815): undefined reference to `rcu_is_cpu_idle'
> > > > > > kernel/built-in.o: In function `css_get_next': (.text+0x40f5a): undefined reference to `rcu_is_cpu_idle'
> > > > > > drivers/built-in.o: In function `dst_link_failure': isdn_net.c:(.text+0x13950a): undefined reference to `rcu_is_cpu_idle'
> > > > > > net/built-in.o:sock.c:(.text+0x3cec): more undefined references to `rcu_is_cpu_idle' follow
> > > > > > 
> > > > > > There are more similar errors in the other randconfigs.
> > > > > 
> > > > > Hmmm...  So you are building TINY_RCU without CONFIG_DEBUG_LOCK_ALLOC,
> > > > > but with some checking enabled.  I -thought- I was testing that...
> > > > > 
> > > > > But, wait.  You do have CONFIG_DEBUG_LOCK_ALLOC defined.  That really
> > > > > should cause rcu_is_cpu_idle() to be compiled into kernel/rcupdate.o.
> > > > > And your config builds on my system with no errors.
> > > > 
> > > > I can reproduce the errors in a clean build. And I find the root cause to be
> > > > the below line in rcutiny.c:
> > > > 
> > > > =>     #ifdef CONFIG_PROVE_RCU
> > > > 
> > > >         /*
> > > >          * Test whether RCU thinks that the current CPU is idle.
> > > >          */
> > > >         int rcu_is_cpu_idle(void)
> > > 
> > > Ah!  Fixed by d7118175 in -next, -tip, and -rcu.  The bug was introduced
> > > by 9b2e4f1880 in v3.3, but apparently the commit you found was the one
> > > that actually exposed the bug.
> > > 
> > > What error were you bisecting for?
> > 
> > It's probably a different error..
> > 
> > When you say "builds on my system w/o errors", you are talking about
> > the git head of this branch?  That's true: the bug is introduced in
> > commit 62fde6e and then fixed by d711817:
> 
> Check the patch.  The bug was introduced by 9b2e4f1880, which used
> CONFIG_PROVE_RCU rather than the correct CONFIG_DEBUG_LOCK_ALLOC.
> Commit 62fde6e exposed the bug.

Ah OK. It's not the first time to see some commit to expose the bug in
another commit..

> >                 $ git log --oneline rcu/fixes.2012.07.06a 
> >                 cfca927 rcu: Introduce check for callback list/count mismatch
> >                 cf01537 rcu: Add check for CPUs going offline with callbacks queued
> >                 95f0c1d rcu: Disable preemption in rcu_blocking_is_gp()
> >                 1c17e4d rcu: Prevent uninitialized string in RCU CPU stall info
> > fixed   =>     d711817 rcu: Fix rcu_is_cpu_idle() #ifdef in TINY_RCU
> >                 29154c5 rcu: Split RCU core processing out of __call_rcu()
> >                 a16b7a6 rcu: Prevent __call_rcu() from invoking RCU core on offline CPUs
> > error   =>     62fde6e rcu: Make __call_rcu() handle invocation from idle
> >                 28f5c69 rcu: Remove function versions of __kfree_rcu and __is_kfree_rcu_offset
> >                 2a3fa84 rcu: Consolidate tree/tiny __rcu_read_{,un}lock() implementations
> >                 e9023c4 rcu: Remove return value from rcu_assign_pointer()
> >                 e5c1f44 key: Remove extraneous parentheses from rcu_assign_keypointer()
> >                 d1b88eb rcu: Remove return value from RCU_INIT_POINTER()
> >                 d36cc70 rcu: Use new RCU_POINTER_INITIALIZER for gcc-style initializations
> >                 172708d rcu: Add a gcc-style structure initializer for RCU pointers
> >                 1d1fb39 rcu: Add ACCESS_ONCE() to ->qlen accesses
> >                 3f5d3ea rcu: Consolidate duplicate callback-list initialization
> >                 285fe29 rcu: Fix detection of abruptly-ending stall
> >                 cba6d0d Revert "rcu: Move PREEMPT_RCU preemption to switch_to() invocation"
> >                 6887a41 Linux 3.5-rc5
> > 
> > The bad commit 62fde6e is actually committed on Jul 2, so it obviously
> > presents some new work:
> > 
> >         commit 62fde6edf12b60fddb13a3f0a779c8be0bb7447e
> >         Author:     Paul E. McKenney <paul.mckenney@linaro.org>
> >         AuthorDate: Tue May 22 22:10:24 2012 -0700
> >         Commit:     Paul E. McKenney <paulmck@linux.vnet.ibm.com>
> > =>     CommitDate: Mon Jul 2 12:34:24 2012 -0700
> > 
> >             rcu: Make __call_rcu() handle invocation from idle
> 
> I agree that it would have been better if I had ordered d711817
> before 62fde6e, but both commits are already in -tip.  :-(

Never mind, the impacted range is limited :)

Thanks,
Fengguang
