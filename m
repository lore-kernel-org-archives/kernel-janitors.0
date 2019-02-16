From: "Martin K. Petersen" <martin.petersen@oracle.com>
Date: Sat, 16 Feb 2019 03:32:41 +0000
Subject: Re: [PATCH][V2] scsi: qla2xxx: remove redundant null check on pointer sess
Message-Id: <yq1imxkmmqu.fsf@oracle.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190215095232.28852-1-colin.king@canonical.com>
In-Reply-To: <20190215095232.28852-1-colin.king@canonical.com> (Colin King's
        message of "Fri, 15 Feb 2019 09:52:32 +0000")
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: qla2xxx-upstream@qlogic.com, "James E . J . Bottomley" <jejb@linux.ibm.com>, "Martin K . Petersen" <martin.petersen@oracle.com>, linux-scsi@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org


Colin,

> The null check on pointer sess and the subsequent call is redundant as
> sess is null on all the the paths that lead to the out_term2 label.
> Hence the null check and the call can be removed.  Also remove the
> redundant setting of sess to NULL as this is not required now.

Applied to 5.1/scsi-queue, thanks!

-- 
Martin K. Petersen	Oracle Linux Engineering
