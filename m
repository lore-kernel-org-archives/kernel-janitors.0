From: Jan Kara <jack@suse.cz>
Date: Wed, 29 Aug 2018 10:58:53 +0000
Subject: Re: [PATCH] udf: remove unused variables group_start and nr_groups
Message-Id: <20180829105853.GA5959@quack2.suse.cz>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180829101612.31824-1-colin.king@canonical.com>
In-Reply-To: <20180829101612.31824-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Jan Kara <jack@suse.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed 29-08-18 11:16:12, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Variables group_start and nr_groups are being assigned but are never used
> hence they are redundant and can be removed.
> 
> Cleans up clang warning:
> variable 'group_start' set but not used [-Wunused-but-set-variable]
> variable 'nr_groups' set but not used [-Wunused-but-set-variable]
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Thanks. Added to my tree.

								Honza

> ---
>  fs/udf/balloc.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/fs/udf/balloc.c b/fs/udf/balloc.c
> index fcda0fc97b90..501bc5ffb4ce 100644
> --- a/fs/udf/balloc.c
> +++ b/fs/udf/balloc.c
> @@ -175,8 +175,8 @@ static int udf_bitmap_prealloc_blocks(struct super_block *sb,
>  {
>  	struct udf_sb_info *sbi = UDF_SB(sb);
>  	int alloc_count = 0;
> -	int bit, block, block_group, group_start;
> -	int nr_groups, bitmap_nr;
> +	int bit, block, block_group;
> +	int bitmap_nr;
>  	struct buffer_head *bh;
>  	__u32 part_len;
>  
> @@ -189,10 +189,8 @@ static int udf_bitmap_prealloc_blocks(struct super_block *sb,
>  		block_count = part_len - first_block;
>  
>  	do {
> -		nr_groups = udf_compute_nr_groups(sb, partition);
>  		block = first_block + (sizeof(struct spaceBitmapDesc) << 3);
>  		block_group = block >> (sb->s_blocksize_bits + 3);
> -		group_start = block_group ? 0 : sizeof(struct spaceBitmapDesc);
>  
>  		bitmap_nr = load_block_bitmap(sb, bitmap, block_group);
>  		if (bitmap_nr < 0)
> -- 
> 2.17.1
> 
> 
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR
