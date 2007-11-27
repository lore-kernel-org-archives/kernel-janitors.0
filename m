From: Greg KH <greg@kroah.com>
Date: Tue, 27 Nov 2007 06:48:09 +0000
Subject: Re: [PATCH 3/4] drivers/usb: Drop unnecessary continue
Message-Id: <20071127064809.GA7571@kroah.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0711140914360.26019@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.0711140914360.26019@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>
Cc: gregkh@suse.de, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, Nov 14, 2007 at 09:15:16AM +0100, Julia Lawall wrote:
> diff -u -p -b -B a/drivers/usb/host/isp116x-hcd.c b/drivers/usb/host/isp116x-hcd.c
> --- a/drivers/usb/host/isp116x-hcd.c 2007-10-22 11:25:24.000000000 +0200
> +++ b/drivers/usb/host/isp116x-hcd.c 2007-11-13 23:14:10.000000000 +0100
> @@ -918,7 +918,6 @@ static int isp116x_hub_status_data(struc
>   			      | RH_PS_OCIC | RH_PS_PRSC)) {
>   			changed = 1;
>   			buf[0] |= 1 << (i + 1);
> -			continue;
>   		}
>   	}
>   	spin_unlock_irqrestore(&isp116x->lock, flags);

Your email client is eating all the tabs and converting them to spaces,
making these patches very hard to apply.

I've fixed this one up by hand, but please, fix your email client for
future ones.

thanks,

greg k-h
