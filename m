From: Luis de Bethencourt <luisbg@osg.samsung.com>
Date: Fri, 08 Jul 2016 17:58:06 +0000
Subject: Re: [PATCH 01/15 RESEND] staging: dgnc: remove redundant NULL checks in
Message-Id: <577FE9AE.1010104@osg.samsung.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160704113645.GA10177@SEL-JYOUN-D1>
In-Reply-To: <20160704113645.GA10177@SEL-JYOUN-D1>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Daeseok Youn <daeseok.youn@gmail.com>, lidza.louina@gmail.com
Cc: devel@driverdev.osuosl.org, gregkh@linuxfoundation.org, driverdev-devel@linuxdriverproject.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 04/07/16 12:36, Daeseok Youn wrote:
> The dgnc_block_til_ready() is only used in dgnc_tty_open().
> The unit data(struct un_t) was stored into tty->driver_data in dgnc_tty_open().
> And also tty and un were tested about NULL so these variables doesn't
> need to check for NULL in dgnc_block_til_ready().
> 
> Signed-off-by: Daeseok Youn <daeseok.youn@gmail.com>
> ---
> This patch seems to be missed for a long time.
> I resend this patch without any updates.
> 
>  drivers/staging/dgnc/dgnc_tty.c | 9 ++-------
>  1 file changed, 2 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/staging/dgnc/dgnc_tty.c b/drivers/staging/dgnc/dgnc_tty.c
> index 4eeecc9..6758859 100644
> --- a/drivers/staging/dgnc/dgnc_tty.c
> +++ b/drivers/staging/dgnc/dgnc_tty.c
> @@ -1172,17 +1172,12 @@ static int dgnc_block_til_ready(struct tty_struct *tty,
>  				struct channel_t *ch)
>  {
>  	int retval = 0;
> -	struct un_t *un = NULL;
> +	struct un_t *un = tty->driver_data;
>  	unsigned long flags;
>  	uint	old_flags = 0;
>  	int	sleep_on_un_flags = 0;
>  
> -	if (!tty || tty->magic != TTY_MAGIC || !file || !ch ||
> -	    ch->magic != DGNC_CHANNEL_MAGIC)
> -		return -ENXIO;
> -
> -	un = tty->driver_data;
> -	if (!un || un->magic != DGNC_UNIT_MAGIC)
> +	if (!file)
>  		return -ENXIO;
>  
>  	spin_lock_irqsave(&ch->ch_lock, flags);
> 

Hi,

Just curious. Are you confident of removing the tty->magic != TTY_MAGIC check?

From what I've seen that one can catch potential errors. I might be wrong.

Thanks,
Luis
