From: Bjorn Helgaas <bhelgaas@google.com>
Date: Thu, 06 Sep 2012 17:21:31 +0000
Subject: Re: [pci:pci:bjorn-cleanup-remove 16/16] drivers/parisc/dino.c:598:3: error: implicit declaration of
Message-Id: <CAErSpo6P_9mDY9j2aV31-xfYF45XgVN5nJkbYY9=firWn311RA@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120819115449.GB20588@localhost>
In-Reply-To: <20120819115449.GB20588@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Wed, Sep 5, 2012 at 8:40 PM, Fengguang Wu <fengguang.wu@intel.com> wrote:
> Hi Bjorn,
>
> FYI, kernel build failed on
>
> tree:   git://git.kernel.org/pub/scm/linux/kernel/git/helgaas/pci.git pci/bjorn-cleanup-remove
> head:   f757bd1fe5535350c50058bf999f437cb9106d52
> commit: f757bd1fe5535350c50058bf999f437cb9106d52 [16/16] PCI: Remove unused pci_dev_b()
> config: parisc-defconfig (attached as .config)
>
> All related error/warning messages:
>
> drivers/parisc/dino.c: In function 'dino_fixup_bus':
> drivers/parisc/dino.c:598:3: error: implicit declaration of function 'pci_dev_b' [-Werror=implicit-function-declaration]
> drivers/parisc/dino.c:598:7: warning: assignment makes pointer from integer without a cast [enabled by default]
> cc1: some warnings being treated as errors

Is your branch stale?  I fixed this already.

The head of this branch
(http://git.kernel.org/?p=linux/kernel/git/helgaas/pci.git;a=shortlog;h=refs/heads/pci/bjorn-cleanup-remove)
is c29aabe22ea, not f757bd1fe as you reference above.

Bjorn
