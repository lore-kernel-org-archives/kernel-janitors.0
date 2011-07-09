From: Greg Dietsche <gregory.dietsche@cuw.edu>
Date: Sat, 09 Jul 2011 15:29:47 +0000
Subject: Re: [PATCH] frv: remove unnecessary code
Message-Id: <20110709152947.GD12581@farmergreg.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1308242660-29054-1-git-send-email-Gregory.Dietsche@cuw.edu>
In-Reply-To: <1308242660-29054-1-git-send-email-Gregory.Dietsche@cuw.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Thu, Jun 16, 2011 at 11:44:20AM -0500, Greg Dietsche wrote:
> remove unnecessary code that matches this coccinelle pattern
> 	if (...)
> 		return ret;
> 	return ret;
> 
> Signed-off-by: Greg Dietsche <Gregory.Dietsche@cuw.edu>
> ---
>  arch/frv/mm/pgalloc.c |    8 +-------
>  1 files changed, 1 insertions(+), 7 deletions(-)
> 
> diff --git a/arch/frv/mm/pgalloc.c b/arch/frv/mm/pgalloc.c
> index c42c83d..4fb63a3 100644
> --- a/arch/frv/mm/pgalloc.c
> +++ b/arch/frv/mm/pgalloc.c
> @@ -133,13 +133,7 @@ void pgd_dtor(void *pgd)
>  
>  pgd_t *pgd_alloc(struct mm_struct *mm)
>  {
> -	pgd_t *pgd;
> -
> -	pgd = quicklist_alloc(0, GFP_KERNEL, pgd_ctor);
> -	if (!pgd)
> -		return pgd;
> -
> -	return pgd;
> +	return quicklist_alloc(0, GFP_KERNEL, pgd_ctor);
>  }
>  
>  void pgd_free(struct mm_struct *mm, pgd_t *pgd)
> -- 
> 1.7.2.5
> 
> --

Any feedback on this patch?

Thanks!
Greg
