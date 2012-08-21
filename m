From: Fengguang Wu <fengguang.wu@intel.com>
Date: Tue, 21 Aug 2012 12:52:50 +0000
Subject: Re: [pci:pci:bjorn-cleanup-remove 16/16] drivers/parisc/dino.c:598:3: error: implicit declaration of
Message-Id: <20120821125250.GB22321@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120819115449.GB20588@localhost>
In-Reply-To: <20120819115449.GB20588@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Mon, Aug 20, 2012 at 09:45:11AM -0600, Bjorn Helgaas wrote:
> On Sun, Aug 19, 2012 at 5:54 AM, Fengguang Wu <fengguang.wu@intel.com> wrote:
> > Hi Bjorn,
> >
> > FYI, kernel build failed on
> >
> > tree:   git://git.kernel.org/pub/scm/linux/kernel/git/helgaas/pci.git pci/bjorn-cleanup-remove
> > head:   f757bd1fe5535350c50058bf999f437cb9106d52
> > commit: f757bd1fe5535350c50058bf999f437cb9106d52 [16/16] PCI: Remove unused pci_dev_b()
> > config: parisc-defconfig (attached as .config)
> >
> > All related error/warning messages:
> >
> > drivers/parisc/dino.c: In function 'dino_fixup_bus':
> > drivers/parisc/dino.c:598:3: error: implicit declaration of function 'pci_dev_b' [-Werror=implicit-function-declaration]
> > drivers/parisc/dino.c:598:7: warning: assignment makes pointer from integer without a cast [enabled by default]
> > cc1: some warnings being treated as errors
> >
> > vim +598 drivers/parisc/dino.c
> >    595
> >    596
> >    597          list_for_each(ln, &bus->devices) {
> >  > 598                  dev = pci_dev_b(ln);
> >    599                  if (is_card_dino(&dino_dev->hba.dev->id))
> >    600                          dino_card_fixup(dev);
> >    601
> 
> Fixed.
> 
> Thanks a lot for finding this!  This is an awesome service -- I hadn't

Thank you :)

> even put it into "next" yet, so I had no idea you'd even look at it.

Yeah, I blindly fetch and test every commits in all new/updated branches
in the monitored trees. blacklist is also supported, in case you need it.

Thanks,
Fengguang
