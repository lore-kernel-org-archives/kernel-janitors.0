From: Greg KH <greg@kroah.com>
Date: Tue, 17 Jul 2007 00:09:47 +0000
Subject: Re: [PATCH] change pci_find_device to pci_get_device,
Message-Id: <20070717000946.GA6068@kroah.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <11845693593123-git-send-email-crquan@gmail.com>
In-Reply-To: <11845693593123-git-send-email-crquan@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Mon, Jul 16, 2007 at 10:53:33PM +0800, rae l wrote:
>  On 7/16/07, Matthew Wilcox <matthew@wil.cx> wrote:
> > On Mon, Jul 16, 2007 at 03:02:39PM +0800, Denis Cheng wrote:
> > > @@ -4453,7 +4453,7 @@ advansys_detect(struct scsi_host_template *tpnt)
> > >
> > >                      /* Find all PCI cards. */
> > >                      while (pci_device_id_cnt < ASC_PCI_DEVICE_ID_CNT) {
> > > -                        if ((pci_devp = 
> > pci_find_device(PCI_VENDOR_ID_ASP,
> > > +                        if ((pci_devp = 
> > pci_get_device(PCI_VENDOR_ID_ASP,
> > >                              pci_device_id[pci_device_id_cnt], pci_devp)) 
> > =
> > >                              NULL) {
> > >                              pci_device_id_cnt++;
> > > --
> >
> > Where do you drop the reference to the PCI device again?
>  I don't know how to solve this problem, I just want to do some kernel
>  janitors project to contribute to the linux kernel, I'm just a kernel
>  newbie;
>  Because the pci_find_device is deprecated, the comments in this
>  function said, please use pci_get_device instead; but pci_get_device
>  called here return a (struct pci_dev *) to a local variable, someone
>  could tell me when to call pci_put_device?

Please read the comments for the pci_get_device() function to fully
understand why people have not just gone through and done a simple
search-and-replace action for the whole kernel tree.  It is much more
complex than that.

good luck,

greg k-h
