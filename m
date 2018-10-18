From: Minas Harutyunyan <minas.harutyunyan@synopsys.com>
Date: Thu, 18 Oct 2018 07:50:04 +0000
Subject: Re: [PATCH] usb: dwc2: pci: Fix an error code in probe
Message-Id: <410670D7E743164D87FA6160E7907A56013A794B32@am04wembxa.internal.synopsys.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20181018073647.5ud667degrrqzegc@kili.mountain>
In-Reply-To: <20181018073647.5ud667degrrqzegc@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Minas Harutyunyan <minas.harutyunyan@synopsys.com>, Vardan Mikayelyan <mvardan@synopsys.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

On 10/18/2018 11:37 AM, Dan Carpenter wrote:
> We added some error handling to this function but forgot to set the
> error code on this path.
> 
> Fixes: ecd29dabb2ba ("usb: dwc2: pci: Handle error cleanup in probe")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Acked-by: Minas Harutyunyan <hminas@synopsys.com>

> ---
>   drivers/usb/dwc2/pci.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/usb/dwc2/pci.c b/drivers/usb/dwc2/pci.c
> index d257c541e51b..7afc10872f1f 100644
> --- a/drivers/usb/dwc2/pci.c
> +++ b/drivers/usb/dwc2/pci.c
> @@ -120,6 +120,7 @@ static int dwc2_pci_probe(struct pci_dev *pci,
>   	dwc2 = platform_device_alloc("dwc2", PLATFORM_DEVID_AUTO);
>   	if (!dwc2) {
>   		dev_err(dev, "couldn't allocate dwc2 device\n");
> +		ret = -ENOMEM;
>   		goto err;
>   	}
>   
> 
