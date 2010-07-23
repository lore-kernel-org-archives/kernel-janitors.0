From: Jiri Slaby <jirislaby@gmail.com>
Date: Fri, 23 Jul 2010 19:18:51 +0000
Subject: Re: [PATCH] char: mxser: remove unnesesary NULL check
Message-Id: <4C49EB1B.1030700@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1279902893-27006-1-git-send-email-segooon@gmail.com>
In-Reply-To: <1279902893-27006-1-git-send-email-segooon@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kulikov Vasiliy <segooon@gmail.com>
Cc: kernel-janitors@vger.kernel.org, Greg Kroah-Hartman <gregkh@suse.de>, Alan Cox <alan@linux.intel.com>, Andrew Morton <akpm@linux-foundation.org>, Tejun Heo <tj@kernel.org>, linux-kernel@vger.kernel.org

On 07/23/2010 06:34 PM, Kulikov Vasiliy wrote:
> mxser_transmit_chars(tty, port) is called only from mxser_interrupt().
> NULL check is performed in mxser_interrupt() so it is redundant here.
> 
> Signed-off-by: Kulikov Vasiliy <segooon@gmail.com>

Acked-by: Jiri Slaby <jirislaby@gmail.com>

> ---
>  drivers/char/mxser.c |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/drivers/char/mxser.c b/drivers/char/mxser.c
> index d2692d4..3fc89da 100644
> --- a/drivers/char/mxser.c
> +++ b/drivers/char/mxser.c
> @@ -2193,7 +2193,7 @@ static void mxser_transmit_chars(struct tty_struct *tty, struct mxser_port *port
>  	port->mon_data.up_txcnt += (cnt - port->xmit_cnt);
>  	port->icount.tx += (cnt - port->xmit_cnt);
>  
> -	if (port->xmit_cnt < WAKEUP_CHARS && tty)
> +	if (port->xmit_cnt < WAKEUP_CHARS)
>  		tty_wakeup(tty);
>  
>  	if (port->xmit_cnt <= 0) {


-- 
js
