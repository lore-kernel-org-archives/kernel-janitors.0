From: Johan Hovold <jhovold@gmail.com>
Date: Thu, 27 May 2010 13:15:39 +0000
Subject: Re: [PATCH 11/11] drivers/usb/serial: Eliminate a NULL pointer
Message-Id: <20100527131539.GA26198@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.1005271437200.5422@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.1005271437200.5422@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>
Cc: Greg Kroah-Hartman <gregkh@suse.de>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Hi Julia, 

On Thu, May 27, 2010 at 02:37:39PM +0200, Julia Lawall wrote:
> From: Julia Lawall <julia@diku.dk>
> 
> The assignment seems completely unnecessary if mos7840_port is NULL.
> 
[...]
> ---
>  drivers/usb/serial/mos7840.c |    1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/usb/serial/mos7840.c b/drivers/usb/serial/mos7840.c
> index f8424d1..585b7e6 100644
> --- a/drivers/usb/serial/mos7840.c
> +++ b/drivers/usb/serial/mos7840.c
> @@ -730,7 +730,6 @@ static void mos7840_bulk_in_callback(struct urb *urb)
>  	mos7840_port = urb->context;
>  	if (!mos7840_port) {
>  		dbg("%s", "NULL mos7840_port pointer");
> -		mos7840_port->read_urb_busy = false;
>  		return;
>  	}

I stumbled over this one a couple of weeks ago. There a patch sitting in
Greg's queue already:

	http://thread.gmane.org/gmane.linux.usb.general/31668

Thanks,
Johan
