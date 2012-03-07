From: Jiri Slaby <jslaby@suse.cz>
Date: Wed, 07 Mar 2012 12:26:38 +0000
Subject: Re: [patch] tty: moxa: fix bit test in moxa_start()
Message-Id: <4F5753FE.4080909@suse.cz>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120307100500.GD25452@elgon.mountain>
In-Reply-To: <20120307100500.GD25452@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Alan Cox <alan@lxorguk.ukuu.org.uk>, Jiri Slaby <jirislaby@gmail.com>

On 03/07/2012 11:05 AM, Dan Carpenter wrote:
> This is supposed to be doing a shift before the comparison instead of
> just doing a bitwise AND directly.  The current code means the start()
> just returns without doing anything.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

ACK.

It was introduced by this commit which forgot to change that location:
commit a808ac0c4a2c5d81ba38a2a76d4ddc1de40d1539
Author: Alan Cox <alan@linux.intel.com>
Date:   Mon Nov 30 13:18:02 2009 +0000

    tty: moxa: Locking clean up

> diff --git a/drivers/tty/moxa.c b/drivers/tty/moxa.c
> index d15a071..0174d2d 100644
> --- a/drivers/tty/moxa.c
> +++ b/drivers/tty/moxa.c
> @@ -1331,7 +1331,7 @@ static void moxa_start(struct tty_struct *tty)
>  	if (ch = NULL)
>  		return;
>  
> -	if (!(ch->statusflags & TXSTOPPED))
> +	if (!test_bit(TXSTOPPED, &ch->statusflags))
>  		return;
>  
>  	MoxaPortTxEnable(ch);

thanks,
-- 
js
suse labs
