From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 14 May 2013 18:33:33 +0000
Subject: Re: [PATCH] rbtree: remove unneeded include
Message-Id: <20130514183333.GK1360@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1368556069-194880-1-git-send-email-nzimmer@sgi.com>
In-Reply-To: <1368556069-194880-1-git-send-email-nzimmer@sgi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Nathan Zimmer <nzimmer@sgi.com>, Andrew Morton <akpm@linux-foundation.org>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

These go through Andrew Morton.  He's the only person who reads LKML
so he might notice this patch, but I have added him to the CC list
just in case.

regards,
dan carpenter

On Tue, May 14, 2013 at 01:27:49PM -0500, Nathan Zimmer wrote:
> Remove an unnecessary include to kernel.h
> 
> Signed-off-by: Nathan Zimmer <nzimmer@sgi.com>
> ---
>  include/linux/rbtree.h | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/include/linux/rbtree.h b/include/linux/rbtree.h
> index 0022c1b..d2fdc6d 100644
> --- a/include/linux/rbtree.h
> +++ b/include/linux/rbtree.h
> @@ -29,7 +29,6 @@
>  #ifndef	_LINUX_RBTREE_H
>  #define	_LINUX_RBTREE_H
>  
> -#include <linux/kernel.h>
>  #include <linux/stddef.h>
>  
>  struct rb_node {
> -- 
> 1.8.2.1
> 
> --
> To unsubscribe from this list: send the line "unsubscribe kernel-janitors" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
