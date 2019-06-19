From: Jan Kara <jack@suse.cz>
Date: Wed, 19 Jun 2019 11:13:57 +0000
Subject: Re: [PATCH] ext4: remove redundant assignment to node
Message-Id: <20190619111357.GD32409@quack2.suse.cz>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190619090007.26962-1-colin.king@canonical.com>
In-Reply-To: <20190619090007.26962-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Theodore Ts'o <tytso@mit.edu>, Andreas Dilger <adilger.kernel@dilger.ca>, linux-ext4@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed 19-06-19 10:00:06, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Pointer 'node' is assigned a value that is never read, node is
> later overwritten when it re-assigned a different value inside
> the while-loop.  The assignment is redundant and can be removed.
> 
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Looks good to me. You can add:

Reviewed-by: Jan Kara <jack@suse.cz>

								Honza

> ---
>  fs/ext4/extents_status.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/fs/ext4/extents_status.c b/fs/ext4/extents_status.c
> index 023a3eb3afa3..7521de2dcf3a 100644
> --- a/fs/ext4/extents_status.c
> +++ b/fs/ext4/extents_status.c
> @@ -1317,7 +1317,6 @@ static int es_do_reclaim_extents(struct ext4_inode_info *ei, ext4_lblk_t end,
>  	es = __es_tree_search(&tree->root, ei->i_es_shrink_lblk);
>  	if (!es)
>  		goto out_wrap;
> -	node = &es->rb_node;
>  	while (*nr_to_scan > 0) {
>  		if (es->es_lblk > end) {
>  			ei->i_es_shrink_lblk = end + 1;
> -- 
> 2.20.1
> 
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR
