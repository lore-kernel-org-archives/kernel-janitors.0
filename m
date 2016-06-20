From: Jan Kara <jack@suse.cz>
Date: Mon, 20 Jun 2016 16:02:04 +0000
Subject: Re: [patch] ext4: underflow in alignment check
Message-Id: <20160620160204.GG6882@quack2.suse.cz>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160616070709.GC23129@mwanda>
In-Reply-To: <20160616070709.GC23129@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Theodore Ts'o <tytso@mit.edu>, Andreas Dilger <adilger.kernel@dilger.ca>, linux-ext4@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Thu 16-06-16 10:07:09, Dan Carpenter wrote:
> My static checker complains that this can underflow if arg is negative
> which is true.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

How come? (1 << 30) fits even into 32-bit signed type. So where's the
problem?

								Honza

> diff --git a/fs/ext4/super.c b/fs/ext4/super.c
> index b1a3471..a2a17e9 100644
> --- a/fs/ext4/super.c
> +++ b/fs/ext4/super.c
> @@ -1576,7 +1576,7 @@ static int handle_mount_opt(struct super_block *sb, char *opt, int token,
>  	} else if (token = Opt_min_batch_time) {
>  		sbi->s_min_batch_time = arg;
>  	} else if (token = Opt_inode_readahead_blks) {
> -		if (arg && (arg > (1 << 30) || !is_power_of_2(arg))) {
> +		if (arg && (arg > (1U << 30) || !is_power_of_2(arg))) {
>  			ext4_msg(sb, KERN_ERR,
>  				 "EXT4-fs: inode_readahead_blks must be "
>  				 "0 or a power of 2 smaller than 2^31");
> --
> To unsubscribe from this list: send the line "unsubscribe linux-ext4" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR
