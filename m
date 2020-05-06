From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 06 May 2020 12:53:59 +0000
Subject: Re: [PATCH -next] staging: kpc2000: fix error return code in kp2000_pcie_probe()
Message-Id: <20200506125359.GK1992@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200506125255.90336-1-weiyongjun1@huawei.com>
In-Reply-To: <20200506125255.90336-1-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wei Yongjun <weiyongjun1@huawei.com>
Cc: devel@driverdev.osuosl.org, gregkh@linuxfoundation.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, simon@nikanor.nu

On Wed, May 06, 2020 at 12:52:55PM +0000, Wei Yongjun wrote:
> Fix to return a negative error code from the error handling
> case instead of 0, as done elsewhere in this function. Also
> removed var 'rv' since we can use 'err' instead.
> 
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> ---
>  drivers/staging/kpc2000/kpc2000/core.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/staging/kpc2000/kpc2000/core.c b/drivers/staging/kpc2000/kpc2000/core.c
> index 7b00d7069e21..14e07742dc9d 100644
> --- a/drivers/staging/kpc2000/kpc2000/core.c
> +++ b/drivers/staging/kpc2000/kpc2000/core.c
> @@ -298,7 +298,6 @@ static int kp2000_pcie_probe(struct pci_dev *pdev,
>  {
>  	int err = 0;
>  	struct kp2000_device *pcard;
> -	int rv;
>  	unsigned long reg_bar_phys_addr;
>  	unsigned long reg_bar_phys_len;
>  	unsigned long dma_bar_phys_addr;
> @@ -445,11 +444,11 @@ static int kp2000_pcie_probe(struct pci_dev *pdev,
>  	if (err < 0)
>  		goto err_release_dma;
>  
> -	rv = request_irq(pcard->pdev->irq, kp2000_irq_handler, IRQF_SHARED,
> +	err = request_irq(pcard->pdev->irq, kp2000_irq_handler, IRQF_SHARED,
>  			 pcard->name, pcard);
                        ^
Could you add a space character here so the white space still aligns?

Otherwise it looks good.  :)

regards,
dan carpenter
