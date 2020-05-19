From: Joerg Roedel <joro@8bytes.org>
Date: Tue, 19 May 2020 12:06:38 +0000
Subject: Re: [PATCH -next] iommu/sun50i: Fix return value check in sun50i_iommu_probe()
Message-Id: <20200519120638.GG18353@8bytes.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200519091857.134170-1-weiyongjun1@huawei.com>
In-Reply-To: <20200519091857.134170-1-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wei Yongjun <weiyongjun1@huawei.com>
Cc: kernel-janitors@vger.kernel.org, iommu@lists.linux-foundation.org, Maxime Ripard <mripard@kernel.org>, linux-kernel@vger.kernel.org, Hulk Robot <hulkci@huawei.com>, Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <maxime@cerno.tech>, Philipp Zabel <p.zabel@pengutronix.de>, linux-arm-kernel@lists.infradead.org

On Tue, May 19, 2020 at 09:18:57AM +0000, Wei Yongjun wrote:
> In case of error, the function devm_platform_ioremap_resource() returns
> ERR_PTR() not NULL. The NULL test in the return value check must be
> replaced with IS_ERR().
> 
> Fixes: 4100b8c229b3 ("iommu: Add Allwinner H6 IOMMU driver")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> ---
>  drivers/iommu/sun50i-iommu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied, thanks.
