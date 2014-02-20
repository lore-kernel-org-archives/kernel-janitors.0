From: Jan Kara <jack@suse.cz>
Date: Thu, 20 Feb 2014 11:18:06 +0000
Subject: Re: [patch] direct-io: remove some left over checks
Message-Id: <20140220111806.GA9122@quack.suse.cz>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20140214090847.GB15629@elgon.mountain>
In-Reply-To: <20140214090847.GB15629@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>, linux-fsdevel@vger.kernel.org, Christoph Hellwig <hch@infradead.org>, kernel-janitors@vger.kernel.org

On Fri 14-02-14 12:08:47, Dan Carpenter wrote:
> We know that "ret > 0" is true here.  These tests were left over from
> 02afc27faec9 ('direct-io: Handle O_(D)SYNC AIO') and aren't needed any
> more.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
  Looks good. You can add:
Reviewed-by: Jan Kara <jack@suse.cz>

								Honza

> 
> diff --git a/fs/ext4/file.c b/fs/ext4/file.c
> index 1a5073959f32..6db7f7db7777 100644
> --- a/fs/ext4/file.c
> +++ b/fs/ext4/file.c
> @@ -153,7 +153,7 @@ ext4_file_dio_write(struct kiocb *iocb, const struct iovec *iov,
>  		ssize_t err;
>  
>  		err = generic_write_sync(file, iocb->ki_pos - ret, ret);
> -		if (err < 0 && ret > 0)
> +		if (err < 0)
>  			ret = err;
>  	}
>  	blk_finish_plug(&plug);
> diff --git a/fs/btrfs/file.c b/fs/btrfs/file.c
> index 0165b8672f09..7331a230e30b 100644
> --- a/fs/btrfs/file.c
> +++ b/fs/btrfs/file.c
> @@ -1797,7 +1797,7 @@ static ssize_t btrfs_file_aio_write(struct kiocb *iocb,
>  	BTRFS_I(inode)->last_sub_trans = root->log_transid;
>  	if (num_written > 0) {
>  		err = generic_write_sync(file, pos, num_written);
> -		if (err < 0 && num_written > 0)
> +		if (err < 0)
>  			num_written = err;
>  	}
>  
> diff --git a/fs/block_dev.c b/fs/block_dev.c
> index c7a7def27b07..ba0d2b05bb78 100644
> --- a/fs/block_dev.c
> +++ b/fs/block_dev.c
> @@ -1523,7 +1523,7 @@ ssize_t blkdev_aio_write(struct kiocb *iocb, const struct iovec *iov,
>  		ssize_t err;
>  
>  		err = generic_write_sync(file, pos, ret);
> -		if (err < 0 && ret > 0)
> +		if (err < 0)
>  			ret = err;
>  	}
>  	blk_finish_plug(&plug);
> --
> To unsubscribe from this list: send the line "unsubscribe linux-fsdevel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
-- 
Jan Kara <jack@suse.cz>
SUSE Labs, CR
