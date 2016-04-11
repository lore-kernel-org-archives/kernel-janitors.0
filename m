From: "Wan, Vincent" <Vincent.Wan@amd.com>
Date: Mon, 11 Apr 2016 07:22:52 +0000
Subject: RE: [patch] iommu/amd: Signedness bug in acpihid_device_group()
Message-Id: <DM3PR1201MB10232C2338DEECF7E74AAAA2E6940@DM3PR1201MB1023.namprd12.prod.outlook.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160411071446.GB10739@mwanda>
In-Reply-To: <20160411071446.GB10739@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>, Joerg Roedel <joro-zLv9SwRftAIdnm+yROfE0A@public.gmane.org>
Cc: "iommu-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org" <iommu-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org>, "kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>

> From: Dan Carpenter [mailto:dan.carpenter@oracle.com]
> Sent: Monday, April 11, 2016 3:15 PM
> To: Joerg Roedel; Wan, Vincent
> Cc: iommu@lists.linux-foundation.org; linux-kernel@vger.kernel.org; kernel-
> janitors@vger.kernel.org
> Subject: [patch] iommu/amd: Signedness bug in acpihid_device_group()
> 
> "devid" needs to be signed for the error handling to work.
> 
> Fixes:b097d11a0fa3f ('iommu/amd: Manage iommu_group for ACPI HID
> devices')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> diff --git a/drivers/iommu/amd_iommu.c b/drivers/iommu/amd_iommu.c
> index c430c10..12f7779 100644
> --- a/drivers/iommu/amd_iommu.c
> +++ b/drivers/iommu/amd_iommu.c
> @@ -283,7 +283,7 @@ static struct iommu_dev_data *get_dev_data(struct
> device *dev)  static struct iommu_group *acpihid_device_group(struct device
> *dev)  {
>  	struct acpihid_map_entry *p, *entry = NULL;
> -	u16 devid;
> +	int devid;

Sure, thanks for your patch.

Wan Zongshun.

> 
>  	devid = get_acpihid_device_id(dev, &entry);
>  	if (devid < 0)
