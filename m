From: Dave Jiang <dave.jiang@intel.com>
Date: Mon, 19 Dec 2016 17:04:24 +0000
Subject: Re: [PATCH] NTB: Fix 'request_irq()' and 'free_irq()' inconsistancy
Message-Id: <56b16dd5-b83b-e8b0-bf79-2dd2bc56f1e1@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20161219055255.21418-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20161219055255.21418-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Xiangliang.Yu@amd.com, jdmason@kudzu.us, Allen.Hubbe@emc.com
Cc: linux-ntb@googlegroups.com, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org



On 12/18/2016 10:52 PM, Christophe JAILLET wrote:
> 'request_irq()' and 'free_irq()' should have the same 'dev_id'.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Acking the Intel driver portion.
Acked-by: Dave Jiang <dave.jiang@intel.com>

> ---
>  drivers/ntb/hw/amd/ntb_hw_amd.c     | 2 +-
>  drivers/ntb/hw/intel/ntb_hw_intel.c | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/ntb/hw/amd/ntb_hw_amd.c b/drivers/ntb/hw/amd/ntb_hw_amd.c
> index 6ccba0d862df..a48c3e085eab 100644
> --- a/drivers/ntb/hw/amd/ntb_hw_amd.c
> +++ b/drivers/ntb/hw/amd/ntb_hw_amd.c
> @@ -598,7 +598,7 @@ static int ndev_init_isr(struct amd_ntb_dev *ndev,
>  
>  err_msix_request:
>  	while (i-- > 0)
> -		free_irq(ndev->msix[i].vector, ndev);
> +		free_irq(ndev->msix[i].vector, &ndev->vec[i]);
>  	pci_disable_msix(pdev);
>  err_msix_enable:
>  	kfree(ndev->msix);
> diff --git a/drivers/ntb/hw/intel/ntb_hw_intel.c b/drivers/ntb/hw/intel/ntb_hw_intel.c
> index 7310a261c858..2413600aae30 100644
> --- a/drivers/ntb/hw/intel/ntb_hw_intel.c
> +++ b/drivers/ntb/hw/intel/ntb_hw_intel.c
> @@ -472,7 +472,7 @@ static int ndev_init_isr(struct intel_ntb_dev *ndev,
>  
>  err_msix_request:
>  	while (i-- > 0)
> -		free_irq(ndev->msix[i].vector, ndev);
> +		free_irq(ndev->msix[i].vector, &ndev->vec[i]);
>  	pci_disable_msix(pdev);
>  err_msix_enable:
>  	kfree(ndev->msix);
> 
