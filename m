From: "Paul E. McKenney" <paulmck@kernel.org>
Date: Mon, 20 Jul 2020 16:26:45 +0000
Subject: Re: [PATCH][next] refperf: avoid null pointer dereference when buf fails to allocate
Message-Id: <20200720162645.GS9247@paulmck-ThinkPad-P72>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200716143856.1708123-1-colin.king@canonical.com>
In-Reply-To: <20200716143856.1708123-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Josh Triplett <josh@joshtriplett.org>, Steven Rostedt <rostedt@goodmis.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Lai Jiangshan <jiangshanlai@gmail.com>, Joel Fernandes <joel@joelfernandes.org>, rcu@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, Jul 16, 2020 at 03:38:56PM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Currently in the unlikely event that buf fails to be allocated it
> is dereferenced a few times.  Use the errexit flag to determine if
> buf should be written to to avoid the null pointer dereferences.
> 
> Addresses-Coverity: ("Dereference after null check")
> Fixes: f518f154ecef ("refperf: Dynamically allocate experiment-summary output buffer")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Good catch, applied, thank you!

							Thanx, Paul

> ---
>  kernel/rcu/refscale.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/kernel/rcu/refscale.c b/kernel/rcu/refscale.c
> index d9291f883b54..952595c678b3 100644
> --- a/kernel/rcu/refscale.c
> +++ b/kernel/rcu/refscale.c
> @@ -546,9 +546,11 @@ static int main_func(void *arg)
>  	// Print the average of all experiments
>  	SCALEOUT("END OF TEST. Calculating average duration per loop (nanoseconds)...\n");
>  
> -	buf[0] = 0;
> -	strcat(buf, "\n");
> -	strcat(buf, "Runs\tTime(ns)\n");
> +	if (!errexit) {
> +		buf[0] = 0;
> +		strcat(buf, "\n");
> +		strcat(buf, "Runs\tTime(ns)\n");
> +	}
>  
>  	for (exp = 0; exp < nruns; exp++) {
>  		u64 avg;
> -- 
> 2.27.0
> 
