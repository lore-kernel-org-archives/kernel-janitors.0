From: Joe Perches <joe@perches.com>
Date: Tue, 03 Jul 2018 10:07:15 +0000
Subject: Re: [PATCH] iommu/amd: fix missing tag from dev_err message
Message-Id: <6763ec382f8d629f5f356f4cc023f20c2f76b26a.camel@perches.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180703064005.18908-1-colin.king@canonical.com>
In-Reply-To: <20180703064005.18908-1-colin.king-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>, Joerg Roedel <joro-zLv9SwRftAIdnm+yROfE0A@public.gmane.org>, iommu-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org
Cc: kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

On Tue, 2018-07-03 at 07:40 +0100, Colin King wrote:
> Currently tag is being assigned but not used, it is missing from
> the dev_err message, so add it in.
> 
> Cleans up clang warning:
> warning: variable 'tag' set but not used [-Wunused-but-set-variable]
[]
> diff --git a/drivers/iommu/amd_iommu.c b/drivers/iommu/amd_iommu.c
[]
> @@ -616,9 +616,9 @@ static void iommu_print_event(struct amd_iommu *iommu, void *__evt)
>  		pasid = ((event[0] >> 16) & 0xFFFF)
>  			| ((event[1] << 6) & 0xF0000);
>  		tag = event[1] & 0x03FF;
> -		dev_err(dev, "INVALID_PPR_REQUEST device=%02x:%02x.%x pasid=0x%05x address=0x%016llx flags=0x%04x]\n",
> +		dev_err(dev, "INVALID_PPR_REQUEST device=%02x:%02x.%x pasid=0x%05x address=0x%016llx flags=0x%04x tag=0x%03x]\n",
>  			PCI_BUS_NUM(devid), PCI_SLOT(devid), PCI_FUNC(devid),
> -			pasid, address, flags);
> +			pasid, address, flags, tag);

Seems to have a superfluous ] that should be removed.

