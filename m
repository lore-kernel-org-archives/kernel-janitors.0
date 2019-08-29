From: "Martin K. Petersen" <martin.petersen@oracle.com>
Date: Thu, 29 Aug 2019 21:41:56 +0000
Subject: Re: [PATCH] scsi: bfa: remove redundant assignment to variable error
Message-Id: <yq1k1avsl7f.fsf@oracle.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190731221152.15304-1-colin.king@canonical.com>
In-Reply-To: <20190731221152.15304-1-colin.king@canonical.com> (Colin King's
        message of "Wed, 31 Jul 2019 23:11:52 +0100")
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Anil Gurumurthy <anil.gurumurthy@qlogic.com>, Sudarsana Kalluru <sudarsana.kalluru@qlogic.com>, "James E . J . Bottomley" <jejb@linux.ibm.com>, "Martin K . Petersen" <martin.petersen@oracle.com>, linux-scsi@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org


Colin,

> Variable error is being initialized with a value that is never read
> and error is being re-assigned a little later on. The assignment is
> redundant and hence can be removed.

Applied to 5.4/scsi-queue, thanks!

-- 
Martin K. Petersen	Oracle Linux Engineering
