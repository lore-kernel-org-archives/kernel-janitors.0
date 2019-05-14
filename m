From: "Martin K. Petersen" <martin.petersen@oracle.com>
Date: Tue, 14 May 2019 17:12:30 +0000
Subject: Re: [PATCH] scsi: bnx2fc: fix incorrect cast to u64 on shift operation
Message-Id: <yq18sv9dkox.fsf@oracle.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190504164829.26631-1-colin.king@canonical.com>
In-Reply-To: <20190504164829.26631-1-colin.king@canonical.com> (Colin King's
        message of "Sat, 4 May 2019 17:48:29 +0100")
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: QLogic-Storage-Upstream@qlogic.com, "James E . J . Bottomley" <jejb@linux.ibm.com>, "Martin K . Petersen" <martin.petersen@oracle.com>, linux-scsi@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org


Colin,

> Currently an int is being shifted and the result is being cast to a
> u64 which leads to undefined behaviour if the shift is more than 31
> bits. Fix this by casting the integer value 1 to u64 before the shift
> operation.

Applied to 5.2/scsi-fixes, thanks!

-- 
Martin K. Petersen	Oracle Linux Engineering
