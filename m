From: Peter Zijlstra <peterz@infradead.org>
Date: Mon, 09 Nov 2020 11:21:28 +0000
Subject: Re: [PATCH] futex: Don't enable IRQs unconditionally in put_pi_state()
Message-Id: <20201109112128.GF2594@hirez.programming.kicks-ass.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201106085205.GA1159983@mwanda>
In-Reply-To: <20201106085205.GA1159983@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Darren Hart <dvhart@infradead.org>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Fri, Nov 06, 2020 at 11:52:05AM +0300, Dan Carpenter wrote:
> The exit_pi_state_list() function calls put_pi_state() with IRQs
> disabled and is not expecting that IRQs will be enabled inside the
> function.  Use the _irqsave() so that IRQs are restored to the original
> state instead of enabled unconditionally.
> 
> Fixes: 153fbd1226fb ("futex: Fix more put_pi_state() vs. exit_pi_state_list() races")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> This is from static analysis and not tested.  I am not very familiar
> with futex code.

It it exceedingly rare if at all possible to trigger this, but yes, your
patch is correct.

Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>

> 
>  kernel/futex.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/kernel/futex.c b/kernel/futex.c
> index f8614ef4ff31..ca84745713bc 100644
> --- a/kernel/futex.c
> +++ b/kernel/futex.c
> @@ -788,8 +788,9 @@ static void put_pi_state(struct futex_pi_state *pi_state)
>  	 */
>  	if (pi_state->owner) {
>  		struct task_struct *owner;
> +		unsigned long flags;
>  
> -		raw_spin_lock_irq(&pi_state->pi_mutex.wait_lock);
> +		raw_spin_lock_irqsave(&pi_state->pi_mutex.wait_lock, flags);
>  		owner = pi_state->owner;
>  		if (owner) {
>  			raw_spin_lock(&owner->pi_lock);
> @@ -797,7 +798,7 @@ static void put_pi_state(struct futex_pi_state *pi_state)
>  			raw_spin_unlock(&owner->pi_lock);
>  		}
>  		rt_mutex_proxy_unlock(&pi_state->pi_mutex, owner);
> -		raw_spin_unlock_irq(&pi_state->pi_mutex.wait_lock);
> +		raw_spin_unlock_irqrestore(&pi_state->pi_mutex.wait_lock, flags);
>  	}
>  
>  	if (current->pi_state_cache) {
> -- 
> 2.28.0
> 
