From: Jiri Slaby <jslaby@suse.cz>
Date: Thu, 04 Aug 2016 06:24:50 +0000
Subject: Re: [patch] tty: amiserial.c: remove a double irq restore
Message-Id: <41427059-b5e4-1b30-e577-5a1cf3f81b29@suse.cz>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160804053403.GL775@mwanda>
In-Reply-To: <20160804053403.GL775@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 08/04/2016, 07:34 AM, Dan Carpenter wrote:
> We already called "local_irq_restore(flags);" so this isn't needed.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> diff --git a/drivers/tty/amiserial.c b/drivers/tty/amiserial.c
> index 208f573..2f33cf1 100644
> --- a/drivers/tty/amiserial.c
> +++ b/drivers/tty/amiserial.c
> @@ -880,7 +880,6 @@ static int rs_write(struct tty_struct * tty, const unsigned char *buf, int count

If I add a bit more context:

                local_irq_disable();
                custom.intena = IF_SETCLR | IF_TBE;
                mb();
>  		/* set a pending Tx Interrupt, transmitter should restart now */
>  		custom.intreq = IF_SETCLR | IF_TBE;
>  		mb();
> -		local_irq_restore(flags);

Really?

thanks,
-- 
js
suse labs
