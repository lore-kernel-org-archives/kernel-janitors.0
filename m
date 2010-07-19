From: "Roedel, Joerg" <Joerg.Roedel@amd.com>
Date: Mon, 19 Jul 2010 13:42:18 +0000
Subject: Re: [PATCH 05/19] arch/x86/kernel: use for_each_pci_dev()
Message-Id: <20100719134218.GC7454@amd.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1278173032-11575-1-git-send-email-segooon@gmail.com>
In-Reply-To: <1278173032-11575-1-git-send-email-segooon@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kulikov Vasiliy <segooon@gmail.com>
Cc: Kernel Janitors <kernel-janitors@vger.kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, "x86@kernel.org" <x86@kernel.org>, "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Sat, Jul 03, 2010 at 12:03:51PM -0400, Kulikov Vasiliy wrote:
> Use for_each_pci_dev() to simplify the code.
> 
> Signed-off-by: Kulikov Vasiliy <segooon@gmail.com>
> ---
>  arch/x86/kernel/amd_iommu.c |    3 +--
>  1 files changed, 1 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/x86/kernel/amd_iommu.c b/arch/x86/kernel/amd_iommu.c
> index 0d20286..29dd3b9 100644
> --- a/arch/x86/kernel/amd_iommu.c
> +++ b/arch/x86/kernel/amd_iommu.c
> @@ -2609,8 +2609,7 @@ int __init amd_iommu_init_passthrough(void)
>  
>  	pt_domain->mode |= PAGE_MODE_NONE;
>  
> -	while ((dev = pci_get_device(PCI_ANY_ID, PCI_ANY_ID, dev)) != NULL) {
> -
> +	for_each_pci_dev(dev) {
>  		if (!check_device(&dev->dev))
>  			continue;

Applied, thanks.

-- 
Joerg Roedel - AMD Operating System Research Center

Advanced Micro Devices GmbH Einsteinring 24 85609 Dornach
General Managers: Alberto Bozzo, Andrew Bowd
Registration: Dornach, Landkr. Muenchen; Registerger. Muenchen, HRB Nr. 43632

