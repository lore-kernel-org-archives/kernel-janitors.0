From: "Martin K. Petersen" <martin.petersen@oracle.com>
Date: Wed, 10 Jan 2018 21:50:53 +0000
Subject: Re: [PATCH][scsi-next] scsi: qla2xxx: remove redundant assignment of d
Message-Id: <yq1po6hv0w2.fsf@oracle.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180105155037.17981-1-colin.king@canonical.com>
In-Reply-To: <20180105155037.17981-1-colin.king@canonical.com> (Colin King's
        message of "Fri, 5 Jan 2018 15:50:37 +0000")
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: qla2xxx-upstream@qlogic.com, "James E . J . Bottomley" <jejb@linux.vnet.ibm.com>, "Martin K . Petersen" <martin.petersen@oracle.com>, linux-scsi@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org


Colin,

> The initialization of d is redundant as this value is never read
> and it is overwritten inside the subsequent for-loop.  Remove this
> redundant assignment.

Applied to 4.16/scsi-queue.

-- 
Martin K. Petersen	Oracle Linux Engineering
