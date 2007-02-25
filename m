From: Greg KH <greg@kroah.com>
Date: Sun, 25 Feb 2007 05:24:25 +0000
Subject: Re: [KJ] make menuconfig -> usb dsl support
Message-Id: <20070225052425.GA24774@kroah.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1172287461.14947.6.camel@localhost>
In-Reply-To: <1172287461.14947.6.camel@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Sun, Feb 25, 2007 at 12:43:55AM +0000, David Negreira wrote:
> On Fri, 2007-02-23 at 20:27 -0800, Greg KH wrote:
> > On Sat, Feb 24, 2007 at 03:24:21AM +0000, David Negreira wrote:
> > > Hello there!
> > > 
> > > I would ask you all to do a make menuconfig, go to device drivers -> usb
> > > support -> usb dsl support
> > > If you do a search (/speedtouch) you will find that there should be an
> > > option there.
> > > 
> > > Why is that empty ? I know that some kernel versions ago it had support
> > > for an alcatel modem that i have in order to do the proper firmware
> > > loading and had full support for that modem.
> > > What happened?
> > > Should this section be removed from the kernel options ?
> > > If that is the case, can i remove it and submit a patch ?
> > 
> > Try enabling CONFIG_ATM and I think the driver option for the usb dsl
> > divers will come back :)
> > 
> > Hint, in the future, just search for the option and it will show you the
> > dependancies in the help file (for menuconfig, use '/' to search).
> > 
> > hope this helps,
> > 
> > greg k-h
> 
> Okey my error.
> 
> But as a "standard behaviour", instead of entering in the usb dls
> support and showing a blank screen, shouldn't only stay in the same
> screen? I'm asking this because this is the "standard behaviour" that i
> see in the other options and it confused me a little bit.

Possibly, if you don't like the way this works, I suggest you send a
patch to the Kconfig files to the maintainer of the driver.

thanks,

greg k-h
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
