From: "Martin K. Petersen" <martin.petersen@oracle.com>
Date: Wed, 20 May 2020 02:30:08 +0000
Subject: Re: [PATCH -next] scsi: cxlflash: Fix error return code in cxlflash_probe()
Message-Id: <158994171817.20861.9312326618891332978.b4-ty@oracle.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200428141855.88704-1-weiyongjun1@huawei.com>
In-Reply-To: <20200428141855.88704-1-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Manoj N . Kumar" <manoj@linux.ibm.com>, Uma Krishnan <ukrishn@linux.ibm.com>, "James E.J. Bottomley" <jejb@linux.ibm.com>, Wei Yongjun <weiyongjun1@huawei.com>, "Matthew R. Ochs" <mrochs@linux.ibm.com>
Cc: "Martin K . Petersen" <martin.petersen@oracle.com>, kernel-janitors@vger.kernel.org, linux-scsi@vger.kernel.org

On Tue, 28 Apr 2020 14:18:55 +0000, Wei Yongjun wrote:

> Fix to return negative error code -ENOMEM from create_afu error
> handling case instead of 0, as done elsewhere in this function.

Applied to 5.8/scsi-queue, thanks!

[1/1] scsi: cxlflash: Fix error return code in cxlflash_probe()
      https://git.kernel.org/mkp/scsi/c/d0b1e4a638d6

-- 
Martin K. Petersen	Oracle Linux Engineering
