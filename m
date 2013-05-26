From: walter harms <wharms@bfs.de>
Date: Sun, 26 May 2013 15:05:15 +0000
Subject: Re: [patch] f2fs: dereferencing an ERR_PTR
Message-Id: <51A224AB.8010209@bfs.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130523100213.GA19107@elgon.mountain>
In-Reply-To: <20130523100213.GA19107@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: kernel-janitors@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net



Am 23.05.2013 12:02, schrieb Dan Carpenter:
> There is an error path where "dir" is an ERR_PTR.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> diff --git a/fs/f2fs/recovery.c b/fs/f2fs/recovery.c
> index 5148d90..921aede 100644
> --- a/fs/f2fs/recovery.c
> +++ b/fs/f2fs/recovery.c
> @@ -71,7 +71,8 @@ static int recover_dentry(struct page *ipage, struct inode *inode)
>  out:
>  	f2fs_msg(inode->i_sb, KERN_NOTICE, "recover_inode and its dentry: "
>  			"ino = %x, name = %s, dir = %lx, err = %d",
> -			ino_of_node(ipage), raw_inode->i_name, dir->i_ino, err);
> +			ino_of_node(ipage), raw_inode->i_name,
> +			IS_ERR(dir) ? 0 : dir->i_ino, err);
>  	return err;
>  }
>  
I am not an expert on  this matter so a simple question:
dir->i_ino=0 is not valid ?

re,
 wh


> --
> To unsubscribe from this list: send the line "unsubscribe kernel-janitors" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
