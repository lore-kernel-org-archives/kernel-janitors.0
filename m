From: Gary R Hook <ghook@amd.com>
Date: Mon, 02 Jul 2018 20:21:28 +0000
Subject: Re: [PATCH] iommu/amd: remove redundant variable tag
Message-Id: <57a38891-d811-17af-a544-cfeea9476160@amd.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180702163752.16418-1-colin.king@canonical.com>
In-Reply-To: <20180702163752.16418-1-colin.king-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>, Joerg Roedel <joro-zLv9SwRftAIdnm+yROfE0A@public.gmane.org>, iommu-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org
Cc: kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

On 07/02/2018 11:37 AM, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Variable tag is being assigned but is never used hence it is
> redundant and can be removed.
> 
> Cleans up clang warning:
> warning: variable 'tag' set but not used [-Wunused-but-set-variable]
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>   drivers/iommu/amd_iommu.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/iommu/amd_iommu.c b/drivers/iommu/amd_iommu.c
> index 596b95c50051..c6aed1b088e9 100644
> --- a/drivers/iommu/amd_iommu.c
> +++ b/drivers/iommu/amd_iommu.c
> @@ -547,7 +547,7 @@ static void amd_iommu_report_page_fault(u16 devid, u16 domain_id,
>   static void iommu_print_event(struct amd_iommu *iommu, void *__evt)
>   {
>   	struct device *dev = iommu->iommu.dev;
> -	int type, devid, pasid, flags, tag;
> +	int type, devid, pasid, flags;
>   	volatile u32 *event = __evt;
>   	int count = 0;
>   	u64 address;
> @@ -615,7 +615,6 @@ static void iommu_print_event(struct amd_iommu *iommu, void *__evt)
>   	case EVENT_TYPE_INV_PPR_REQ:
>   		pasid = ((event[0] >> 16) & 0xFFFF)
>   			| ((event[1] << 6) & 0xF0000);
> -		tag = event[1] & 0x03FF;
>   		dev_err(dev, "INVALID_PPR_REQUEST device=%02x:%02x.%x pasid=0x%05x address=0x%016llx flags=0x%04x]\n",
>   			PCI_BUS_NUM(devid), PCI_SLOT(devid), PCI_FUNC(devid),
>   			pasid, address, flags);
> 

If it's all the same to you, the intent was to print the tag as well. 
Could we add that to the message, rather than removing the variable, please?


