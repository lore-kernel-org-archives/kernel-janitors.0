From: Nikolay Borisov <nborisov@suse.com>
Date: Fri, 09 Aug 2019 14:36:05 +0000
Subject: Re: [PATCH] Btrfs: Fix an assert statement in __btrfs_map_block()
Message-Id: <ea7d34b5-2870-8805-99b9-762d2fe23c3a@suse.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190809140739.GA3552@mwanda>
In-Reply-To: <20190809140739.GA3552@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Chris Mason <clm@fb.com>
Cc: David Sterba <dsterba@suse.com>, Josef Bacik <josef@toxicpanda.com>, kernel-janitors@vger.kernel.org, linux-btrfs@vger.kernel.org



On 9.08.19 г. 17:07 ч., Dan Carpenter wrote:
> The btrfs_get_chunk_map() never returns NULL, it returns error pointers.
> 
> Fixes: 89b798ad1b42 ("btrfs: Use btrfs_get_io_geometry appropriately")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Reviewed-by: Nikolay Borisov <nborisov@suse.com>

> ---
>  fs/btrfs/volumes.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/fs/btrfs/volumes.c b/fs/btrfs/volumes.c
> index 6edd1d57e530..e69d135c7d3c 100644
> --- a/fs/btrfs/volumes.c
> +++ b/fs/btrfs/volumes.c
> @@ -5818,7 +5818,7 @@ static int __btrfs_map_block(struct btrfs_fs_info *fs_info,
>  		return ret;
>  
>  	em = btrfs_get_chunk_map(fs_info, logical, *length);
> -	ASSERT(em);
> +	ASSERT(!IS_ERR(em));
>  	map = em->map_lookup;
>  
>  	*length = geom.len;
> 
