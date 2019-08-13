From: "Martin K. Petersen" <martin.petersen@oracle.com>
Date: Tue, 13 Aug 2019 01:58:33 +0000
Subject: Re: [PATCH] scsi: sym53c8xx_2: remove redundant assignment to retv
Message-Id: <yq14l2l967q.fsf@oracle.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190809175932.10197-1-colin.king@canonical.com>
In-Reply-To: <20190809175932.10197-1-colin.king@canonical.com> (Colin King's
        message of "Fri, 9 Aug 2019 18:59:32 +0100")
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Matthew Wilcox <willy@infradead.org>, "James E . J . Bottomley" <jejb@linux.ibm.com>, "Martin K . Petersen" <martin.petersen@oracle.com>, linux-scsi@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org


Colin,

> Variable retv is initialized to a value that is never read and it is
> re-assigned later. The initialization is redundant and can be removed.

Applied to 5.4/scsi-queue, thanks!

-- 
Martin K. Petersen	Oracle Linux Engineering
