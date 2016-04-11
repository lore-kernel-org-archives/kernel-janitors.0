From: Joerg Roedel <joro@8bytes.org>
Date: Mon, 11 Apr 2016 14:11:32 +0000
Subject: Re: [patch] iommu/amd: Signedness bug in acpihid_device_group()
Message-Id: <20160411141132.GP17838@8bytes.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160411071446.GB10739@mwanda>
In-Reply-To: <20160411071446.GB10739@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Cc: Wan Zongshun <Vincent.Wan-5C7GfCeVMHo@public.gmane.org>, iommu-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

On Mon, Apr 11, 2016 at 10:14:46AM +0300, Dan Carpenter wrote:
> "devid" needs to be signed for the error handling to work.
> 
> Fixes:b097d11a0fa3f ('iommu/amd: Manage iommu_group for ACPI HID devices')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied, thanks.

