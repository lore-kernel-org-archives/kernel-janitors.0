From: Jan Kara <jack@suse.cz>
Date: Mon, 21 Jan 2019 14:17:35 +0000
Subject: Re: [PATCH] ext4: Fix some error pointer dereferences
Message-Id: <20190121141735.GA21694@quack2.suse.cz>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190103113811.GA13543@kadam>
In-Reply-To: <20190103113811.GA13543@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Theodore Ts'o <tytso@mit.edu>, Andreas Dilger <adilger.kernel@dilger.ca>, linux-ext4@vger.kernel.org, kernel-janitors@vger.kernel.org

On Thu 03-01-19 14:38:11, Dan Carpenter wrote:
> We can't pass error pointers to brelse().
> 
> Fixes: fb265c9cb49e ("ext4: add ext4_sb_bread() to disambiguate ENOMEM cases")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Thanks for catching this. The patch looks good to me. You can add:

Reviewed-by: Jan Kara <jack@suse.cz>

								Honza

> ---
>  fs/ext4/xattr.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/fs/ext4/xattr.c b/fs/ext4/xattr.c
> index 7fddd519adae..6ddbbe21fdd8 100644
> --- a/fs/ext4/xattr.c
> +++ b/fs/ext4/xattr.c
> @@ -829,6 +829,7 @@ int ext4_get_inode_usage(struct inode *inode, qsize_t *usage)
>  		bh = ext4_sb_bread(inode->i_sb, EXT4_I(inode)->i_file_acl, REQ_PRIO);
>  		if (IS_ERR(bh)) {
>  			ret = PTR_ERR(bh);
> +			bh = NULL;
>  			goto out;
>  		}
>  
> @@ -2903,6 +2904,7 @@ int ext4_xattr_delete_inode(handle_t *handle, struct inode *inode,
>  			if (error = -EIO)
>  				EXT4_ERROR_INODE(inode, "block %llu read error",
>  						 EXT4_I(inode)->i_file_acl);
> +			bh = NULL;
>  			goto cleanup;
>  		}
>  		error = ext4_xattr_check_block(inode, bh);
> @@ -3059,6 +3061,7 @@ ext4_xattr_block_cache_find(struct inode *inode,
>  		if (IS_ERR(bh)) {
>  			if (PTR_ERR(bh) = -ENOMEM)
>  				return NULL;
> +			bh = NULL;
>  			EXT4_ERROR_INODE(inode, "block %lu read error",
>  					 (unsigned long)ce->e_value);
>  		} else if (ext4_xattr_cmp(header, BHDR(bh)) = 0) {
> -- 
> 2.17.1
> 
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR
