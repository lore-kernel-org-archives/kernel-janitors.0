From: Joerg Roedel <joro@8bytes.org>
Date: Thu, 07 Jan 2016 12:08:45 +0000
Subject: Re: [patch] iommu/amd: remove an unneeded condition
Message-Id: <20160107120845.GD19149@8bytes.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160107093606.GB27186@mwanda>
In-Reply-To: <20160107093606.GB27186@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Cc: iommu-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jiang Liu <jiang.liu-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>

On Thu, Jan 07, 2016 at 12:36:06PM +0300, Dan Carpenter wrote:
> get_device_id() returns an unsigned short device id.  It never fails and
> it never returns a negative so we can remove this condition.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied, thanks.

