From: Fengguang Wu <wfg@linux.intel.com>
Date: Mon, 09 Jul 2012 07:16:38 +0000
Subject: Re: [usb:usb-next 100/101] drivers/usb/chipidea/ci13xxx_pci.c:26:30: sparse: symbol 'pci_platdata' w
Message-Id: <20120709071638.GA13711@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120707172137.GA25074@localhost>
In-Reply-To: <20120707172137.GA25074@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Mon, Jul 09, 2012 at 03:09:34PM +0800, Richard Zhao wrote:
> On Sun, Jul 08, 2012 at 01:21:37AM +0800, wfg@linux.intel.com wrote:
> > Hi Richard,
> > 
> > There are new sparse warnings show up in
> > 
> > tree:   git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-next
> > head:   336c5c310e8f0d5baba7973765339eaf5d989fe1
> > commit: 77c4400f2f0fd8384ab5cbe41d81ccc664896b2d [100/101] USB: Chipidea: rename struct ci13xxx_udc_driver to struct ci13xxx_platform_data
> > 
> > All sparse warnings:
> > 
> > + drivers/usb/chipidea/ci13xxx_pci.c:26:30: sparse: symbol 'pci_platdata' was not declared. Should it be static?
> > + drivers/usb/chipidea/ci13xxx_pci.c:31:30: sparse: symbol 'langwell_pci_platdata' was not declared. Should it be static?
> > + drivers/usb/chipidea/ci13xxx_pci.c:36:30: sparse: symbol 'penwell_pci_platdata' was not declared. Should it be static?
> > 
> > Please consider folding the attached diff :-)
> There' already a patch in mail list. http://www.spinics.net/lists/arm-kernel/msg181694.html

OK, thanks!

Fengguang
