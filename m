From: Johannes Thumshirn <johannes.thumshirn@men.de>
Date: Thu, 15 Jan 2015 07:18:01 +0000
Subject: Re: [patch] mcb: request_mem_region() returns NULL on error
Message-Id: <20150115071800.GA26024@jtlinux>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150114210840.GG23203@mwanda>
In-Reply-To: <20150114210840.GG23203@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Johannes Thumshirn <johannes.thumshirn@men.de>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Bjorn Helgaas <bhelgaas@google.com>

On Thu, Jan 15, 2015 at 12:08:40AM +0300, Dan Carpenter wrote:
> The code here is checking for IS_ERR() when request_mem_region() only
> returns NULL on error and never an ERR_PTR.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> diff --git a/drivers/mcb/mcb-pci.c b/drivers/mcb/mcb-pci.c
> index 5e1bd5d..2d6524a 100644
> --- a/drivers/mcb/mcb-pci.c
> +++ b/drivers/mcb/mcb-pci.c
> @@ -56,9 +56,9 @@ static int mcb_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
>  
>  	res = request_mem_region(priv->mapbase, CHAM_HEADER_SIZE,
>  				 KBUILD_MODNAME);
> -	if (IS_ERR(res)) {
> +	if (!res) {
>  		dev_err(&pdev->dev, "Failed to request PCI memory\n");
> -		ret = PTR_ERR(res);
> +		ret = -EBUSY;
>  		goto err_start;
>  	}
>  

Applied to mcb-next, thanks.
