From: Joerg Roedel <joro@8bytes.org>
Date: Wed, 02 Mar 2016 14:53:55 +0000
Subject: Re: [patch] iommu/exynos: checking for IS_ERR() instead of NULL
Message-Id: <20160302145355.GE20213@8bytes.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160302101047.GH5533@mwanda>
In-Reply-To: <20160302101047.GH5533@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Cc: Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, iommu-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org, Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

On Wed, Mar 02, 2016 at 01:10:47PM +0300, Dan Carpenter wrote:
> of_platform_device_create() returns NULL on error, it never returns
> error pointers.
> 
> Fixes: 8ed55c812fa8 ('iommu/exynos: Init from dt-specific callback instead of initcall')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied, thanks.

