From: "Martin K. Petersen" <martin.petersen@oracle.com>
Date: Wed, 08 Jul 2020 06:06:47 +0000
Subject: Re: [PATCH][next] scsi: lpfc: fix inconsistent indenting
Message-Id: <159418828150.5152.17012831289512414220.b4-ty@oracle.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200707150018.823350-1-colin.king@canonical.com>
In-Reply-To: <20200707150018.823350-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "James E . J . Bottomley" <jejb@linux.ibm.com>, linux-scsi@vger.kernel.org, Dick Kennedy <dick.kennedy@broadcom.com>, Colin King <colin.king@canonical.com>, James Smart <james.smart@broadcom.com>
Cc: "Martin K . Petersen" <martin.petersen@oracle.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Tue, 7 Jul 2020 16:00:18 +0100, Colin King wrote:

> Fix smatch warning:
> drivers/scsi/lpfc/lpfc_sli.c:15156 lpfc_cq_poll_hdler() warn: inconsistent
> indenting

Applied to 5.9/scsi-queue, thanks!

[1/1] scsi: lpfc: Fix inconsistent indenting
      https://git.kernel.org/mkp/scsi/c/26e0b9aa3578

-- 
Martin K. Petersen	Oracle Linux Engineering
