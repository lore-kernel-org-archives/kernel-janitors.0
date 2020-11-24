From: "Martin K. Petersen" <martin.petersen@oracle.com>
Date: Tue, 24 Nov 2020 03:58:00 +0000
Subject: Re: [PATCH][next] scsi: lpfc: fix pointer defereference before it is null checked issue
Message-Id: <160618683552.24173.13742714512709142456.b4-ty@oracle.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201118131345.460631-1-colin.king@canonical.com>
In-Reply-To: <20201118131345.460631-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-scsi@vger.kernel.org, James Smart <james.smart@broadcom.com>, Colin King <colin.king@canonical.com>, "James E . J . Bottomley" <jejb@linux.ibm.com>, Dick Kennedy <dick.kennedy@broadcom.com>
Cc: "Martin K . Petersen" <martin.petersen@oracle.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, 18 Nov 2020 13:13:45 +0000, Colin King wrote:

> There is a null check on pointer lpfc_cmd after the pointer has been
> dereferenced when pointers rdata and ndlp are initialized at the start
> of the function. Fix this by only assigning rdata and ndlp after the
> pointer lpfc_cmd has been null checked.

Applied to 5.11/scsi-queue, thanks!

[1/1] scsi: lpfc: Fix pointer defereference before it is null checked issue
      https://git.kernel.org/mkp/scsi/c/1e7dddb2e76a

-- 
Martin K. Petersen	Oracle Linux Engineering
