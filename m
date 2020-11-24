From: "Martin K. Petersen" <martin.petersen@oracle.com>
Date: Tue, 24 Nov 2020 03:58:01 +0000
Subject: Re: [PATCH][next] scsi: lpfc: remove dead code on second !ndlp check
Message-Id: <160618683552.24173.9532956225953675883.b4-ty@oracle.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201118133744.461385-1-colin.king@canonical.com>
In-Reply-To: <20201118133744.461385-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-scsi@vger.kernel.org, James Smart <james.smart@broadcom.com>, Colin King <colin.king@canonical.com>, "James E . J . Bottomley" <jejb@linux.ibm.com>, Dick Kennedy <dick.kennedy@broadcom.com>
Cc: "Martin K . Petersen" <martin.petersen@oracle.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, 18 Nov 2020 13:37:44 +0000, Colin King wrote:

> Currently there is a null check on the pointer ndlp that exits via
> error path issue_ct_rsp_exit followed by another null check on the
> same pointer that is almost identical to the previous null check
> stanza and yet can never can be reached because the previous check
> exited via issue_ct_rsp_exit. This is deadcode and can be removed.

Applied to 5.11/scsi-queue, thanks!

[1/1] scsi: lpfc: Remove dead code on second !ndlp check
      https://git.kernel.org/mkp/scsi/c/61795a5316ad

-- 
Martin K. Petersen	Oracle Linux Engineering
