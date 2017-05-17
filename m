From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Date: Wed, 17 May 2017 20:21:48 +0000
Subject: Re: rcu: Call mod_timer() correctly in wake_nocb_leader_defer()
Message-Id: <20170517202148.GK3956@linux.vnet.ibm.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170517194446.yz42z4wwrplbngxn@mwanda>
In-Reply-To: <20170517194446.yz42z4wwrplbngxn@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Wed, May 17, 2017 at 10:44:46PM +0300, Dan Carpenter wrote:
> Smatch complains that:
> 
> 	kernel/rcu/tree_plugin.h:1838 wake_nocb_leader_defer()
> 	warn: mod_timer() takes an absolute time not an offset.
> 
> which is true.
> 
> Fixes: ebf7068a4396 ("rcu: Use timer as backstop for NOCB deferred wakeups")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Good catch, and color me slow and stupid!!!

I will fold this into the original commit with the following attribution:

[ paulmck: Dan Williams fix for mod_timer() bug detected by smatch. ]

Does that work for you?

							Thanx, Paul

PS.  This likely fixes the bug that causes about one temporary
     grace-period stall every 20 hours of rcutorture testing on the
     TREE01 test scenario.  I finally bisected to it, but it would take
     me through the weekend to accumulate statistical confidence in
     my bisection.  So it will take me some time to establish
     statistcal confidence in this fix, but hey, a fix!!!  ;-)

     Thank you!!!

> diff --git a/kernel/rcu/tree_plugin.h b/kernel/rcu/tree_plugin.h
> index 34dbd0aad732..74492f20c252 100644
> --- a/kernel/rcu/tree_plugin.h
> +++ b/kernel/rcu/tree_plugin.h
> @@ -1835,7 +1835,7 @@ static void wake_nocb_leader_defer(struct rcu_data *rdp, int waketype,
>  	trace_rcu_nocb_wake(rdp->rsp->name, rdp->cpu, reason);
>  	raw_spin_unlock_irqrestore(&rdp->nocb_lock, flags);
>  	if (needtimer)
> -		mod_timer(&rdp->nocb_timer, 1);
> +		mod_timer(&rdp->nocb_timer, jiffies + 1);
>  }
> 
>  /*
> 

