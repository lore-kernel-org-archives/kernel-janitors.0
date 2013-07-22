From: Ryusuke Konishi <konishi.ryusuke@lab.ntt.co.jp>
Date: Mon, 22 Jul 2013 18:24:58 +0000
Subject: Re: [PATCH] nilfs2: remove double bio_put() in nilfs_end_bio_write() for BIO_EOPNOTSUPP error
Message-Id: <20130723.032458.480817929.konishi.ryusuke@lab.ntt.co.jp>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1374480134.5175.6.camel@slavad-ubuntu>
In-Reply-To: <1374480134.5175.6.camel@slavad-ubuntu>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Vyacheslav Dubeyko <slava-yeENwD64cLxBDgjK7y7TUQ@public.gmane.org>
Cc: linux-nilfs-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, DanCarpenter <dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>, linux-fsdevel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org

Hi Vyacheslav,
On Mon, 22 Jul 2013 12:02:14 +0400, Vyacheslav Dubeyko wrote:
> From: Vyacheslav Dubeyko <slava@dubeyko.com>
> Subject: [PATCH] nilfs2: remove double bio_put() in nilfs_end_bio_write() for BIO_EOPNOTSUPP error
> 
> This patch removes double call of bio_put() in nilfs_end_bio_write()
> for the case of BIO_EOPNOTSUPP error detection. The issue was found
> by Dan Carpenter and he suggests first version of the fix too.
> 
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> Signed-off-by: Vyacheslav Dubeyko <slava@dubeyko.com>
> CC: Ryusuke Konishi <konishi.ryusuke@lab.ntt.co.jp>

Thank you for following the issue.  I reviewed the code around bio.

In conclusion, Dan Carpenter's patch looks correct because
nilfs_segbuf_submit_bio() does not increment the number of flying bio
(segbuf->sb_nbio) for EOPNOTSUPP/BIO_EOPNOTSUPP case.

If nilfs_end_bio_write() function reaches the complete() call for the
EOPNOTSUPP/BIO_EOPNOTSUPP case (as the current implementation), the
number of complete() calls and that of wait_for_complete() will not
balance.

Do you have a comment?

Regards,
Ryusuke Konishi

> ---
>  fs/nilfs2/segbuf.c |    3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/fs/nilfs2/segbuf.c b/fs/nilfs2/segbuf.c
> index dc9a913..5bacf46 100644
> --- a/fs/nilfs2/segbuf.c
> +++ b/fs/nilfs2/segbuf.c
> @@ -345,8 +345,7 @@ static void nilfs_end_bio_write(struct bio *bio, int err)
>  
>  	if (err = -EOPNOTSUPP) {
>  		set_bit(BIO_EOPNOTSUPP, &bio->bi_flags);
> -		bio_put(bio);
> -		/* to be detected by submit_seg_bio() */
> +		/* to be detected by nilfs_segbuf_submit_bio() */
>  	}
>  
>  	if (!uptodate)
> -- 
> 1.7.9.5
> 
> 
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-fsdevel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
