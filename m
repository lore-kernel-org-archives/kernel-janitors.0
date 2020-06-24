From: "Martin K. Petersen" <martin.petersen@oracle.com>
Date: Wed, 24 Jun 2020 04:30:22 +0000
Subject: Re: [PATCH -next] scsi: ufs: ufs-exynos: Fix return value check in exynos_ufs_init()
Message-Id: <159297300656.9917.6717865886612566021.b4-ty@oracle.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200618133837.127274-1-weiyongjun1@huawei.com>
In-Reply-To: <20200618133837.127274-1-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Seungwon Jeon <essuuj@gmail.com>, "James E.J. Bottomley" <jejb@linux.ibm.com>, Avri Altman <avri.altman@wdc.com>, Alim Akhtar <alim.akhtar@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Kukjin Kim <kgene@kernel.org>, Kiwoong Kim <kwmad.kim@samsung.com>, Wei Yongjun <weiyongjun1@huawei.com>
Cc: linux-samsung-soc@vger.kernel.org, "Martin K . Petersen" <martin.petersen@oracle.com>, linux-scsi@vger.kernel.org, kernel-janitors@vger.kernel.org, Hulk Robot <hulkci@huawei.com>, linux-arm-kernel@lists.infradead.org

On Thu, 18 Jun 2020 13:38:37 +0000, Wei Yongjun wrote:

> In case of error, the function devm_ioremap_resource() returns ERR_PTR()
> and never returns NULL. The NULL test in the return value check should
> be replaced with IS_ERR().

Applied to 5.9/scsi-queue, thanks!

[1/1] scsi: ufs: ufs-exynos: Fix return value check in exynos_ufs_init()
      https://git.kernel.org/mkp/scsi/c/b2bc2200e89b

-- 
Martin K. Petersen	Oracle Linux Engineering
