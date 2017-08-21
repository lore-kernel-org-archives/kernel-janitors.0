From: Jan Kara <jack@suse.cz>
Date: Mon, 21 Aug 2017 14:03:49 +0000
Subject: Re: [PATCH] quota_v2: Delete an error message for a failed memory allocation in v2_read_file_info()
Message-Id: <20170821140349.GA31870@quack2.suse.cz>
List-Id: <kernel-janitors.vger.kernel.org>
References: <8916fd8c-2f13-e343-d648-1174563e9c38@users.sourceforge.net>
In-Reply-To: <8916fd8c-2f13-e343-d648-1174563e9c38@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: Jan Kara <jack@suse.com>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Wed 16-08-17 16:41:00, SF Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Wed, 16 Aug 2017 16:16:30 +0200
> 
> Omit an extra message for a memory allocation failure in this function.
> 
> This issue was detected by using the Coccinelle software.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

OK, applied the patch to my tree. Thanks.

								Honza

> ---
>  fs/quota/quota_v2.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/fs/quota/quota_v2.c b/fs/quota/quota_v2.c
> index ca71bf881ad1..2259329616b7 100644
> --- a/fs/quota/quota_v2.c
> +++ b/fs/quota/quota_v2.c
> @@ -109,11 +109,9 @@ static int v2_read_file_info(struct super_block *sb, int type)
>  		return -1;
>  	}
>  	info->dqi_priv = kmalloc(sizeof(struct qtree_mem_dqinfo), GFP_NOFS);
> -	if (!info->dqi_priv) {
> -		printk(KERN_WARNING
> -		       "Not enough memory for quota information structure.\n");
> +	if (!info->dqi_priv)
>  		return -ENOMEM;
> -	}
> +
>  	qinfo = info->dqi_priv;
>  	if (version = 0) {
>  		/* limits are stored as unsigned 32-bit data */
> -- 
> 2.14.0
> 
> 
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR
