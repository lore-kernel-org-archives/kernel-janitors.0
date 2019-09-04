From: Jan Kara <jack@suse.cz>
Date: Wed, 04 Sep 2019 07:48:30 +0000
Subject: Re: [PATCH] fs-udf: Delete an unnecessary check before brelse()
Message-Id: <20190904074830.GD8225@quack2.suse.cz>
List-Id: <kernel-janitors.vger.kernel.org>
References: <a254c1d1-0109-ab51-c67a-edc5c1c4b4cd@web.de>
In-Reply-To: <a254c1d1-0109-ab51-c67a-edc5c1c4b4cd@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Jan Kara <jack@suse.com>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Tue 03-09-19 21:15:58, Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Tue, 3 Sep 2019 21:12:09 +0200
> 
> The brelse() function tests whether its argument is NULL
> and then returns immediately.
> Thus the test around the call is not needed.
> 
> This issue was detected by using the Coccinelle software.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

Thanks for the patch. Added to my tree.

								Honza

> ---
>  fs/udf/super.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/fs/udf/super.c b/fs/udf/super.c
> index 56da1e1680ea..0cd0be642a2f 100644
> --- a/fs/udf/super.c
> +++ b/fs/udf/super.c
> @@ -273,8 +273,7 @@ static void udf_sb_free_bitmap(struct udf_bitmap *bitmap)
>  	int nr_groups = bitmap->s_nr_groups;
> 
>  	for (i = 0; i < nr_groups; i++)
> -		if (bitmap->s_block_bitmap[i])
> -			brelse(bitmap->s_block_bitmap[i]);
> +		brelse(bitmap->s_block_bitmap[i]);
> 
>  	kvfree(bitmap);
>  }
> --
> 2.23.0
> 
> 
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR
