From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Date: Wed, 16 Aug 2017 09:04:52 +0000
Subject: Re: [PATCH] sata: ahci-da850: Fix some error handling paths in 'ahci_da850_probe()'
Message-Id: <928002bb-9f1c-d7df-e04f-fcd5dc5dd73e@cogentembedded.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170816053103.19773-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20170816053103.19773-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, tj@kernel.org
Cc: linux-ide@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Hello!

On 8/16/2017 8:31 AM, Christophe JAILLET wrote:

> 'rc' is known to be 0 at this point.
> If 'platform_get_resource()' or 'devm_ioremap()' fail, return -ENOMEM
> instead of 0 which means success.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
>   drivers/ata/ahci_da850.c | 8 ++++++--
>   1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/ata/ahci_da850.c b/drivers/ata/ahci_da850.c
> index 1a50cd3b4233..eb46cad4d514 100644
> --- a/drivers/ata/ahci_da850.c
> +++ b/drivers/ata/ahci_da850.c
> @@ -216,12 +216,16 @@ static int ahci_da850_probe(struct platform_device *pdev)
>   		return rc;
>   
>   	res = platform_get_resource(pdev, IORESOURCE_MEM, 1);
> -	if (!res)
> +	if (!res) {
> +		rc = -ENOMEM;

    -ENODEV would fit better here.

[...]

MBR, Sergei
