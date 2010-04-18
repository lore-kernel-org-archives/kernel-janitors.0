From: Dan Carpenter <error27@gmail.com>
Date: Sun, 18 Apr 2010 18:38:52 +0000
Subject: Re: [PATCH] mmc: sd: Cleanup redundant memset
Message-Id: <20100418183851.GA5394@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1270687256-17061-1-git-send-email-asselsm@gmail.com>
In-Reply-To: <1270687256-17061-1-git-send-email-asselsm@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Wed, Apr 07, 2010 at 08:40:56PM -0400, Mark Asselstine wrote:
> The clearing of mrq via a memset at the top of the for loop in
> mmc_wait_for_app_cmd() is not required as mrq is not used and
> there is another clearing of mrq just below. We remove the first
> memset since if the initial tests in the for loop fail the memset
> is not required.
> 

This patch is good.

MMC is orphan, but there is a mailing list.  

Does anyone on kernel-janitors actually collect patches?  Otherwise if you
send this to lkml Andrew Morton quite often picks these up.

regards,
dan carpenter

> Signed-off-by: Mark Asselstine <asselsm@gmail.com>
> ---
>  drivers/mmc/core/sd_ops.c |    2 --
>  1 files changed, 0 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mmc/core/sd_ops.c b/drivers/mmc/core/sd_ops.c
> index 0d96080..63772e7 100644
> --- a/drivers/mmc/core/sd_ops.c
> +++ b/drivers/mmc/core/sd_ops.c
> @@ -79,8 +79,6 @@ int mmc_wait_for_app_cmd(struct mmc_host *host, struct mmc_card *card,
>  	 * we cannot use the retries field in mmc_command.
>  	 */
>  	for (i = 0;i <= retries;i++) {
> -		memset(&mrq, 0, sizeof(struct mmc_request));
> -
>  		err = mmc_app_cmd(host, card);
>  		if (err) {
>  			/* no point in retrying; no APP commands allowed */
> -- 
> 1.7.0
> 
> --
> To unsubscribe from this list: send the line "unsubscribe kernel-janitors" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
