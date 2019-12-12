From: "Paul E. McKenney" <paulmck@kernel.org>
Date: Thu, 12 Dec 2019 18:07:39 +0000
Subject: Re: [PATCH][next] rcu: fix spelling mistake "leval" -> "level"
Message-Id: <20191212180739.GZ2889@paulmck-ThinkPad-P72>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191212173643.91135-1-colin.king@canonical.com>
In-Reply-To: <20191212173643.91135-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Josh Triplett <josh@joshtriplett.org>, Steven Rostedt <rostedt@goodmis.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Lai Jiangshan <jiangshanlai@gmail.com>, Joel Fernandes <joel@joelfernandes.org>, rcu@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, Dec 12, 2019 at 05:36:43PM +0000, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> There is a spelling mistake in a pr_info message. Fix it.
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Good catch!  Queued, thank you!

							Thanx, Paul

> ---
>  kernel/rcu/tree_plugin.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/kernel/rcu/tree_plugin.h b/kernel/rcu/tree_plugin.h
> index 4d4637c361b7..0765784012f8 100644
> --- a/kernel/rcu/tree_plugin.h
> +++ b/kernel/rcu/tree_plugin.h
> @@ -57,7 +57,7 @@ static void __init rcu_bootup_announce_oddness(void)
>  	if (qlowmark != DEFAULT_RCU_QLOMARK)
>  		pr_info("\tBoot-time adjustment of callback low-water mark to %ld.\n", qlowmark);
>  	if (qovld != DEFAULT_RCU_QOVLD)
> -		pr_info("\tBoot-time adjustment of callback overload leval to %ld.\n", qovld);
> +		pr_info("\tBoot-time adjustment of callback overload level to %ld.\n", qovld);
>  	if (jiffies_till_first_fqs != ULONG_MAX)
>  		pr_info("\tBoot-time adjustment of first FQS scan delay to %ld jiffies.\n", jiffies_till_first_fqs);
>  	if (jiffies_till_next_fqs != ULONG_MAX)
> -- 
> 2.24.0
> 
