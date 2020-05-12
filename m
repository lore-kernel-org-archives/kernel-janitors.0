From: "Martin K. Petersen" <martin.petersen@oracle.com>
Date: Tue, 12 May 2020 03:28:28 +0000
Subject: Re: [PATCH] scsi: lpfc: remove redundant initialization to variable rc
Message-Id: <158925392374.17325.12424804060546822236.b4-ty@oracle.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200507203111.64709-1-colin.king@canonical.com>
In-Reply-To: <20200507203111.64709-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-scsi@vger.kernel.org, James Smart <james.smart@broadcom.com>, Colin King <colin.king@canonical.com>, "James E . J . Bottomley" <jejb@linux.ibm.com>, Dick Kennedy <dick.kennedy@broadcom.com>
Cc: "Martin K . Petersen" <martin.petersen@oracle.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Thu, 7 May 2020 21:31:11 +0100, Colin King wrote:

> The variable rc is being initialized with a value that is never read
> and it is being updated later with a new value.  The initialization is
> redundant and can be removed.

Applied to 5.8/scsi-queue, thanks!

[1/1] scsi: lpfc: Remove redundant initialization to variable rc
      https://git.kernel.org/mkp/scsi/c/6e27a86aed97

-- 
Martin K. Petersen	Oracle Linux Engineering
