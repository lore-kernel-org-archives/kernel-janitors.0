From: Mike Christie <michaelc@cs.wisc.edu>
Date: Thu, 10 Jun 2010 20:43:17 +0000
Subject: Re: [patch 2/2] be2iscsi: null dereference on error path
Message-Id: <4C114E65.90305@cs.wisc.edu>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100610075305.GJ5483@bicker>
In-Reply-To: <20100610075305.GJ5483@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <error27@gmail.com>
Cc: Jayamohan Kallickal <jayamohank@serverengines.com>, "James E.J. Bottomley" <James.Bottomley@suse.de>, linux-scsi@vger.kernel.org, kernel-janitors@vger.kernel.org

On 06/10/2010 02:53 AM, Dan Carpenter wrote:
> "phba" is always null here so we can't dereference it.
>
> Signed-off-by: Dan Carpenter<error27@gmail.com>
>
> diff --git a/drivers/scsi/be2iscsi/be_main.c b/drivers/scsi/be2iscsi/be_main.c
> index 779e1d1..efadde9 100644
> --- a/drivers/scsi/be2iscsi/be_main.c
> +++ b/drivers/scsi/be2iscsi/be_main.c
> @@ -3774,8 +3774,8 @@ static int __devinit beiscsi_dev_probe(struct pci_dev *pcidev,
>
>   	ret = beiscsi_enable_pci(pcidev);
>   	if (ret<  0) {
> -		shost_printk(KERN_ERR, phba->shost, "beiscsi_dev_probe-"
> -			     "Failed to enable pci device \n");
> +		dev_err(&pcidev->dev, "beiscsi_dev_probe-"
> +			" Failed to enable pci device\n");
>   		return ret;
>   	}
>

Looks good. Thanks.

Reviewed-by: Mike Christie <michaelc@cs.wisc.edu>
