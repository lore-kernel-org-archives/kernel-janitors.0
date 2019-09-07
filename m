From: "Martin K. Petersen" <martin.petersen@oracle.com>
Date: Sat, 07 Sep 2019 20:40:10 +0000
Subject: Re: [PATCH -next] scsi: ufs: Use kmemdup in ufshcd_read_string_desc()
Message-Id: <yq18sqzkfh1.fsf@oracle.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190831124424.18642-1-yuehaibing@huawei.com>
In-Reply-To: <20190831124424.18642-1-yuehaibing@huawei.com>
        (yuehaibing@huawei.com's message of "Sat, 31 Aug 2019 12:44:24 +0000")
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: YueHaibing <yuehaibing@huawei.com>
Cc: Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman <avri.altman@wdc.com>, Pedro Sousa <pedrom.sousa@synopsys.com>, "James E.J. Bottomley" <jejb@linux.ibm.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, Tomas Winkler <tomas.winkler@intel.com>, Subhash Jadavani <subhashj@codeaurora.org>, linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org


YueHaibing,

> Use kmemdup rather than duplicating its implementation

Applied to 5.4/scsi-queue. Thanks!

-- 
Martin K. Petersen	Oracle Linux Engineering
