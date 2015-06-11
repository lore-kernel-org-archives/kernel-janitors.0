From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 11 Jun 2015 11:48:28 +0000
Subject: Re: [PATCH] md: fix a build warning
Message-Id: <20150611114828.GI28762@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1433949658-8455-1-git-send-email-firogm@gmail.com>
In-Reply-To: <1433949658-8455-1-git-send-email-firogm@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Firo Yang <firogm@gmail.com>, Joe Perches <joe@perches.com>
Cc: neilb@suse.de, linux-raid@vger.kernel.org, kernel-janitors@vger.kernel.org

Hey Joe,

checkpatch.pl in linux-next is now encouraging people to make unrelated
long line fixes like the below patch.  Reverting 0b4193c79c83
('checkpatch: categorize some long line length checks') makes the new
checkpatch.pl warning go away.

regards,
dan carpenter

On Wed, Jun 10, 2015 at 11:20:58PM +0800, Firo Yang wrote:
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
>  	    mddev->chunk_sectors != info->chunk_size >> 9 ||
> -	    /* ignore bottom 8 bits of state, and allow SB_BITMAP_PRESENT to change */
> +	    /* ignore bottom 8 bits of state, and allow SB_BITMAP_PRESENT
> +		to change */
>  	    ((state^info->state) & 0xfffffe00)
>  		)
>  		return -EINVAL;
> -- 
> 2.4.2
> 
> --
> To unsubscribe from this list: send the line "unsubscribe kernel-janitors" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
