From: steve@chygwyn.com
Date: Fri, 05 Sep 2008 14:13:52 +0000
Subject: Re: [PATCH] fs/gfs2: Use an IS_ERR test rather than a NULL test
Message-Id: <20080905141352.GA20654@fogou.chygwyn.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <200809011051.22862.brunel@diku.dk>
In-Reply-To: <200809011051.22862.brunel@diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julien Brunel <brunel@diku.dk>
Cc: swhiteho@redhat.com, cluster-devel@redhat.com, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Hi,

Sorry for taking so long about this. Its now in the -nmw git tree.
Thanks,

Steve.

On Mon, Sep 01, 2008 at 10:51:22AM +0200, Julien Brunel wrote:
> From: Julien Brunel <brunel@diku.dk>
> 
> In case of error, the function gfs2_inode_lookup returns an
> ERR pointer, but never returns a NULL pointer. So a NULL test that
> necessarily comes after an IS_ERR test should be deleted, and a NULL
> test that may come after a call to this function should be
> strengthened by an IS_ERR test.
> 
> The semantic match that finds this problem is as follows:
> (http://www.emn.fr/x-info/coccinelle/)
> 
> // <smpl>
> @match_bad_null_test@
> expression x, E;
> statement S1,S2;
> @@
> x = gfs2_inode_lookup(...)
> ... when != x = E
> * if (x != NULL) 
> S1 else S2
> // </smpl>
> 
> Signed-off-by:  Julien Brunel <brunel@diku.dk>
> Signed-off-by:  Julia Lawall <julia@diku.dk>
> 
> ---
>  fs/gfs2/inode.c |    4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff -u -p a/fs/gfs2/inode.c b/fs/gfs2/inode.c
> --- a/fs/gfs2/inode.c
> +++ b/fs/gfs2/inode.c
> @@ -1033,13 +1033,11 @@ struct inode *gfs2_createi(struct gfs2_h
>  
>  	if (bh)
>  		brelse(bh);
> -	if (!inode)
> -		return ERR_PTR(-ENOMEM);
>  	return inode;
>  
>  fail_gunlock2:
>  	gfs2_glock_dq_uninit(ghs + 1);
> -	if (inode)
> +	if (inode && !IS_ERR(inode))
>  		iput(inode);
>  fail_gunlock:
>  	gfs2_glock_dq(ghs);
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at  http://www.tux.org/lkml/
