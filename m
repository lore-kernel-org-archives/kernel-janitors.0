From: <Woojung.Huh@microchip.com>
Date: Mon, 03 Aug 2015 15:48:25 +0000
Subject: RE: Microchip's LAN7800 family USB 2/3 to 10/100/1000 Ethernet device driver
Message-Id: <9235D6609DB808459E95D78E17F2E43D53A3A9@CHN-SV-EXMX02.mchp-main.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150803153921.GA13117@mwanda>
In-Reply-To: <20150803153921.GA13117@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Dan,

Thanks for comments.
I'll look into it and get back to you.

Where do I post patches?

Thanks,
Woojung

> -----Original Message-----
> From: Dan Carpenter [mailto:dan.carpenter@oracle.com]
> Sent: Monday, August 03, 2015 11:47 AM
> To: Woojung Huh - C21699
> Cc: kernel-janitors@vger.kernel.org
> Subject: Re: Microchip's LAN7800 family USB 2/3 to 10/100/1000 Ethernet
> device driver
> 
> There are some other Smatch warnings as well:
> 
> drivers/net/usb/lan78xx.c:2302 lan78xx_start_xmit() error: we previously
> assumed 'skb' could be null (see line 2299)
> skb is dereferenced inside the function call.
> 
> drivers/net/usb/lan78xx.c:2885 lan78xx_bh() info: ignoring unreachable code.
> drivers/net/usb/lan78xx.c:3159 lan78xx_probe() info: ignoring unreachable
> code.
> 
> These are calls to BUG_ON().  You should just delete it, network
> drivers shouldn't call BUG_ON(), at most they should call WARN_ON().
> 
> regards,
> dan carpenter

