From: Jesse Barnes <jbarnes@virtuousgeek.org>
Date: Fri, 30 Jul 2010 16:48:33 +0000
Subject: Re: [PATCH 17/19] drivers/pci: use for_each_pci_dev()
Message-Id: <20100730094833.47a3e638@virtuousgeek.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1278173080-11983-1-git-send-email-segooon@gmail.com>
In-Reply-To: <1278173080-11983-1-git-send-email-segooon@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kulikov Vasiliy <segooon@gmail.com>
Cc: Kernel Janitors <kernel-janitors@vger.kernel.org>, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org

On Sat,  3 Jul 2010 20:04:39 +0400
Kulikov Vasiliy <segooon@gmail.com> wrote:

> Use for_each_pci_dev() to simplify the code.
> 
> Signed-off-by: Kulikov Vasiliy <segooon@gmail.com>
> ---
>  drivers/pci/setup-irq.c |    3 +--
>  1 files changed, 1 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/pci/setup-irq.c b/drivers/pci/setup-irq.c
> index aa795fd..eec9738 100644
> --- a/drivers/pci/setup-irq.c
> +++ b/drivers/pci/setup-irq.c
> @@ -59,7 +59,6 @@ pci_fixup_irqs(u8 (*swizzle)(struct pci_dev *, u8 *),
>  	       int (*map_irq)(struct pci_dev *, u8, u8))
>  {
>  	struct pci_dev *dev = NULL;
> -	while ((dev = pci_get_device(PCI_ANY_ID, PCI_ANY_ID, dev)) != NULL) {
> +	for_each_pci_dev(dev)
>  		pdev_fixup_irq(dev, swizzle, map_irq);
> -	}
>  }

Applied all of these to my linux-next branch.  I squashed all the PCI
ones into a single commit, keeping only the x86 one separate.

-- 
Jesse Barnes, Intel Open Source Technology Center
