From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Date: Sun, 08 Jul 2012 09:27:46 +0000
Subject: Re: [rcu:fixes.2012.07.06a 12/19] undefined reference to `rcu_is_cpu_idle'
Message-Id: <20120708092746.GD2522@linux.vnet.ibm.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120707171803.GA24989@localhost>
In-Reply-To: <20120707171803.GA24989@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Sun, Jul 08, 2012 at 11:57:52AM +0300, Dan Carpenter wrote:
> I don't know that the wfg@linux.intel.com email address works.
> 
> I added it it in the last thread an Fengguang said it only failed
> because of a fluke.  I insisted that it still wasn't working.  But
> I see now that Fengguang removed the working email address from
> the list so my reply never got through.
> 
> Fengguang please leave your working email address on the CC list.

I forwarded my response to him.  Summary: Fixed by d7118175 in -next,
-tip, and -rcu.

							Thanx, Paul

> regards,
> dan carpenter
> 
> On Sat, Jul 07, 2012 at 02:54:42PM -0700, Paul E. McKenney wrote:
> > On Sun, Jul 08, 2012 at 01:18:03AM +0800, wfg@linux.intel.com wrote:
> > > Hi Paul,
> > > 
> > > Kernel build failed on
> > > 
> > > tree:   git://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-rcu.git fixes.2012.07.06a
> > > head:   cfca927972e31a5b3da49bf641c525732ff3c357
> > > commit: 62fde6edf12b60fddb13a3f0a779c8be0bb7447e [12/19] rcu: Make __call_rcu() handle invocation from idle
> > > config: x86_64-randconfig-tip4 (attached as .config)
> > > 
> > > 
> > > kernel/built-in.o: In function `rcu_read_lock_bh_held': (.text+0x167d1): undefined reference to `rcu_is_cpu_idle'
> > > kernel/built-in.o: In function `lockdep_rcu_suspicious': (.text+0x367e8): undefined reference to `rcu_is_cpu_idle'
> > > kernel/built-in.o: In function `lockdep_rcu_suspicious': (.text+0x36815): undefined reference to `rcu_is_cpu_idle'
> > > kernel/built-in.o: In function `css_get_next': (.text+0x40f5a): undefined reference to `rcu_is_cpu_idle'
> > > drivers/built-in.o: In function `dst_link_failure': isdn_net.c:(.text+0x13950a): undefined reference to `rcu_is_cpu_idle'
> > > net/built-in.o:sock.c:(.text+0x3cec): more undefined references to `rcu_is_cpu_idle' follow
> > > 
> > > There are more similar errors in the other randconfigs.
> > 
> > Hmmm...  So you are building TINY_RCU without CONFIG_DEBUG_LOCK_ALLOC,
> > but with some checking enabled.  I -thought- I was testing that...
> > 
> > But, wait.  You do have CONFIG_DEBUG_LOCK_ALLOC defined.  That really
> > should cause rcu_is_cpu_idle() to be compiled into kernel/rcupdate.o.
> > And your config builds on my system with no errors.
> > 
> > Was there perhaps another problem, maybe running out of disk space?
> > 
> > 							Thanx, Paul
> > 
> > --
> > To unsubscribe from this list: send the line "unsubscribe kernel-janitors" in
> > the body of a message to majordomo@vger.kernel.org
> > More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 

