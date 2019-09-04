From: Chao Yu <yuchao0@huawei.com>
Date: Wed, 04 Sep 2019 11:43:07 +0000
Subject: Re: [PATCH] f2fs: signedness bug in f2fs_fname_setup_ci_filename()
Message-Id: <29accb39-1ed7-ab3f-4783-9a07836db8e3@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190904100239.GC7007@mwanda>
In-Reply-To: <20190904100239.GC7007@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Jaegeuk Kim <jaegeuk@kernel.org>
Cc: kernel-janitors@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net

On 2019/9/4 18:02, Dan Carpenter wrote:
> The error handling doesn't work because "cf_name->len" is unsigned.

Dan, thanks for catching this, would you mind merging this into original patch,
since it's still in the dev branch. :)

Thanks,

> 
> Fixes: fbce5d4ab3ab ("f2fs: optimize case-insensitive lookups")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  fs/f2fs/dir.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/fs/f2fs/dir.c b/fs/f2fs/dir.c
> index 9de688a4e115..c83b666f9d7e 100644
> --- a/fs/f2fs/dir.c
> +++ b/fs/f2fs/dir.c
> @@ -157,7 +157,7 @@ void f2fs_fname_setup_ci_filename(struct inode *dir,
>  	cf_name->len = utf8_casefold(sbi->s_encoding,
>  					iname, cf_name->name,
>  					F2FS_NAME_LEN);
> -	if (cf_name->len <= 0) {
> +	if ((int)cf_name->len <= 0) {
>  		kvfree(cf_name->name);
>  		cf_name->name = NULL;
>  	}
> 
