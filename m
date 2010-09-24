From: matt mooney <mfm@muteddisk.com>
Date: Fri, 24 Sep 2010 20:28:23 +0000
Subject: Re: [usb-storage] [PATCH 23/24] usb: change to new flag variable
Message-Id: <20100924202823.GB4598@haskell.muteddisk.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <e0bdab5d2e8c52041c003de68ba774c3e706716c.1285355033.git.mfm@muteddisk.com>
 <1dd0f4a1709a9b139fe87f2b311cc0d129900b3f.1285355033.git.mfm@muteddisk.com>
 <20100924200218.GC25677@one-eyed-alien.net>
In-Reply-To: <20100924200218.GC25677@one-eyed-alien.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Matthew Dharm <mdharm-kernel@one-eyed-alien.net>
Cc: kernel-janitors@vger.kernel.org, David Brownell <dbrownell@users.sourceforge.net>, usb-storage@lists.one-eyed-alien.net, Greg Kroah-Hartman <gregkh@suse.de>, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, Felipe Balbi <felipe.balbi@nokia.com>, David Vrabel <david.vrabel@csr.com>, Michal Marek <mmarek@suse.cz>

On 13:02 Fri 24 Sep     , Matthew Dharm wrote:
> On Fri, Sep 24, 2010 at 12:17:33PM -0700, matt mooney wrote:
> > Replace EXTRA_CFLAGS with ccflags-y.
> 
> > diff --git a/drivers/usb/storage/Makefile b/drivers/usb/storage/Makefile
> > index ef7e5a8..786f086 100644
> > --- a/drivers/usb/storage/Makefile
> >
+++ b/drivers/usb/storage/Makefile
> > @@ -5,7 +5,7 @@
> >  # Rewritten to use lists instead of if-statements.
> >  #
> >  
> > -EXTRA_CFLAGS	:= -Idrivers/scsi
> > +ccflags-y	:= -Idrivers/scsi
> >  
> >  obj-$(CONFIG_USB_STORAGE)	+= usb-storage.o
> 
> I don't really know anything about the new 'ccflags' stuff.. but my
> instincts tell me that perhaps that should be
> 'ccflags-$(CONFIG_USB_STORAGE)' rather than 'ccflags-y'?

The flag has the same effect as EXTRA_CFLAGS in that it will be used to build
all  sources at the same hierarchical level (i.e., per directory not including
subdirectories). I didn't want to change the semantics of the way the variable
was being used, but after looking at the Kconfig it seems that would be a
reasonable change. If only usb-storage needs the flag then it makes sense,
though it seems that everything else in the directory relies on usb-storage
anyway, but it gives it greater meaning knowing that only usb-storage relies on
the flag, IMHO.

> 
> Does it make a difference that usb-storage can be built-in or a loadable
> module?

That would make a difference because ccflags-m is not used, so the change is not
possible.

-mfm

