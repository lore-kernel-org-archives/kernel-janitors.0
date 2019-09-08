From: OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>
Date: Sun, 08 Sep 2019 10:22:27 +0000
Subject: Re: [PATCH] fat: Delete an unnecessary check before brelse()
Message-Id: <87r24rxf30.fsf@mail.parknet.co.jp>
List-Id: <kernel-janitors.vger.kernel.org>
References: <cfff3b81-fb5d-af26-7b5e-724266509045@web.de>
In-Reply-To: <cfff3b81-fb5d-af26-7b5e-724266509045@web.de> (Markus Elfring's
        message of "Tue, 3 Sep 2019 15:00:11 +0200")
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Markus Elfring <Markus.Elfring@web.de>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

Markus Elfring <Markus.Elfring@web.de> writes:

> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Tue, 3 Sep 2019 14:56:16 +0200
>
> The brelse() function tests whether its argument is NULL
> and then returns immediately.
> Thus the test around the call is not needed.
>
> This issue was detected by using the Coccinelle software.
>
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

Acked-by: OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>

Thanks.

> ---
>  fs/fat/dir.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/fs/fat/dir.c b/fs/fat/dir.c
> index 1bda2ab6745b..f4bc87a3c98d 100644
> --- a/fs/fat/dir.c
> +++ b/fs/fat/dir.c
> @@ -88,9 +88,7 @@ static int fat__get_entry(struct inode *dir, loff_t *pos,
>  	int err, offset;
>
>  next:
> -	if (*bh)
> -		brelse(*bh);
> -
> +	brelse(*bh);
>  	*bh = NULL;
>  	iblock = *pos >> sb->s_blocksize_bits;
>  	err = fat_bmap(dir, iblock, &phys, &mapped_blocks, 0, false);
> --
> 2.23.0
>

-- 
OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>
