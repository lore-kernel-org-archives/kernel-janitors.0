From: Jan Kara <jack@suse.cz>
Date: Wed, 04 Sep 2019 07:23:33 +0000
Subject: Re: [PATCH] ext2: Delete an unnecessary check before brelse()
Message-Id: <20190904072333.GB8225@quack2.suse.cz>
List-Id: <kernel-janitors.vger.kernel.org>
References: <51dea296-2207-ebc0-bac3-13f3e5c3b235@web.de>
In-Reply-To: <51dea296-2207-ebc0-bac3-13f3e5c3b235@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Jan Kara <jack@suse.com>, linux-ext4@vger.kernel.org, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Tue 03-09-19 14:44:08, Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Tue, 3 Sep 2019 14:40:18 +0200
> 
> The brelse() function tests whether its argument is NULL
> and then returns immediately.
> Thus the test around the call is not needed.
> 
> This issue was detected by using the Coccinelle software.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

Thanks. Added to my tree.

								Honza

> ---
>  fs/ext2/super.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/fs/ext2/super.c b/fs/ext2/super.c
> index baa36c6fb71e..30c630d73f0f 100644
> --- a/fs/ext2/super.c
> +++ b/fs/ext2/super.c
> @@ -162,8 +162,7 @@ static void ext2_put_super (struct super_block * sb)
>  	}
>  	db_count = sbi->s_gdb_count;
>  	for (i = 0; i < db_count; i++)
> -		if (sbi->s_group_desc[i])
> -			brelse (sbi->s_group_desc[i]);
> +		brelse(sbi->s_group_desc[i]);
>  	kfree(sbi->s_group_desc);
>  	kfree(sbi->s_debts);
>  	percpu_counter_destroy(&sbi->s_freeblocks_counter);
> --
> 2.23.0
> 
> 
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR
