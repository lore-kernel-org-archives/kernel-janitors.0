From: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
Date: Mon, 25 Jul 2016 00:49:56 +0000
Subject: Re: [PATCH] zsmalloc: Delete an unnecessary check before the function call "iput"
Message-Id: <20160725004956.GA430@swordfish>
List-Id: <kernel-janitors.vger.kernel.org>
References: <530C5E18.1020800@users.sourceforge.net>
 <alpine.DEB.2.10.1402251014170.2080@hadrien>
 <530CD2C4.4050903@users.sourceforge.net>
 <alpine.DEB.2.10.1402251840450.7035@hadrien>
 <530CF8FF.8080600@users.sourceforge.net>
 <alpine.DEB.2.02.1402252117150.2047@localhost6.localdomain6>
 <530DD06F.4090703@users.sourceforge.net>
 <alpine.DEB.2.02.1402262129250.2221@localhost6.localdomain6>
 <5317A59D.4@users.sourceforge.net>
 <559cf499-4a01-25f9-c87f-24d906626a57@users.sourceforge.net>
In-Reply-To: <559cf499-4a01-25f9-c87f-24d906626a57@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: linux-mm@kvack.org, Minchan Kim <minchan@kernel.org>, Nitin Gupta <ngupta@vflare.org>, Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>, Andrew Morton <akpm@linux-foundation.org>

On (07/22/16 20:02), SF Markus Elfring wrote:
> The iput() function tests whether its argument is NULL and then
> returns immediately. Thus the test around the call is not needed.
> 
> This issue was detected by using the Coccinelle software.

there is no issue; the change is just cosmetic.


> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

Reviewed-by: Sergey Senozhatsky <sergey.senozhatsky@gmail.com>



alloc_anon_inode() returns ERR_PTR, so I'd probably rather
change iput() to do IS_ERR_OR_NULL instead of !NULL.

	inode = alloc_anon_inode();
	if (IS_ERR(inode)) {
		inode = NULL;
		^^^^^^^^^^^^^
	}
	...
	iput(inode);

this NULL assignment on error path is a bit fragile.

IOW, something like this

---

diff --git a/fs/inode.c b/fs/inode.c
index 559a9da..f1b7bd2 100644
--- a/fs/inode.c
+++ b/fs/inode.c
@@ -1497,7 +1497,7 @@ static void iput_final(struct inode *inode)
  */
 void iput(struct inode *inode)
 {
-       if (!inode)
+       if (IS_ERR_OR_NULL(inode))
                return;
        BUG_ON(inode->i_state & I_CLEAR);
 retry:


---

	-ss

> ---
>  mm/zsmalloc.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/mm/zsmalloc.c b/mm/zsmalloc.c
> index 5e5237c..7b5fd2b 100644
> --- a/mm/zsmalloc.c
> +++ b/mm/zsmalloc.c
> @@ -2181,8 +2181,7 @@ static int zs_register_migration(struct zs_pool *pool)
>  static void zs_unregister_migration(struct zs_pool *pool)
>  {
>  	flush_work(&pool->free_work);
> -	if (pool->inode)
> -		iput(pool->inode);
> +	iput(pool->inode);
>  }
>  
>  /*
> -- 
> 2.9.2
> 
