From: Tyrel Datwyler <tyreld@linux.vnet.ibm.com>
Date: Wed, 24 Jan 2018 03:33:10 +0000
Subject: Re: [PATCH-next] powerpc/fsl_pci: Use PTR_ERR_OR_ZERO
Message-Id: <dff06bae-9624-b688-2865-99aca16b9214@linux.vnet.ibm.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180123203752.15057-1-chrisadr@gentoo.org>
In-Reply-To: <20180123203752.15057-1-chrisadr@gentoo.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: =?UTF-8?Q?Christopher_D=c3=adaz_Riveros?= <chrisadr@gentoo.org>, benh@kernel.crashing.org, paulus@samba.org, mpe@ellerman.id.au, joe@perches.com, christian.koenig@amd.com, tyreld@linux.vnet.ibm.com, konrad.wilk@oracle.com, robh@kernel.org
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On 01/23/2018 12:37 PM, Christopher Díaz Riveros wrote:
> Use PTR_ERR_OR_ZERO rather than if(IS_ERR(...)) + PTR_ERR
> 
> This issue was detected by using the Coccinelle software.
> 
> Signed-off-by: Christopher Díaz Riveros <chrisadr@gentoo.org>
> ---

Reviewed-by: Tyrel Datwyler <tyreld@linux.vnet.ibm.com>

>  arch/powerpc/sysdev/fsl_pci.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/arch/powerpc/sysdev/fsl_pci.c b/arch/powerpc/sysdev/fsl_pci.c
> index cc20d2255d7f..142184635c81 100644
> --- a/arch/powerpc/sysdev/fsl_pci.c
> +++ b/arch/powerpc/sysdev/fsl_pci.c
> @@ -1304,10 +1304,7 @@ static int add_err_dev(struct platform_device *pdev)
>  						   pdev->resource,
>  						   pdev->num_resources,
>  						   &pd, sizeof(pd));
> -	if (IS_ERR(errdev))
> -		return PTR_ERR(errdev);
> -
> -	return 0;
> +	return PTR_ERR_OR_ZERO(errdev);
>  }
>  
>  static int fsl_pci_probe(struct platform_device *pdev)
> 

