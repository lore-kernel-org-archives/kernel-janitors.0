From: OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>
Date: Tue, 08 Dec 2015 08:35:21 +0000
Subject: Re: [PATCH] fat: constify fatent_operations structures
Message-Id: <87y4d5banq.fsf@mail.parknet.co.jp>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1449521164-9731-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1449521164-9731-1-git-send-email-Julia.Lawall@lip6.fr> (Julia
	Lawall's message of "Mon, 7 Dec 2015 21:46:04 +0100")
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Julia Lawall <Julia.Lawall@lip6.fr>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Julia Lawall <Julia.Lawall@lip6.fr> writes:

> The fatent_operations structures are never modified, so declare them as
> const.
>
> Done with the help of Coccinelle.

Looks good. Thanks.

Acked-by: OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>

> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>
>
> ---
>  fs/fat/fat.h    |    2 +-
>  fs/fat/fatent.c |   24 ++++++++++++------------
>  2 files changed, 13 insertions(+), 13 deletions(-)
>
> diff --git a/fs/fat/fat.h b/fs/fat/fat.h
> index 4307cd4..e6b764a 100644
> --- a/fs/fat/fat.h
> +++ b/fs/fat/fat.h
> @@ -87,7 +87,7 @@ struct msdos_sb_info {
>  	unsigned int vol_id;		/*volume ID*/
>  
>  	int fatent_shift;
> -	struct fatent_operations *fatent_ops;
> +	const struct fatent_operations *fatent_ops;
>  	struct inode *fat_inode;
>  	struct inode *fsinfo_inode;
>  
> diff --git a/fs/fat/fatent.c b/fs/fat/fatent.c
> index 8226557..1d9a8c4 100644
> --- a/fs/fat/fatent.c
> +++ b/fs/fat/fatent.c
> @@ -99,7 +99,7 @@ err:
>  static int fat_ent_bread(struct super_block *sb, struct fat_entry *fatent,
>  			 int offset, sector_t blocknr)
>  {
> -	struct fatent_operations *ops = MSDOS_SB(sb)->fatent_ops;
> +	const struct fatent_operations *ops = MSDOS_SB(sb)->fatent_ops;
>  
>  	WARN_ON(blocknr < MSDOS_SB(sb)->fat_start);
>  	fatent->fat_inode = MSDOS_SB(sb)->fat_inode;
> @@ -246,7 +246,7 @@ static int fat32_ent_next(struct fat_entry *fatent)
>  	return 0;
>  }
>  
> -static struct fatent_operations fat12_ops = {
> +static const struct fatent_operations fat12_ops = {
>  	.ent_blocknr	= fat12_ent_blocknr,
>  	.ent_set_ptr	= fat12_ent_set_ptr,
>  	.ent_bread	= fat12_ent_bread,
> @@ -255,7 +255,7 @@ static struct fatent_operations fat12_ops = {
>  	.ent_next	= fat12_ent_next,
>  };
>  
> -static struct fatent_operations fat16_ops = {
> +static const struct fatent_operations fat16_ops = {
>  	.ent_blocknr	= fat_ent_blocknr,
>  	.ent_set_ptr	= fat16_ent_set_ptr,
>  	.ent_bread	= fat_ent_bread,
> @@ -264,7 +264,7 @@ static struct fatent_operations fat16_ops = {
>  	.ent_next	= fat16_ent_next,
>  };
>  
> -static struct fatent_operations fat32_ops = {
> +static const struct fatent_operations fat32_ops = {
>  	.ent_blocknr	= fat_ent_blocknr,
>  	.ent_set_ptr	= fat32_ent_set_ptr,
>  	.ent_bread	= fat_ent_bread,
> @@ -320,7 +320,7 @@ static inline int fat_ent_update_ptr(struct super_block *sb,
>  				     int offset, sector_t blocknr)
>  {
>  	struct msdos_sb_info *sbi = MSDOS_SB(sb);
> -	struct fatent_operations *ops = sbi->fatent_ops;
> +	const struct fatent_operations *ops = sbi->fatent_ops;
>  	struct buffer_head **bhs = fatent->bhs;
>  
>  	/* Is this fatent's blocks including this entry? */
> @@ -349,7 +349,7 @@ int fat_ent_read(struct inode *inode, struct fat_entry *fatent, int entry)
>  {
>  	struct super_block *sb = inode->i_sb;
>  	struct msdos_sb_info *sbi = MSDOS_SB(inode->i_sb);
> -	struct fatent_operations *ops = sbi->fatent_ops;
> +	const struct fatent_operations *ops = sbi->fatent_ops;
>  	int err, offset;
>  	sector_t blocknr;
>  
> @@ -407,7 +407,7 @@ int fat_ent_write(struct inode *inode, struct fat_entry *fatent,
>  		  int new, int wait)
>  {
>  	struct super_block *sb = inode->i_sb;
> -	struct fatent_operations *ops = MSDOS_SB(sb)->fatent_ops;
> +	const struct fatent_operations *ops = MSDOS_SB(sb)->fatent_ops;
>  	int err;
>  
>  	ops->ent_put(fatent, new);
> @@ -432,7 +432,7 @@ static inline int fat_ent_next(struct msdos_sb_info *sbi,
>  static inline int fat_ent_read_block(struct super_block *sb,
>  				     struct fat_entry *fatent)
>  {
> -	struct fatent_operations *ops = MSDOS_SB(sb)->fatent_ops;
> +	const struct fatent_operations *ops = MSDOS_SB(sb)->fatent_ops;
>  	sector_t blocknr;
>  	int offset;
>  
> @@ -463,7 +463,7 @@ int fat_alloc_clusters(struct inode *inode, int *cluster, int nr_cluster)
>  {
>  	struct super_block *sb = inode->i_sb;
>  	struct msdos_sb_info *sbi = MSDOS_SB(sb);
> -	struct fatent_operations *ops = sbi->fatent_ops;
> +	const struct fatent_operations *ops = sbi->fatent_ops;
>  	struct fat_entry fatent, prev_ent;
>  	struct buffer_head *bhs[MAX_BUF_PER_PAGE];
>  	int i, count, err, nr_bhs, idx_clus;
> @@ -551,7 +551,7 @@ int fat_free_clusters(struct inode *inode, int cluster)
>  {
>  	struct super_block *sb = inode->i_sb;
>  	struct msdos_sb_info *sbi = MSDOS_SB(sb);
> -	struct fatent_operations *ops = sbi->fatent_ops;
> +	const struct fatent_operations *ops = sbi->fatent_ops;
>  	struct fat_entry fatent;
>  	struct buffer_head *bhs[MAX_BUF_PER_PAGE];
>  	int i, err, nr_bhs;
> @@ -636,7 +636,7 @@ EXPORT_SYMBOL_GPL(fat_free_clusters);
>  static void fat_ent_reada(struct super_block *sb, struct fat_entry *fatent,
>  			  unsigned long reada_blocks)
>  {
> -	struct fatent_operations *ops = MSDOS_SB(sb)->fatent_ops;
> +	const struct fatent_operations *ops = MSDOS_SB(sb)->fatent_ops;
>  	sector_t blocknr;
>  	int i, offset;
>  
> @@ -649,7 +649,7 @@ static void fat_ent_reada(struct super_block *sb, struct fat_entry *fatent,
>  int fat_count_free_clusters(struct super_block *sb)
>  {
>  	struct msdos_sb_info *sbi = MSDOS_SB(sb);
> -	struct fatent_operations *ops = sbi->fatent_ops;
> +	const struct fatent_operations *ops = sbi->fatent_ops;
>  	struct fat_entry fatent;
>  	unsigned long reada_blocks, reada_mask, cur_block;
>  	int err = 0, free;
>

-- 
OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>
