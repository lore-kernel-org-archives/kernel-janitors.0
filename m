From: "Martin K. Petersen" <martin.petersen@oracle.com>
Date: Wed, 09 Sep 2020 02:08:19 +0000
Subject: Re: [PATCH] scsi: libsas: Fix error path in sas_notify_lldd_dev_found()
Message-Id: <159961727333.18958.11850401583995372808.b4-ty@oracle.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200905125836.GF183976@mwanda>
In-Reply-To: <20200905125836.GF183976@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Dan Williams <dan.j.williams@intel.com>, "James E.J. Bottomley" <jejb@linux.ibm.com>
Cc: "Martin K . Petersen" <martin.petersen@oracle.com>, John Garry <john.garry@huawei.com>, linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org, "Gustavo A. R. Silva" <gustavoars@kernel.org>, kernel-janitors@vger.kernel.org, Jason Yan <yanaijie@huawei.com>

On Sat, 5 Sep 2020 15:58:36 +0300, Dan Carpenter wrote:

> In sas_notify_lldd_dev_found(), if we can't find a device, then it seems
> like the wrong thing to mark the device as found and to increment the
> reference count.  None of the callers ever drop the reference in that
> situation.

Applied to 5.9/scsi-fixes, thanks!

[1/1] scsi: libsas: Fix error path in sas_notify_lldd_dev_found()
      https://git.kernel.org/mkp/scsi/c/fdcb7900d9ab

-- 
Martin K. Petersen	Oracle Linux Engineering
