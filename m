From: Gary R Hook <ghook@amd.com>
Date: Tue, 03 Jul 2018 12:54:37 +0000
Subject: Re: [PATCH] iommu/amd: fix missing tag from dev_err message
Message-Id: <5a0b7254-2b13-6e91-1db5-45a848a0dd8f@amd.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180703064005.18908-1-colin.king@canonical.com>
In-Reply-To: <20180703064005.18908-1-colin.king-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>, Joerg Roedel <joro-zLv9SwRftAIdnm+yROfE0A@public.gmane.org>, iommu-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org
Cc: kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

On 07/03/2018 01:40 AM, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Currently tag is being assigned but not used, it is missing from
> the dev_err message, so add it in.
> 
> Cleans up clang warning:
> warning: variable 'tag' set but not used [-Wunused-but-set-variable]
> 
> Fixes: e7f63ffc1bf1 ("iommu/amd: Update logging information for new event type")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> 
> ---
> This is a re-working of an earlier incorrect fix that I posted
> yesterday ("iommu/amd: remove redundant variable tag")

Acked-by: Gary R Hook <gary.hook@amd.com>

> 
> ---
>   drivers/iommu/amd_iommu.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/iommu/amd_iommu.c b/drivers/iommu/amd_iommu.c
> index 596b95c50051..6adab2690793 100644
> --- a/drivers/iommu/amd_iommu.c
> +++ b/drivers/iommu/amd_iommu.c
> @@ -616,9 +616,9 @@ static void iommu_print_event(struct amd_iommu *iommu, void *__evt)
>   		pasid = ((event[0] >> 16) & 0xFFFF)
>   			| ((event[1] << 6) & 0xF0000);
>   		tag = event[1] & 0x03FF;
> -		dev_err(dev, "INVALID_PPR_REQUEST device=%02x:%02x.%x pasid=0x%05x address=0x%016llx flags=0x%04x]\n",
> +		dev_err(dev, "INVALID_PPR_REQUEST device=%02x:%02x.%x pasid=0x%05x address=0x%016llx flags=0x%04x tag=0x%03x]\n",
>   			PCI_BUS_NUM(devid), PCI_SLOT(devid), PCI_FUNC(devid),
> -			pasid, address, flags);
> +			pasid, address, flags, tag);
>   		break;
>   	default:
>   		dev_err(dev, "UNKNOWN event[0]=0x%08x event[1]=0x%08x event[2]=0x%08x event[3]=0x%08x\n",
> 

