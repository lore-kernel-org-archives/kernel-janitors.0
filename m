From: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Date: Tue, 05 May 2020 11:04:24 +0000
Subject: Re: [PATCH] PCI: v3-semi: Fix a memory leak in some error handling paths in 'v3_pci_probe()'
Message-Id: <20200505110423.GC13446@e121166-lin.cambridge.arm.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200418081637.1585-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20200418081637.1585-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: linus.walleij@linaro.org, amurray@thegoodpenguin.co.uk, bhelgaas@google.com, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Sat, Apr 18, 2020 at 10:16:37AM +0200, Christophe JAILLET wrote:
> IF we fails somewhere in 'v3_pci_probe()', we need to free 'host'.
> Use the managed version of 'pci_alloc_host_bridge()' to do that easily.
> The use of managed resources is already widely used in this driver.
> 
> Fixes: 68a15eb7bd0c ("PCI: v3-semi: Add V3 Semiconductor PCI host driver")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
> Fixes could be older than this commit, but this is as far as git can go.
> 
> There is also a 'clk_prepare_enable()' which looks un-ballanced. I don't
> know if it can be an issue.
> 
> Compile tested only.
> ---
>  drivers/pci/controller/pci-v3-semi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to pci/v3-semi, thanks !

Lorenzo

> diff --git a/drivers/pci/controller/pci-v3-semi.c b/drivers/pci/controller/pci-v3-semi.c
> index bd05221f5a22..ddcb4571a79b 100644
> --- a/drivers/pci/controller/pci-v3-semi.c
> +++ b/drivers/pci/controller/pci-v3-semi.c
> @@ -720,7 +720,7 @@ static int v3_pci_probe(struct platform_device *pdev)
>  	int irq;
>  	int ret;
>  
> -	host = pci_alloc_host_bridge(sizeof(*v3));
> +	host = devm_pci_alloc_host_bridge(dev, sizeof(*v3));
>  	if (!host)
>  		return -ENOMEM;
>  
> -- 
> 2.20.1
> 
