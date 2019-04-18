From: Nikolay Borisov <nborisov@suse.com>
Date: Thu, 18 Apr 2019 06:37:57 +0000
Subject: Re: [PATCH -next] btrfs: Remove set but not used variable 'fs_info'
Message-Id: <0d280de4-9ef4-1531-5bad-22ea15cc150c@suse.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190418064356.10418-1-yuehaibing@huawei.com>
In-Reply-To: <20190418064356.10418-1-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: YueHaibing <yuehaibing@huawei.com>, Chris Mason <clm@fb.com>, Josef Bacik <josef@toxicpanda.com>, David Sterba <dsterba@suse.com>
Cc: linux-btrfs@vger.kernel.org, kernel-janitors@vger.kernel.org



On 18.04.19 г. 9:43 ч., YueHaibing wrote:
> Fixes gcc '-Wunused-but-set-variable' warning:
> 
> fs/btrfs/free-space-tree.c: In function 'load_free_space_tree':
> fs/btrfs/free-space-tree.c:1535:24: warning:
>  variable 'fs_info' set but not used [-Wunused-but-set-variable]
> 
> It's not used since commit 05e9d3137d47 ("btrfs: get fs_info from block group
> in search_free_space_info"),  so can be removed.
> 
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> ---
>  fs/btrfs/free-space-tree.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/fs/btrfs/free-space-tree.c b/fs/btrfs/free-space-tree.c
> index cfe9dfb0ff05..f5dc115ebba0 100644
> --- a/fs/btrfs/free-space-tree.c
> +++ b/fs/btrfs/free-space-tree.c
> @@ -1532,14 +1532,12 @@ static int load_free_space_extents(struct btrfs_caching_control *caching_ctl,
>  int load_free_space_tree(struct btrfs_caching_control *caching_ctl)
>  {
>  	struct btrfs_block_group_cache *block_group;
> -	struct btrfs_fs_info *fs_info;
>  	struct btrfs_free_space_info *info;
>  	struct btrfs_path *path;
>  	u32 extent_count, flags;
>  	int ret;
>  
>  	block_group = caching_ctl->block_group;
> -	fs_info = block_group->fs_info;

What version is this patch based on? In current misc-next ( on which new
patches ought to be based  and can be found at: currently has:

fs_info = block_group->fs_info;
root = fs_info->free_space_root;

......

if (extent_count != expected_extent_count) {
                  btrfs_err(fs_info,

                            "incorrect extent count for %llu; counted
%u, expected %u",
                            block_group->key.objectid, extent_count,

                            expected_extent_count);

In short: nack

>  
>  	path = btrfs_alloc_path();
>  	if (!path)
> 
> 
> 
> 
