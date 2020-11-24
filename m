From: "Martin K. Petersen" <martin.petersen@oracle.com>
Date: Tue, 24 Nov 2020 03:57:59 +0000
Subject: Re: [PATCH][next] scsi: lpfc: Fix memory leak on lcb_context
Message-Id: <160618683552.24173.1098115721701350297.b4-ty@oracle.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201118141314.462471-1-colin.king@canonical.com>
In-Reply-To: <20201118141314.462471-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-scsi@vger.kernel.org, James Smart <james.smart@broadcom.com>, Colin King <colin.king@canonical.com>, "James E . J . Bottomley" <jejb@linux.ibm.com>, Dick Kennedy <dick.kennedy@broadcom.com>
Cc: "Martin K . Petersen" <martin.petersen@oracle.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, 18 Nov 2020 14:13:14 +0000, Colin King wrote:

> Currently there is an error return path that neglects to free the
> allocation for lcb_context.  Fix this by adding a new error free
> exit path that kfree's lcb_context before returning.  Use this new
> kfree exit path in another exit error path that also kfree's the same
> object, allowing a line of code to be removed.

Applied to 5.11/scsi-queue, thanks!

[1/1] scsi: lpfc: Fix memory leak on lcb_context
      https://git.kernel.org/mkp/scsi/c/14c1dd950411

-- 
Martin K. Petersen	Oracle Linux Engineering
