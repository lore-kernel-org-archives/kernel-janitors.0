From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 25 Jun 2020 16:36:11 +0000
Subject: Re: [bug report] tty: cyclades, cache HW version
Message-Id: <20200625163611.GE2549@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200624131858.GA9972@mwanda>
In-Reply-To: <20200624131858.GA9972@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Thu, Jun 25, 2020 at 10:57:46AM +0200, Jiri Slaby wrote:
> Hi,
> 
> On 24. 06. 20, 15:18, Dan Carpenter wrote:
> > [ Kees recently removed the uninitialized_var() variable so ancient
> >   code has started to print warnings.  GCC doesn't warn about
> >   uninitialized variables these days either.  It's been buggy for
> >   10 years so it's probably not an emergency.  -dan ]
> > 
> > Hello Jiri Slaby,
> > 
> > The patch 101b81590d8d: "tty: cyclades, cache HW version" from Jun
> > 11, 2009, leads to the following static checker warning:
> > 
> > 	drivers/tty/cyclades.c:3805 cy_pci_probe()
> > 	error: uninitialized symbol 'mailbox'.
> > 
> > drivers/tty/cyclades.c
> >   3640  static int cy_pci_probe(struct pci_dev *pdev,
> >   3641                  const struct pci_device_id *ent)
> >   3642  {
> >   3643          struct cyclades_card *card;
> >   3644          void __iomem *addr0 = NULL, *addr2 = NULL;
> >   3645          char *card_name = NULL;
> >   3646          u32 mailbox;
> >                 ^^^^^^^^^^^^
> > 
> >   3647          unsigned int device_id, nchan = 0, card_no, i, j;
> >   3648          unsigned char plx_ver;
> >   3649          int retval, irq;
> >   3650  
> >   3651          retval = pci_enable_device(pdev);
> >   3652          if (retval) {
> >   3653                  dev_err(&pdev->dev, "cannot enable device\n");
> >   3654                  goto err;
> >   3655          }
> >   3656  
> >   3657          /* read PCI configuration area */
> >   3658          irq = pdev->irq;
> >   3659          device_id = pdev->device & ~PCI_DEVICE_ID_MASK;
> 
> It looks like you and/or your analyzer missed this line ^^?

Both of us missed it.  It turns out there is a bug in Smatch and also
some missing features which triggered this warning.

Thanks for taking a look at it.

regards,
dan carpenter
