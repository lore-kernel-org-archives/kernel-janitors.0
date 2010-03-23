From: Andrew Morton <akpm@linux-foundation.org>
Date: Tue, 23 Mar 2010 03:14:41 +0000
Subject: Re: [PATCH] drivers/media/video: avoid NULL dereference
Message-Id: <20100322231441.b7e33bf9.akpm@linux-foundation.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.1003212230380.12371@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.1003212230380.12371@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>
Cc: Mark McClelland <mmcclell@bigfoot.com>, Mauro Carvalho Chehab <mchehab@infradead.org>, linux-usb@vger.kernel.org, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Sun, 21 Mar 2010 22:31:06 +0100 (CET) Julia Lawall <julia@diku.dk> wrote:

> From: Julia Lawall <julia@diku.dk>
> 
> If ov is NULL, it will not be possible to take the lock in the first place,
> so move the test up earlier.
> 
> ...
>
> --- a/drivers/media/video/ov511.c
> +++ b/drivers/media/video/ov511.c
> @@ -5913,14 +5913,12 @@ ov51x_disconnect(struct usb_interface *intf)
>  
>  	PDEBUG(3, "");
>  
> +	if (!ov)
> +		return;
> +
>  	mutex_lock(&ov->lock);
>  	usb_set_intfdata (intf, NULL);
>  
> -	if (!ov) {
> -		mutex_unlock(&ov->lock);
> -		return;
> -	}
> -
>  	/* Free device number */
>  	ov511_devused &= ~(1 << ov->nr);

I think we can pretty safely assume that we never get here with ov=NULL.

Oh well, I'll leave the test there for others to ponder.
