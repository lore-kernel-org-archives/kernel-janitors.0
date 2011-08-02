From: KOSAKI Motohiro <kosaki.motohiro@jp.fujitsu.com>
Date: Tue, 02 Aug 2011 10:55:13 +0000
Subject: Re: [PATCH 7/11] arch/m32r/kernel/smp.c: trivial: use BUG_ON
Message-Id: <4E37D791.5070804@jp.fujitsu.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1312281304-11847-1-git-send-email-julia@diku.dk> <1312281304-11847-8-git-send-email-julia@diku.dk>
In-Reply-To: <1312281304-11847-8-git-send-email-julia@diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: julia@diku.dk
Cc: takata@linux-m32r.org, trivial@kernel.org, kernel-janitors@vger.kernel.org, akpm@linux-foundation.org, benh@kernel.crashing.org, jesper.nilsson@axis.com, cmetcalf@tilera.com, linux-m32r@ml.linux-m32r.org, linux-m32r-ja@ml.linux-m32r.org, linux-kernel@vger.kernel.org

(2011/08/02 19:35), Julia Lawall wrote:
> From: Julia Lawall <julia@diku.dk>
> 
> Use BUG_ON(x) rather than if(x) BUG();
> 
> The semantic patch that fixes this problem is as follows:
> (http://coccinelle.lip6.fr/)
> 
> // <smpl>
> @@ identifier x; @@
> -if (x) BUG();
> +BUG_ON(x);
> 
> @@ identifier x; @@
> -if (!x) BUG();
> +BUG_ON(!x);
> // </smpl>
> 
> Signed-off-by: Julia Lawall <julia@diku.dk>

Indeed.
 Reviewed-by: KOSAKI Motohiro <kosaki.motohiro@jp.fujitsu.com>


> 
> ---
>  arch/m32r/kernel/smp.c |    3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff -u -p a/arch/m32r/kernel/smp.c b/arch/m32r/kernel/smp.c
> --- a/arch/m32r/kernel/smp.c
> +++ b/arch/m32r/kernel/smp.c
> @@ -327,8 +327,7 @@ void smp_flush_tlb_page(struct vm_area_s
>  	cpumask_clear_cpu(cpu_id, &cpu_mask);
>  
>  #ifdef DEBUG_SMP
> -	if (!mm)
> -		BUG();
> +	BUG_ON(!mm);
>  #endif
>  
>  	if (*mmc != NO_CONTEXT) {
> 
> 
> 


