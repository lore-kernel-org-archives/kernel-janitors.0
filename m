From: Greg Ungerer <gerg@linux-m68k.org>
Date: Wed, 18 Apr 2018 23:54:34 +0000
Subject: Re: [PATCH -next] m68k: fix return value check in mcf_pci_init()
Message-Id: <f5eca74a-972f-dca0-b6e3-3d5978418b88@linux-m68k.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1524059842-22099-1-git-send-email-weiyongjun1@huawei.com>
In-Reply-To: <1524059842-22099-1-git-send-email-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wei Yongjun <weiyongjun1@huawei.com>, Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Hi Wei,

On 18/04/18 23:57, Wei Yongjun wrote:
> In case of error, the function ioremap() returns NULL pointer not
> ERR_PTR(). The IS_ERR() test in the return value check should be
> replaced with NULL test.
> 
> Fixes: bf114d773167 ("m68k: force use of __raw_read/__raw_write address to be iomem")
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

Thanks for the patch. I plan on dropping that commit completely
from next soon. Autobuilder has shown it is missing some conversions
that it was intended to cover.

Regards
Greg


> ---
>  arch/m68k/coldfire/pci.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/m68k/coldfire/pci.c b/arch/m68k/coldfire/pci.c
> index 9d6342c..a7c2332 100644
> --- a/arch/m68k/coldfire/pci.c
> +++ b/arch/m68k/coldfire/pci.c
> @@ -218,7 +218,7 @@ static int __init mcf_pci_init(void)
>  
>  	/* Keep a virtual mapping to IO/config space active */
>  	iospace = ioremap(PCI_IO_PA, PCI_IO_SIZE);
> -	if (IS_ERR(iospace))
> +	if (!iospace)
>  		return -ENODEV;
>  	pr_info("Coldfire: PCI IO/config window mapped to 0x%p\n", iospace);
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-m68k" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 

