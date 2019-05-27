From: Joerg Roedel <joro@8bytes.org>
Date: Mon, 27 May 2019 10:03:27 +0000
Subject: Re: [PATCH] iommu/amd: remove redundant assignment to variable npages
Message-Id: <20190527100327.GC8420@8bytes.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190511124135.3635-1-colin.king@canonical.com>
In-Reply-To: <20190511124135.3635-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: iommu@lists.linux-foundation.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Sat, May 11, 2019 at 01:41:35PM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The variable npages is being initialized however this is never read and
> later it is being reassigned to a new value. The initialization is
> redundant and hence can be removed.
> 
> Addresses-Coverity: ("Unused Value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/iommu/amd_iommu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied, thanks.
