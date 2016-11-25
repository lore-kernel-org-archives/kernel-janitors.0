From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 25 Nov 2016 19:08:23 +0000
Subject: Re: [patch] [media] uvcvideo: freeing an error pointer
Message-Id: <20161125182037.GB28558@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20161125102835.GA5856@mwanda>
 <2064794.XNX8XhaLMu@avalon>
In-Reply-To: <2064794.XNX8XhaLMu@avalon>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Markus Elfring <elfring@users.sourceforge.net>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org

On Fri, Nov 25, 2016 at 03:57:51PM +0200, Laurent Pinchart wrote:
> diff --git a/mm/slab.c b/mm/slab.c
> index 0b0550ca85b4..a7eb830c6684 100644
> --- a/mm/slab.c
> +++ b/mm/slab.c
> @@ -3819,6 +3819,8 @@ void kfree(const void *objp)
>  
>  	if (unlikely(ZERO_OR_NULL_PTR(objp)))
>  		return;
> +	if (WARN_ON(IS_ERR(objp)))
> +		return;
>  	local_irq_save(flags);
>  	kfree_debugcheck(objp);
>  	c = virt_to_cache(objp);
> 

A bunch of people have proposed that.  You're the first person to
actually write up a patch.  Feel free to send it.  ;)

regards,
dan carpenter

