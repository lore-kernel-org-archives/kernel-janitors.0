From: "Martin K. Petersen" <martin.petersen@oracle.com>
Date: Tue, 12 May 2020 03:28:29 +0000
Subject: Re: [PATCH] scsi: scsi_debug: fix an error handling bug in sdeb_zbc_model_str()
Message-Id: <158925392375.17325.5928930344403606433.b4-ty@oracle.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200509100408.GA5555@mwanda>
In-Reply-To: <20200509100408.GA5555@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "James E.J. Bottomley" <jejb@linux.ibm.com>, Dan Carpenter <dan.carpenter@oracle.com>, Douglas Gilbert <dgilbert@interlog.com>
Cc: "Martin K . Petersen" <martin.petersen@oracle.com>, kernel-janitors@vger.kernel.org, linux-scsi@vger.kernel.org

On Sat, 9 May 2020 13:04:08 +0300, Dan Carpenter wrote:

> This test is checking the wrong variable.  It should be testing "ret".
> The "sdeb_zbc_model" variable is an enum (unsigned in this situation)
> and we never assign negative values to it.

Applied to 5.8/scsi-queue, thanks!

[1/1] scsi: scsi_debug: Fix an error handling bug in sdeb_zbc_model_str()
      https://git.kernel.org/mkp/scsi/c/47742bde281b

-- 
Martin K. Petersen	Oracle Linux Engineering
