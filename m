From: "Jan Beulich" <JBeulich@suse.com>
Date: Fri, 16 Sep 2011 07:38:09 +0000
Subject: Re: [PATCH 1/4] drivers/block/xen-blkback/blkback.c: take size
Message-Id: <4E7319010200007800056727@nat28.tlf.novell.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1316156255-19509-1-git-send-email-julia@diku.dk>
In-Reply-To: <1316156255-19509-1-git-send-email-julia@diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Cc: Ian Campbell <ian.campbell@citrix.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

>>> On 16.09.11 at 08:57, Julia Lawall <julia@diku.dk> wrote:
> From: Julia Lawall <julia@diku.dk>
> 
> Sizeof a pointer-typed expression returns the size of the pointer, not that
> of the pointed data.
> 
> The semantic patch that fixes this problem is as follows:
> (http://coccinelle.lip6.fr/)
> 
> // <smpl>
> @@
> expression *e;
> type T;
> identifier f;
> @@
> 
> f(...,(T)e,...,
> -sizeof(e)
> +sizeof(*e)
> ,...)
> // </smpl>
> 
> Signed-off-by: Julia Lawall <julia@diku.dk>
> 
> ---
>  drivers/block/xen-blkback/blkback.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff -u -p a/drivers/block/xen-blkback/blkback.c 
> b/drivers/block/xen-blkback/blkback.c
> --- a/drivers/block/xen-blkback/blkback.c
> +++ b/drivers/block/xen-blkback/blkback.c
> @@ -790,7 +790,7 @@ static int __init xen_blkif_init(void)
>  	if (rc)
>  		goto failed_init;
>  
> -	memset(blkbk->pending_reqs, 0, sizeof(blkbk->pending_reqs));
> +	memset(blkbk->pending_reqs, 0, sizeof(*blkbk->pending_reqs));
>  
>  	INIT_LIST_HEAD(&blkbk->pending_free);
>  	spin_lock_init(&blkbk->pending_free_lock);

I think a better fix for this is to use kzalloc() properly here:

Subject: xen-blkback: use kzalloc() in favor of kmalloc()+memset()

This fixes the problem of three of those four memset()-s having
improper size arguments passed: Sizeof a pointer-typed expression
returns the size of the pointer, not that of the pointed to data.

It also reverts using kmalloc() instead of kzalloc() for the allocation
of the pending grant handles array, as that array gets fully
initialized in a subsequent loop.

Reported-by: Julia Lawall <julia@diku.dk>
Signed-off-by: Jan Beulich <jbeulich@novell.com>

---
 drivers/block/xen-blkback/blkback.c |    6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

--- 3.1-rc6/drivers/block/xen-blkback/blkback.c
+++ 3.1-rc6-xen-blkback-kzalloc/drivers/block/xen-blkback/blkback.c
@@ -765,9 +765,9 @@ static int __init xen_blkif_init(void)
 
 	mmap_pages = xen_blkif_reqs * BLKIF_MAX_SEGMENTS_PER_REQUEST;
 
-	blkbk->pending_reqs          = kmalloc(sizeof(blkbk->pending_reqs[0]) *
+	blkbk->pending_reqs          = kzalloc(sizeof(blkbk->pending_reqs[0]) *
 					xen_blkif_reqs, GFP_KERNEL);
-	blkbk->pending_grant_handles = kzalloc(sizeof(blkbk->pending_grant_handles[0]) *
+	blkbk->pending_grant_handles = kmalloc(sizeof(blkbk->pending_grant_handles[0]) *
 					mmap_pages, GFP_KERNEL);
 	blkbk->pending_pages         = kzalloc(sizeof(blkbk->pending_pages[0]) *
 					mmap_pages, GFP_KERNEL);
@@ -790,8 +790,6 @@ static int __init xen_blkif_init(void)
 	if (rc)
 		goto failed_init;
 
-	memset(blkbk->pending_reqs, 0, sizeof(blkbk->pending_reqs));
-
 	INIT_LIST_HEAD(&blkbk->pending_free);
 	spin_lock_init(&blkbk->pending_free_lock);
 	init_waitqueue_head(&blkbk->pending_free_wq);



