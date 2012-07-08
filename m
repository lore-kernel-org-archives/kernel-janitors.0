From: Fengguang Wu <wfg@linux.intel.com>
Date: Sun, 08 Jul 2012 00:57:07 +0000
Subject: Re: [rcu:fixes.2012.07.06a 12/19] undefined reference to `rcu_is_cpu_idle'
Message-Id: <20120708005707.GA6265@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120707171803.GA24989@localhost>
In-Reply-To: <20120707171803.GA24989@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Sat, Jul 07, 2012 at 02:54:42PM -0700, Paul E. McKenney wrote:
> On Sun, Jul 08, 2012 at 01:18:03AM +0800, wfg@linux.intel.com wrote:
> > Hi Paul,
> > 
> > Kernel build failed on
> > 
> > tree:   git://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-rcu.git fixes.2012.07.06a
> > head:   cfca927972e31a5b3da49bf641c525732ff3c357
> > commit: 62fde6edf12b60fddb13a3f0a779c8be0bb7447e [12/19] rcu: Make __call_rcu() handle invocation from idle
> > config: x86_64-randconfig-tip4 (attached as .config)
> > 
> > 
> > kernel/built-in.o: In function `rcu_read_lock_bh_held': (.text+0x167d1): undefined reference to `rcu_is_cpu_idle'
> > kernel/built-in.o: In function `lockdep_rcu_suspicious': (.text+0x367e8): undefined reference to `rcu_is_cpu_idle'
> > kernel/built-in.o: In function `lockdep_rcu_suspicious': (.text+0x36815): undefined reference to `rcu_is_cpu_idle'
> > kernel/built-in.o: In function `css_get_next': (.text+0x40f5a): undefined reference to `rcu_is_cpu_idle'
> > drivers/built-in.o: In function `dst_link_failure': isdn_net.c:(.text+0x13950a): undefined reference to `rcu_is_cpu_idle'
> > net/built-in.o:sock.c:(.text+0x3cec): more undefined references to `rcu_is_cpu_idle' follow
> > 
> > There are more similar errors in the other randconfigs.
> 
> Hmmm...  So you are building TINY_RCU without CONFIG_DEBUG_LOCK_ALLOC,
> but with some checking enabled.  I -thought- I was testing that...
> 
> But, wait.  You do have CONFIG_DEBUG_LOCK_ALLOC defined.  That really
> should cause rcu_is_cpu_idle() to be compiled into kernel/rcupdate.o.
> And your config builds on my system with no errors.

I can reproduce the errors in a clean build. And I find the root cause to be
the below line in rcutiny.c:

=>     #ifdef CONFIG_PROVE_RCU

        /*
         * Test whether RCU thinks that the current CPU is idle.
         */
        int rcu_is_cpu_idle(void)

         
> Was there perhaps another problem, maybe running out of disk space?

Sometimes it does run out of *memory*, because I aggressively put all
.o files in tmpfs ;)  In which case the make/gcc tasks are killed and
the abnormal situation is detected by grepping for "Terminated" lines
in the build log.

Thanks,
Fengguang
