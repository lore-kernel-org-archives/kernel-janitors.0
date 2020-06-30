From: "Martin K. Petersen" <martin.petersen@oracle.com>
Date: Tue, 30 Jun 2020 03:23:04 +0000
Subject: Re: [PATCH] scsi: ufs: ufs-exynos: Remove an unnecessary NULL check
Message-Id: <159348736490.22355.10176976047581563338.b4-ty@oracle.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200626105133.GF314359@mwanda>
In-Reply-To: <20200626105133.GF314359@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alim Akhtar <alim.akhtar@samsung.com>, Dan Carpenter <dan.carpenter@oracle.com>
Cc: "Martin K . Petersen" <martin.petersen@oracle.com>, Kiwoong Kim <kwmad.kim@samsung.com>, linux-scsi@vger.kernel.org, kernel-janitors@vger.kernel.org, "James E.J. Bottomley" <jejb@linux.ibm.com>, linux-samsung-soc@vger.kernel.org, Avri Altman <avri.altman@wdc.com>, linux-kernel@vger.kernel.org, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Wei Yongjun <weiyongjun1@huawei.com>

On Fri, 26 Jun 2020 13:51:33 +0300, Dan Carpenter wrote:

> The "head" pointer can't be NULL because it points to an address in
> the middle of a ufs_hba struct.  Looking at this code, probably someone
> would wonder if the intent was to check whether "hba" is NULL, but "hba"
> isn't NULL and the check can just be removed.

Applied to 5.9/scsi-queue, thanks!

[1/1] scsi: ufs: ufs-exynos: Remove an unnecessary NULL check
      https://git.kernel.org/mkp/scsi/c/b7a80dac0f1f

-- 
Martin K. Petersen	Oracle Linux Engineering
