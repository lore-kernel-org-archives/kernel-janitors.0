From: Joe Perches <joe@perches.com>
Date: Tue, 28 Feb 2017 22:23:50 +0000
Subject: Re: [patch] net/mlx4: && vs & typo
Message-Id: <1488320630.25838.39.camel@perches.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170228120215.GA27947@mwanda>
         <1488296129.3056.1.camel@sandisk.com>
In-Reply-To: <1488296129.3056.1.camel-XdAiOPVOjttBDgjK7y7TUQ@public.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bart Van Assche <Bart.VanAssche-XdAiOPVOjttBDgjK7y7TUQ@public.gmane.org>, "eugenia-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org" <eugenia-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>, "dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org" <dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>, "yishaih-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org" <yishaih-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>
Cc: "netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-rdma-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-rdma-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>

On Tue, 2017-02-28 at 15:35 +0000, Bart Van Assche wrote:
> On Tue, 2017-02-28 at 15:02 +0300, Dan Carpenter wrote:
> > Bitwise & was obviously intended here.
[]
> > diff --git a/include/linux/mlx4/driver.h b/include/linux/mlx4/driver.h
[]
> > @@ -109,7 +109,7 @@ static inline void 	(u8 *addr, u64 mac)
> >  	int i;
> >  
> >  	for (i = ETH_ALEN; i > 0; i--) {
> > -		addr[i - 1] = mac && 0xFF;
> > +		addr[i - 1] = mac & 0xFF;
> >  		mac >>= 8;
> >  	}
> >  }
> 
> Is this the only place where such a loop occurs?

Seems to be.

> Should a put_unaligned_be48()
> function be introduced?

Why?  This is used exactly once.

