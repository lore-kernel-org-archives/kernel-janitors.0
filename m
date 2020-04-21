From: Qu Wenruo <wqu@suse.com>
Date: Tue, 21 Apr 2020 12:48:28 +0000
Subject: Re: [PATCH][next] btrfs: fix check for memory allocation failure of ret->path
Message-Id: <a6b24f6e-1611-91a9-2f02-ff852af0b51a@suse.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200421124703.149466-1-colin.king@canonical.com>
In-Reply-To: <20200421124703.149466-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Colin King <colin.king@canonical.com>, Chris Mason <clm@fb.com>, Josef Bacik <josef@toxicpanda.com>, David Sterba <dsterba@suse.com>, Johannes Thumshirn <johannes.thumshirn@wdc.com>, linux-btrfs@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org



On 2020/4/21 下午8:47, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Currently the memory allocation failure check for ret->path is checking
> that ret is null rather than ret->path.  Fix this by checking ret->path
> instead.
> 
> Addresses-Coverity: ("Dereference null return")
> Fixes: bd8bdc532152 ("btrfs: backref: introduce the skeleton of btrfs_backref_iter")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

My bad.

Reviewed-by: Qu Wenruo <wqu@suse.com>

Thanks,
Qu
> ---
>  fs/btrfs/backref.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/fs/btrfs/backref.c b/fs/btrfs/backref.c
> index 60a69f7c0b36..78e6c9a64212 100644
> --- a/fs/btrfs/backref.c
> +++ b/fs/btrfs/backref.c
> @@ -2307,7 +2307,7 @@ struct btrfs_backref_iter *btrfs_backref_iter_alloc(
>  		return NULL;
>  
>  	ret->path = btrfs_alloc_path();
> -	if (!ret) {
> +	if (!ret->path) {
>  		kfree(ret);
>  		return NULL;
>  	}
> 
