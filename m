From: Nikolay Borisov <nborisov@suse.com>
Date: Wed, 05 Aug 2020 10:34:04 +0000
Subject: Re: [PATCH] btrfs: Fix an error pointer vs NULL check
Message-Id: <8b663082-a71f-d2ae-c218-3abd8e57f1f3@suse.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200805095147.GB483832@mwanda>
In-Reply-To: <20200805095147.GB483832@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Chris Mason <clm@fb.com>, Josef Bacik <josef@toxicpanda.com>
Cc: David Sterba <dsterba@suse.com>, linux-btrfs@vger.kernel.org, kernel-janitors@vger.kernel.org



On 5.08.20 г. 12:51 ч., Dan Carpenter wrote:
> The btrfs_get_subvol_name_from_objectid() function never
> returns NULL, it returns error pointers.  Update the check
> accordinglingly to prevent an Oops.
> 
> Fixes: ca346708eb17 ("btrfs: don't show full path of bind mounts in subvol=")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Reviewed-by: Nikolay Borisov <nborisov@suse.com>

> ---
>  fs/btrfs/super.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/fs/btrfs/super.c b/fs/btrfs/super.c
> index 53639de3a064..e529ddb35b87 100644
> --- a/fs/btrfs/super.c
> +++ b/fs/btrfs/super.c
> @@ -1475,7 +1475,7 @@ static int btrfs_show_options(struct seq_file *seq, struct dentry *dentry)
>  		  BTRFS_I(d_inode(dentry))->root->root_key.objectid);
>  	subvol_name = btrfs_get_subvol_name_from_objectid(info,
>  			BTRFS_I(d_inode(dentry))->root->root_key.objectid);
> -	if (subvol_name) {
> +	if (!IS_ERR(subvol_name)) {
>  		seq_puts(seq, ",subvol=");
>  		seq_escape(seq, subvol_name, " \t\n\\");
>  		kfree(subvol_name);
> 
