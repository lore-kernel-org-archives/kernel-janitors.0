From: Luca Abeni <luca.abeni@santannapisa.it>
Date: Fri, 09 Jun 2017 11:25:47 +0000
Subject: Re: [PATCH][-next] sched/deadline: make new function grub_reclaim static
Message-Id: <20170609132547.42891867@luca>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170609110851.16822-1-colin.king@canonical.com>
In-Reply-To: <20170609110851.16822-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Fri,  9 Jun 2017 12:08:51 +0100
Colin King <colin.king@canonical.com> wrote:

> From: Colin Ian King <colin.king@canonical.com>
> 
> Make function grub_reclaim static to clean up the following sparse
> warning:
> 
> "warning: symbol 'grub_reclaim' was not declared. Should it be static?"
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  kernel/sched/deadline.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/kernel/sched/deadline.c b/kernel/sched/deadline.c
> index e12f85975857..2ddb4e6d820f 100644
> --- a/kernel/sched/deadline.c
> +++ b/kernel/sched/deadline.c
> @@ -1052,7 +1052,7 @@ extern bool sched_rt_bandwidth_account(struct rt_rq *rt_rq);
>   * should be larger than 2^(64 - 20 - 8), which is more than 64 seconds.
>   * So, overflow is not an issue here.
>   */
> -u64 grub_reclaim(u64 delta, struct rq *rq, struct sched_dl_entity *dl_se)
> +static u64 grub_reclaim(u64 delta, struct rq *rq, struct sched_dl_entity *dl_se)
>  {
>  	u64 u_inact = rq->dl.this_bw - rq->dl.running_bw; /* Utot - Uact */
>  	u64 u_act;

Looks good; thanks for fixing this (and sorry for introducing the
warning).

Acked-by: Luca Abeni <luca.abeni@santannapisa.it>



				Luca
