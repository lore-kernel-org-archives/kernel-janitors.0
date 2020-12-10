From: Jan Kara <jack@suse.cz>
Date: Thu, 10 Dec 2020 16:04:19 +0000
Subject: Re: [PATCH] ext4: Fix an IS_ERR() vs NULL check
Message-Id: <20201210160419.GA31725@quack2.suse.cz>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201023112232.GB282278@mwanda>
In-Reply-To: <20201023112232.GB282278@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Theodore Ts'o <tytso@mit.edu>, Harshad Shirwadkar <harshadshirwadkar@gmail.com>, Andreas Dilger <adilger.kernel@dilger.ca>, linux-ext4@vger.kernel.org, kernel-janitors@vger.kernel.org

On Fri 23-10-20 14:22:32, Dan Carpenter wrote:
> The ext4_find_extent() function never returns NULL, it returns error
> pointers.
> 
> Fixes: 44059e503b03 ("ext4: fast commit recovery path")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

I think this fix has fallen through the cracks? It looks good to me so feel
free to add:

Reviewed-by: Jan Kara <jack@suse.cz>

								Honza

> ---
>  fs/ext4/extents.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/fs/ext4/extents.c b/fs/ext4/extents.c
> index 6b33b9c86b00..a19d0e3a4126 100644
> --- a/fs/ext4/extents.c
> +++ b/fs/ext4/extents.c
> @@ -5820,8 +5820,8 @@ int ext4_ext_replay_update_ex(struct inode *inode, ext4_lblk_t start,
>  	int ret;
>  
>  	path = ext4_find_extent(inode, start, NULL, 0);
> -	if (!path)
> -		return -EINVAL;
> +	if (IS_ERR(path))
> +		return PTR_ERR(path);
>  	ex = path[path->p_depth].p_ext;
>  	if (!ex) {
>  		ret = -EFSCORRUPTED;
> -- 
> 2.28.0
> 
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR
