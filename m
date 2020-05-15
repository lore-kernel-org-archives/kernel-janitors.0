From: "Martin K. Petersen" <martin.petersen@oracle.com>
Date: Fri, 15 May 2020 01:10:28 +0000
Subject: Re: [PATCH] scsi: aacraid: Fix an Oops in error handling
Message-Id: <158950485294.8169.9682857771113228452.b4-ty@oracle.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200513093703.GB347693@mwanda>
In-Reply-To: <20200513093703.GB347693@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Adaptec OEM Raid Solutions <aacraid@microsemi.com>, Dan Carpenter <dan.carpenter@oracle.com>, Zou Wei <zou_wei@huawei.com>
Cc: "Martin K . Petersen" <martin.petersen@oracle.com>, "James E.J. Bottomley" <jejb@linux.ibm.com>, kernel-janitors@vger.kernel.org, linux-scsi@vger.kernel.org

On Wed, 13 May 2020 12:37:03 +0300, Dan Carpenter wrote:

> If the memdup_user() function fails then it results in an Oops in the
> error handling code when we try to kfree() and error pointer.

Applied to 5.8/scsi-queue, thanks!

[1/1] scsi: aacraid: Fix an oops in error handling
      https://git.kernel.org/mkp/scsi/c/25c21d20bcfd

-- 
Martin K. Petersen	Oracle Linux Engineering
