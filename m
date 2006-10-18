From: Greg KH <greg@kroah.com>
Date: Wed, 18 Oct 2006 21:23:36 +0000
Subject: Re: [KJ] [PATCH 2.6.19-rc2] drivers/usb/serial/mos7840.c: check
Message-Id: <20061018212336.GB5206@kroah.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20061015225513.f35312ec.amit2030@gmail.com>
In-Reply-To: <20061015225513.f35312ec.amit2030@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Mon, Oct 16, 2006 at 11:33:50PM -0700, Amit Choudhary wrote:
> 
> 
> 
> > > @@ -475,6 +475,14 @@ static int mos7840_get_reg(struct moschi
> > >  	int ret = 0;
> > >  	buffer = (__u8 *) mcs->ctrl_buf;
> > >  
> > > +	/* The memory for ctrl_buf is allocated in
> > > +	 * mos7840_startup(), but it is not checked if
> > > +	 * kmalloc failed. So, mcs->ctrl_buf might be NULL.
> > > +	 * So, it should be checked here.
> > > +	 */
> > > +	if (!buffer)
> > > +		return -ENOMEM;
> > 
> > Why not just check it in the startup function instead?
> 
> After looking at the code, I inferred that it can still proceed if ctrl_buf is NULL because
> ctrl_buf is referenced only in mos7840_get_reg(). But please let me know if this is not the right
> way.

Nah, just error out in the beginning when the buffer is created.  It
makes is simpler to handle the low memory condition.

thanks,

greg k-h
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
