From: walter harms <wharms@bfs.de>
Date: Wed, 10 Jun 2015 17:32:41 +0000
Subject: Re: [PATCH] md: fix a build warning
Message-Id: <557874B9.9010500@bfs.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1433949658-8455-1-git-send-email-firogm@gmail.com>
In-Reply-To: <1433949658-8455-1-git-send-email-firogm@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Firo Yang <firogm@gmail.com>
Cc: neilb@suse.de, linux-raid@vger.kernel.org, kernel-janitors@vger.kernel.org



Am 10.06.2015 17:20, schrieb Firo Yang:
> Warning like this:
> 
> drivers/md/md.c: In function ‘update_array_info’:
> drivers/md/md.c:6394:26: warning: logical not is only applied
> to the left hand side of comparison [-Wlogical-not-parentheses]
>       !mddev->persistent  != info->not_persistent||
> 
> I fix it by enclosing !mddev->persistent with parentheses
> 
> By the way, I also fixed a line over 80 characters warning outputed
> by ./scripts/checkpatch.pl
> 
> Signed-off-by: Firo Yang <firogm@gmail.com>
> ---
>  drivers/md/md.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/md/md.c b/drivers/md/md.c
> index dd85be9..b420d82 100644
> --- a/drivers/md/md.c
> +++ b/drivers/md/md.c
> @@ -6391,9 +6391,10 @@ static int update_array_info(struct mddev *mddev, mdu_array_info_t *info)
>  	    mddev->ctime         != info->ctime         ||
>  	    mddev->level         != info->level         ||
>  /*	    mddev->layout        != info->layout        || */
> -	    !mddev->persistent	 != info->not_persistent||
> +	    (!mddev->persistent) != info->not_persistent ||


this looks odd,
would it be possible the check for = instead (and drop the !) ?
and it someone care for readability: It would be helpful to
make some more ifs here.

re,
 wh

>  	    mddev->chunk_sectors != info->chunk_size >> 9 ||
> -	    /* ignore bottom 8 bits of state, and allow SB_BITMAP_PRESENT to change */
> +	    /* ignore bottom 8 bits of state, and allow SB_BITMAP_PRESENT
> +		to change */
>  	    ((state^info->state) & 0xfffffe00)
>  		)
>  		return -EINVAL;
