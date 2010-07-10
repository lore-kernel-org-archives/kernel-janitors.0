From: Greg KH <greg@kroah.com>
Date: Sat, 10 Jul 2010 03:29:08 +0000
Subject: Re: Staging: spectra: removes q->prepare_flush_fn
Message-Id: <20100710032908.GA17903@kroah.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1278731978.1725.11.camel@lenovo>
In-Reply-To: <1278731978.1725.11.camel@lenovo>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Fri, Jul 09, 2010 at 11:19:38PM -0400, Javier Martinez Canillas wrote:
> >
> > Ok, I'll just keep this in my to-apply queue again, and then apply it
> > when it is needed for Linus's tree.  Is that ok?
> >
> > thanks,
> >
> > greg k-h
> >
> 
> I found more compile errors (more API changes) with this driver in today
> linux-next.
> 
> I prepared a patch-set containing the previous patch sent and two more.
> This three patches allow spectra driver to compile in today linux-next. 
> 
> Do you want me to do it this way (keeping a patchset) or should I send
> separate patches as issues arises?
> 
> The patchset I will send contains the following patches:
> 
> [PATCH 1/3] fix staging/spectra: removes q->prepare_flush_fn
> [PATCH 2/3] fix staging/spectra: use new REQ_FLUSH flag
> [PATCH 3/3] fix staging/spectra: don't use locked_ioctl

Three patches are fine, I'll keep them for when they are needed during
the next merge window.

thanks,

greg k-h
