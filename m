From: Dan Carpenter <error27@gmail.com>
Date: Mon, 05 Apr 2010 12:33:35 +0000
Subject: Re: [patch] vfs: indent cleanup for fs/namei.c
Message-Id: <20100405123335.GB16099@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
References: <4BB84487.5030303@redflag-linux.com>
In-Reply-To: <4BB84487.5030303@redflag-linux.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: kernel-janitors@vger.kernel.org

On Sun, Apr 04, 2010 at 03:49:27PM +0800, "潘卫平(Peter Pan)" wrote:
> indent cleanup for fs/namei.c
>

I would restrict whitespace cleanups to staging...  Al Viro is just
going to get annoyed with these patches.  Why deal with that?

regards,
dan carpenter

> Signed-off-by: Peter Pan <wppan@redflag-linux.com>
> ---
>  fs/namei.c |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/fs/namei.c b/fs/namei.c
> index a7dce91..905fb84 100644
> --- a/fs/namei.c
> +++ b/fs/namei.c
> @@ -172,7 +172,7 @@ EXPORT_SYMBOL(putname);
>  static int acl_permission_check(struct inode *inode, int mask,
>  		int (*check_acl)(struct inode *inode, int mask))
>  {
> -	umode_t			mode = inode->i_mode;
> +	umode_t mode = inode->i_mode;
>
>  	mask &= MAY_READ | MAY_WRITE | MAY_EXEC;
>
> -- 
> 1.6.2.2
>
> Regards
> -- 
> 潘卫平(Peter Pan)
> Red Flag Software Co.,Ltd.
> --
> To unsubscribe from this list: send the line "unsubscribe kernel-janitors" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
