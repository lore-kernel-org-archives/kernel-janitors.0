From: Joerg Roedel <joro@8bytes.org>
Date: Wed, 13 May 2020 08:57:52 +0000
Subject: Re: [PATCH -next] iommu/amd: Remove set but not used variable 'iommu'
Message-Id: <20200513085752.GF9820@8bytes.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200508134036.116569-1-yuehaibing@huawei.com>
In-Reply-To: <20200508134036.116569-1-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: YueHaibing <yuehaibing@huawei.com>
Cc: iommu@lists.linux-foundation.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Fri, May 08, 2020 at 01:40:36PM +0000, YueHaibing wrote:
> Fixes gcc '-Wunused-but-set-variable' warning:
> 
> drivers/iommu/amd_iommu.c: In function 'amd_iommu_uninit_device':
> drivers/iommu/amd_iommu.c:422:20: warning:
>  variable 'iommu' set but not used [-Wunused-but-set-variable]
> 
> commit dce8d6964ebd ("iommu/amd: Convert to probe/release_device() call-backs")
> involved this, remove it.
> 
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> ---
>  drivers/iommu/amd_iommu.c | 3 ---
>  1 file changed, 3 deletions(-)

Thanks for the patch, but I already applied

	https://lore.kernel.org/r/20200509015645.3236-1-cai@lca.pw

Regards,

	Joerg
