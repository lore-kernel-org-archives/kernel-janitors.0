From: Joerg Roedel <joro@8bytes.org>
Date: Wed, 22 Jul 2020 13:03:07 +0000
Subject: Re: [PATCH] OMAP: iommu: check for failure of a call to omap_iommu_dump_ctx
Message-Id: <20200722130307.GC27672@8bytes.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200714192211.744776-1-colin.king@canonical.com>
In-Reply-To: <20200714192211.744776-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Tony Lindgren <tony@atomide.com>, kernel-janitors@vger.kernel.org, iommu@lists.linux-foundation.org, Hiroshi DOYU <Hiroshi.DOYU@nokia.com>, linux-kernel@vger.kernel.org

On Tue, Jul 14, 2020 at 08:22:11PM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> It is possible for the call to omap_iommu_dump_ctx to return
> a negative error number, so check for the failure and return
> the error number rather than pass the negative value to
> simple_read_from_buffer.
> 
> Addresses-Coverity: ("Improper use of negative value")
> Fixes: 14e0e6796a0d ("OMAP: iommu: add initial debugfs support")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/iommu/omap-iommu-debug.c | 3 +++
>  1 file changed, 3 insertions(+)

Applied, thanks.
