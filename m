From: "rae l" <crquan@gmail.com>
Date: Mon, 16 Jul 2007 14:53:33 +0000
Subject: Re: [PATCH] change pci_find_device to pci_get_device,
Message-Id: <91b13c310707160753p7f8953dbw98d43f201b065253@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <11845693593123-git-send-email-crquan@gmail.com>
In-Reply-To: <11845693593123-git-send-email-crquan@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 7/16/07, Matthew Wilcox <matthew@wil.cx> wrote:
> On Mon, Jul 16, 2007 at 03:02:39PM +0800, Denis Cheng wrote:
> > @@ -4453,7 +4453,7 @@ advansys_detect(struct scsi_host_template *tpnt)
> >
> >                      /* Find all PCI cards. */
> >                      while (pci_device_id_cnt < ASC_PCI_DEVICE_ID_CNT) {
> > -                        if ((pci_devp = pci_find_device(PCI_VENDOR_ID_ASP,
> > +                        if ((pci_devp = pci_get_device(PCI_VENDOR_ID_ASP,
> >                              pci_device_id[pci_device_id_cnt], pci_devp)) =
> >                              NULL) {
> >                              pci_device_id_cnt++;
> > --
>
> Where do you drop the reference to the PCI device again?
I don't know how to solve this problem, I just want to do some kernel
janitors project to contribute to the linux kernel, I'm just a kernel
newbie;
Because the pci_find_device is deprecated, the comments in this
function said, please use pci_get_device instead; but pci_get_device
called here return a (struct pci_dev *) to a local variable, someone
could tell me when to call pci_put_device?

Thanks.

>
> --
> "Bill, look, we understand that you're interested in selling us this
> operating system, but compare it to ours.  We can't possibly take such
> a retrograde step."
>


-- 
Denis Cheng
Linux Application Developer

"One of my most productive days was throwing away 1000 lines of code."
 - Ken Thompson.
