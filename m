From: Randy Dunlap <rdunlap@xenotime.net>
Date: Fri, 06 Apr 2007 16:14:26 +0000
Subject: Re: [KJ] [PATCH 4/5] Fix warnings when building 'xmldocs' target:
Message-Id: <20070406091426.bbb0143e.rdunlap@xenotime.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20070406074424.GA4870@gollum.tnic>
In-Reply-To: <20070406074424.GA4870@gollum.tnic>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Fri, 6 Apr 2007 09:44:24 +0200 Borislav Petkov wrote:

> Signed-off-by: Borislav Petkov <bbpetkov@yahoo.de>
> 
> --- kernel.orig/20-rc5/drivers/pci/pci.c	2007-04-05 09:33:57.000000000 +0200
> +++ kernel/20-rc5/drivers/pci/pci.c	2007-04-05 09:34:01.000000000 +0200
> @@ -1271,7 +1271,7 @@
>  
>  /**
>   * pci_msi_off - disables any msi or msix capabilities
> - * @pdev: the PCI device to operate on
> + * @dev: the PCI device to operate on
>   *
>   * If you want to use msi see pci_enable_msi and friends.
>   * This is a lower level primitive that allows us to disable

Hi,

This one isn't correct for 2.6.21-rc6 (and yes, we want patches
for the current kernel tree, not 2.6.20-rc5).

The fusion/ patches are already in -mm.  It's a good idea to check
-mm for patches.

I'll consider your patch 5/5 for scripts/kernel-doc...


Thanks,
---
~Randy
*** Remember to use Documentation/SubmitChecklist when testing your code ***
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
