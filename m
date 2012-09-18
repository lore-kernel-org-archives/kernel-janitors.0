From: "Bounine, Alexandre" <Alexandre.Bounine@idt.com>
Date: Tue, 18 Sep 2012 12:27:55 +0000
Subject: RE: [PATCH] drivers/rapidio/devices/tsi721.c: fix error return code
Message-Id: <8D983423E7EDF846BB3056827B8CC5D12E7C4AFF@corpmail1.na.ads.idt.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1347869644-2569-1-git-send-email-peter.senna@gmail.com>
In-Reply-To: <1347869644-2569-1-git-send-email-peter.senna@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Peter Senna Tschudin <peter.senna@gmail.com>, "mporter@kernel.crashing.org" <mporter@kernel.crashing.org>
Cc: "akpm@linux-foundation.org" <akpm@linux-foundation.org>, "chul.kim@idt.com" <chul.kim@idt.com>, "jiang.liu@huawei.com" <jiang.liu@huawei.com>, "bhelgaas@google.com" <bhelgaas@google.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

On Monday, Sep.17, at 2012 4:14 AM Peter Senna Tschudin wrote:
> 
> Convert a nonnegative error return code to a negative one, as returned
> elsewhere in the function.
> 
... skip ...
> 
> Signed-off-by: Peter Senna Tschudin <peter.senna@gmail.com>
> ---
>  drivers/rapidio/devices/tsi721.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/rapidio/devices/tsi721.c
> b/drivers/rapidio/devices/tsi721.c
> index 1974359..78dff6f 100644
> --- a/drivers/rapidio/devices/tsi721.c
> +++ b/drivers/rapidio/devices/tsi721.c
> @@ -2316,7 +2316,8 @@ static int __devinit tsi721_probe(struct pci_dev
> *pdev,
> 
>  	/* Configure DMA attributes. */
>  	if (pci_set_dma_mask(pdev, DMA_BIT_MASK(64))) {
> -		if (pci_set_dma_mask(pdev, DMA_BIT_MASK(32))) {
> +		err = pci_set_dma_mask(pdev, DMA_BIT_MASK(32));
> +		if (err) {
>  			dev_info(&pdev->dev, "Unable to set DMA mask\n");
>  			goto err_unmap_bars;
>  		}
> --
> 1.7.11.4

Acked-by: Alexandre Bounine <alexandre.bounine@idt.com>

