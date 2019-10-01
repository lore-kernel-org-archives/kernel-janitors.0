From: "Martin K. Petersen" <martin.petersen@oracle.com>
Date: Tue, 01 Oct 2019 02:41:43 +0000
Subject: Re: [PATCH] scsi: qla2xxx: remove redundant assignment to pointer host
Message-Id: <yq1imp9yyoo.fsf@oracle.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190905134229.21194-1-colin.king@canonical.com>
In-Reply-To: <20190905134229.21194-1-colin.king@canonical.com> (Colin King's
        message of "Thu, 5 Sep 2019 14:42:29 +0100")
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: qla2xxx-upstream@qlogic.com, "James E . J . Bottomley" <jejb@linux.ibm.com>, "Martin K . Petersen" <martin.petersen@oracle.com>, linux-scsi@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org


Colin,

> The pointer host is being initialized with a value that is never read
> and is being re-assigned a little later on. The assignment is
> redundant and hence can be removed.

Applied to 5.5/scsi-queue, thanks!

-- 
Martin K. Petersen	Oracle Linux Engineering
