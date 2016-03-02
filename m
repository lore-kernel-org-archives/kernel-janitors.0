From: Joerg Roedel <joro@8bytes.org>
Date: Wed, 02 Mar 2016 14:49:52 +0000
Subject: Re: [patch 2/2] iommu/mediatek: checking for IS_ERR() instead of NULL
Message-Id: <20160302144952.GD20213@8bytes.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160302101027.GG5533@mwanda>
In-Reply-To: <20160302101027.GG5533@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Cc: kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, iommu-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

On Wed, Mar 02, 2016 at 01:10:27PM +0300, Dan Carpenter wrote:
> of_platform_device_create() returns NULL on error, it never returns
> error pointers.
> 
> Fixes: 0df4fabe208d ('iommu/mediatek: Add mt8173 IOMMU driver')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied, thanks.

