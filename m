From: Joerg Roedel <joro@8bytes.org>
Date: Tue, 03 Nov 2020 13:56:25 +0000
Subject: Re: [PATCH] iommu: fix a check in iommu_check_bind_data()
Message-Id: <20201103135625.GK22888@8bytes.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201103101623.GA1127762@mwanda>
In-Reply-To: <20201103101623.GA1127762@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>, Jacob Pan <jacob.pan.linux@gmail.com>, kernel-janitors@vger.kernel.org, iommu@lists.linux-foundation.org

On Tue, Nov 03, 2020 at 01:16:23PM +0300, Dan Carpenter wrote:
> The "data->flags" variable is a u64 so if one of the high 32 bits is
> set the original code will allow it, but it should be rejected.  The
> fix is to declare "mask" as a u64 instead of a u32.
> 
> Fixes: d90573812eea ("iommu/uapi: Handle data and argsz filled by users")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/iommu/iommu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied for v5.10, thanks.
