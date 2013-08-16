From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Fri, 16 Aug 2013 12:44:00 +0000
Subject: Re: [patch] USB: mos7720: use GFP_ATOMIC under spinlock
Message-Id: <20130816124400.GA15075@kroah.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130816071659.GA6053@elgon.mountain>
In-Reply-To: <20130816071659.GA6053@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Fri, Aug 16, 2013 at 12:12:10PM +0200, Johan Hovold wrote:
> On Fri, Aug 16, 2013 at 10:16:59AM +0300, Dan Carpenter wrote:
> > The write_parport_reg_nonblock() function shouldn't sleep because it's
> > called with spinlocks held.
> 
> Ouch. Thanks for catching this.
> 
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> Cc: stable@vger.kernel.org
> Acked-by: Johan Hovold <jhovold@gmail.com>
> 
> Greg, this one is needed in 3.11 (with a stable tag) as the offending
> commit ef6c8c1d ("USB: mos7720: fix broken control requests") is in
> usb-3.11-rc6.

Ok, I'll mark it as such, thanks.

greg k-h
