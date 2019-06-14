From: Kees Cook <keescook@chromium.org>
Date: Fri, 14 Jun 2019 05:03:45 +0000
Subject: Re: [PATCH] mm/slab: restore IRQs in kfree()
Message-Id: <201906132202.9BF49E6B@keescook>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190613065637.GE16334@mwanda>
In-Reply-To: <20190613065637.GE16334@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Andrew Morton <akpm@linux-foundation.org>
Cc: Christoph Lameter <cl@linux.com>, Pekka Enberg <penberg@kernel.org>, David Rientjes <rientjes@google.com>, Joonsoo Kim <iamjoonsoo.kim@lge.com>, linux-mm@kvack.org, kernel-janitors@vger.kernel.org

On Thu, Jun 13, 2019 at 09:56:37AM +0300, Dan Carpenter wrote:
> We added a new return here but we need to restore the IRQs before
> we leave.
> 
> Fixes: 4f5d94fd4ed5 ("mm/slab: sanity-check page type when looking up cache")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Oh yes! Thank you for that catch! Andrew, if you haven't already, can
you pick this up?

Thanks!

-Kees

> ---
>  mm/slab.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/mm/slab.c b/mm/slab.c
> index 9e3eee5568b6..db01e9aae31b 100644
> --- a/mm/slab.c
> +++ b/mm/slab.c
> @@ -3745,8 +3745,10 @@ void kfree(const void *objp)
>  	local_irq_save(flags);
>  	kfree_debugcheck(objp);
>  	c = virt_to_cache(objp);
> -	if (!c)
> +	if (!c) {
> +		local_irq_restore(flags);
>  		return;
> +	}
>  	debug_check_no_locks_freed(objp, c->object_size);
>  
>  	debug_check_no_obj_freed(objp, c->object_size);
> -- 
> 2.20.1
> 

-- 
Kees Cook
