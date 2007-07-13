From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Date: Fri, 13 Jul 2007 10:35:24 +0000
Subject: Re: [PATCH] Remove BKL from PCI syscalls
Message-Id: <20070713113524.51b2b5c8@the-village.bc.nu>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20070710165532.GP9704@parisc-linux.org>
In-Reply-To: <20070710165532.GP9704@parisc-linux.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

> Yes, that is because Alan sent it to Andrew and not me, so it was in the
> -mm tree for a while before Andrew sent it on to me.

I should have cc'd you. Don't know if I forgot perhaps.

> > > Also, Alan's patch has already gotten a lot of testing in -mm for a
> > > while and is about to be sent to Linus, while your's would be a bit
> > > further back in the queue.
> > 
> > How much testing has Alan's patch actually had?
> 
> As much testing as any -mm release does :)

Really both problems want fixing - no pci_find_* and no lock_kernel. I
really don't care which patch or combination gets merged
