From: Jack Stone <jwjstone@fastmail.fm>
Date: Thu, 09 Apr 2009 10:22:11 +0000
Subject: Re: [PATCH 41/56] reiserfs: Remove void casts
Message-Id: <49DDCC53.7060509@fastmail.fm>
List-Id: <kernel-janitors.vger.kernel.org>
References: <> <1239189748-11703-27-git-send-email-jwjstone@fastmail.fm> <1239189748-11703-28-git-send-email-jwjstone@fastmail.fm> <1239189748-11703-29-git-send-email-jwjstone@fastmail.fm> <1239189748-11703-30-git-send-email-jwjstone@fastmail.fm> <1239189748-11703-31-git-send-email-jwjstone@fastmail.fm> <1239189748-11703-32-git-send-email-jwjstone@fastmail.fm> <1239189748-11703-33-git-send-email-jwjstone@fastmail.fm> <1239189748-11703-34-git-send-email-jwjstone@fastmail.fm> <1239189748-11703-35-git-send-email-jwjstone@fastmail.fm> <1239189748-11703-36-git-send-email-jwjstone@fastmail.fm> <1239189748-11703-37-git-send-email-jwjstone@fastmail.fm> <1239189748-11703-38-git-send-email-jwjstone@fastmail.fm> <1239189748-11703-39-git-send-email-jwjstone@fastmail.fm> <1239189748-11703-40-git-send-email-jwjstone@fastmail.fm> <1239189748-11703-41-git-send-email-jwjstone@fastmail.fm> <1239189748-11703-42-git-send-email-jwjstone@fastmail.fm>
In-Reply-To: <1239189748-11703-42-git-send-email-jwjstone@fastmail.fm>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: jeff@garzik.org, kernel-janitors@vger.kernel.org, reiserfs-devel@vger.kernel.org

[Added maintainer CC]
Jack Stone wrote:
> Remove uneeded void casts
>
> Signed-Off-By: Jack Stone <jwjstone@fastmail.fm>
> ---
>  fs/reiserfs/inode.c           |    2 +-
>  fs/reiserfs/super.c           |    3 +--
>  fs/reiserfs/tail_conversion.c |    2 +-
>  3 files changed, 3 insertions(+), 4 deletions(-)
>
> diff --git a/fs/reiserfs/inode.c b/fs/reiserfs/inode.c
> index 6fd0f47..b304e16 100644
> --- a/fs/reiserfs/inode.c
> +++ b/fs/reiserfs/inode.c
> @@ -349,7 +349,7 @@ static int _get_block_create_0(struct inode *inode, sector_t block,
>  	 ** kmap schedules
>  	 */
>  	if (!p) {
> -		p = (char *)kmap(bh_result->b_page);
> +		p = kmap(bh_result->b_page);
>  		if (fs_changed(fs_gen, inode->i_sb)
>  		    && item_moved(&tmp_ih, &path)) {
>  			goto research;
> diff --git a/fs/reiserfs/super.c b/fs/reiserfs/super.c
> index 0ae6486..ada745d 100644
> --- a/fs/reiserfs/super.c
> +++ b/fs/reiserfs/super.c
> @@ -510,8 +510,7 @@ static struct kmem_cache *reiserfs_inode_cachep;
>  static struct inode *reiserfs_alloc_inode(struct super_block *sb)
>  {
>  	struct reiserfs_inode_info *ei;
> -	ei = (struct reiserfs_inode_info *)
> -	    kmem_cache_alloc(reiserfs_inode_cachep, GFP_KERNEL);
> +	ei = kmem_cache_alloc(reiserfs_inode_cachep, GFP_KERNEL);
>  	if (!ei)
>  		return NULL;
>  	return &ei->vfs_inode;
> diff --git a/fs/reiserfs/tail_conversion.c b/fs/reiserfs/tail_conversion.c
> index d7f6e51..2916393 100644
> --- a/fs/reiserfs/tail_conversion.c
> +++ b/fs/reiserfs/tail_conversion.c
> @@ -211,7 +211,7 @@ int indirect2direct(struct reiserfs_transaction_handle *th,
>  	// append can be done either
>  	// we are in truncate or packing tail in file_release
>  
> -	tail = (char *)kmap(page);	/* this can schedule */
> +	tail = kmap(page);	/* this can schedule */
>  
>  	if (path_changed(&s_ih, path)) {
>  		/* re-search indirect item */
>   

