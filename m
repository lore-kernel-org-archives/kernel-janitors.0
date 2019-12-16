From: Miao Xie <miaoxie@huawei.com>
Date: Mon, 16 Dec 2019 09:22:17 +0000
Subject: Re: [PATCH] ext4: unlock on error in ext4_expand_extra_isize()
Message-Id: <5b8569d5-9fbe-0bcf-8fcc-852ded7cd672@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191213185010.6k7yl2tck3wlsdkt@kili.mountain>
In-Reply-To: <20191213185010.6k7yl2tck3wlsdkt@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Theodore Ts'o <tytso@mit.edu>
Cc: Andreas Dilger <adilger.kernel@dilger.ca>, linux-ext4@vger.kernel.org, kernel-janitors@vger.kernel.org

Hi, Dan Carpenter

I forgot to reply your mail because I'm busy recently. Sorry.
Thanks for your fix.

Regards
Miao

on 2019/12/14 at 2:50, Dan Carpenter wrote:
> We need to unlock the xattr before returning on this error path.
> 
> Fixes: c03b45b853f5 ("ext4, project: expand inode extra size if possible")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  fs/ext4/inode.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/fs/ext4/inode.c b/fs/ext4/inode.c
> index 28f28de0c1b6..629a25d999f0 100644
> --- a/fs/ext4/inode.c
> +++ b/fs/ext4/inode.c
> @@ -5692,7 +5692,7 @@ int ext4_expand_extra_isize(struct inode *inode,
>  	error = ext4_journal_get_write_access(handle, iloc->bh);
>  	if (error) {
>  		brelse(iloc->bh);
> -		goto out_stop;
> +		goto out_unlock;
>  	}
>  
>  	error = __ext4_expand_extra_isize(inode, new_extra_isize, iloc,
> @@ -5702,8 +5702,8 @@ int ext4_expand_extra_isize(struct inode *inode,
>  	if (!error)
>  		error = rc;
>  
> +out_unlock:
>  	ext4_write_unlock_xattr(inode, &no_expand);
> -out_stop:
>  	ext4_journal_stop(handle);
>  	return error;
>  }
> 
