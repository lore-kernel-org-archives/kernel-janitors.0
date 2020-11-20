From: "Martin K. Petersen" <martin.petersen@oracle.com>
Date: Fri, 20 Nov 2020 03:17:12 +0000
Subject: Re: [PATCH][next] scsi: lpfc: remove dead code on second !ndlp check
Message-Id: <yq1tutkwwcx.fsf@ca-mkp.ca.oracle.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201118133744.461385-1-colin.king@canonical.com>
In-Reply-To: <20201118133744.461385-1-colin.king@canonical.com> (Colin King's
        message of "Wed, 18 Nov 2020 13:37:44 +0000")
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: James Smart <james.smart@broadcom.com>, Dick Kennedy <dick.kennedy@broadcom.com>, "James E . J . Bottomley" <jejb@linux.ibm.com>, "Martin K . Petersen" <martin.petersen@oracle.com>, linux-scsi@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org


Colin,

> Currently there is a null check on the pointer ndlp that exits via
> error path issue_ct_rsp_exit followed by another null check on the
> same pointer that is almost identical to the previous null check
> stanza and yet can never can be reached because the previous check
> exited via issue_ct_rsp_exit. This is deadcode and can be removed.

Applied to 5.11/scsi-staging, thanks!

-- 
Martin K. Petersen	Oracle Linux Engineering
