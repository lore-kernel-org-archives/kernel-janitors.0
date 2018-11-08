From: Nikolay Borisov <nborisov@suse.com>
Date: Thu, 08 Nov 2018 06:54:44 +0000
Subject: Re: [PATCH -next] btrfs: compression: remove set but not used variable 'tree'
Message-Id: <14010d1d-1379-c871-c43d-f270ba566279@suse.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1541643315-109723-1-git-send-email-yuehaibing@huawei.com>
In-Reply-To: <1541643315-109723-1-git-send-email-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: YueHaibing <yuehaibing@huawei.com>, Chris Mason <clm@fb.com>, Josef Bacik <josef@toxicpanda.com>, David Sterba <dsterba@suse.com>
Cc: linux-btrfs@vger.kernel.org, kernel-janitors@vger.kernel.org



On 8.11.18 г. 4:15 ч., YueHaibing wrote:
> Fixes gcc '-Wunused-but-set-variable' warning:
> 
> fs/btrfs/compression.c: In function 'end_compressed_bio_write':
> fs/btrfs/compression.c:232:25: warning:
>  variable 'tree' set but not used [-Wunused-but-set-variable]
> 
> It not used any more after
> commit 2922040236f9 ("btrfs: Remove extent_io_ops::writepage_end_io_hook")
> 
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>

Reviewed-by: Nikolay Borisov <nborisov@suse.com>

> ---
>  fs/btrfs/compression.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/fs/btrfs/compression.c b/fs/btrfs/compression.c
> index bde8d04..088570c 100644
> --- a/fs/btrfs/compression.c
> +++ b/fs/btrfs/compression.c
> @@ -229,7 +229,6 @@ static noinline void end_compressed_writeback(struct inode *inode,
>   */
>  static void end_compressed_bio_write(struct bio *bio)
>  {
> -	struct extent_io_tree *tree;
>  	struct compressed_bio *cb = bio->bi_private;
>  	struct inode *inode;
>  	struct page *page;
> @@ -248,7 +247,6 @@ static void end_compressed_bio_write(struct bio *bio)
>  	 * call back into the FS and do all the end_io operations
>  	 */
>  	inode = cb->inode;
> -	tree = &BTRFS_I(inode)->io_tree;
>  	cb->compressed_pages[0]->mapping = cb->inode->i_mapping;
>  	btrfs_writepage_endio_finish_ordered(cb->compressed_pages[0],
>  			cb->start, cb->start + cb->len - 1, NULL,
> 
> 
> 
> 
