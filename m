From: Frederik Deweerdt <deweerdt@free.fr>
Date: Wed, 20 Dec 2006 21:26:05 +0000
Subject: Re: [KJ] [RFC][PATCH] does this patch look remotely sane?
Message-Id: <20061220212605.GD28900@slug>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0612201607010.6547@localhost.localdomain>
In-Reply-To: <Pine.LNX.4.64.0612201607010.6547@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Wed, Dec 20, 2006 at 04:09:07PM -0500, Robert P. J. Day wrote:
> 
>   followup to my previous question, if that equivalence holds, does
> this patch look like it would make sense?
> 
> --- a/kernel/kexec.c
> +++ b/kernel/kexec.c
> @@ -698,7 +698,7 @@ static struct page *kimage_alloc_page(struct kimage *image,
>  		kimage_entry_t *old;
> 
>  		/* Allocate a page, if we run out of memory give up */
> -		page = kimage_alloc_pages(gfp_mask, 0);
> +		page = kimage_alloc_page(gfp_mask);
>  		if (!page)
>  			return NULL;
>  		/* If the page cannot be used file it away */
Equivalence is limited to alloc_page, though :). 

Regards,
Frederik
 
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
