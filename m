From: "Martin K. Petersen" <martin.petersen@oracle.com>
Date: Thu, 08 Oct 2020 03:12:32 +0000
Subject: Re: [PATCH] scsi: sym53c8xx_2: fix sizeof mismatch
Message-Id: <yq1a6wxwgva.fsf@ca-mkp.ca.oracle.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201006110252.536641-1-colin.king@canonical.com>
In-Reply-To: <20201006110252.536641-1-colin.king@canonical.com> (Colin King's
        message of "Tue, 6 Oct 2020 12:02:52 +0100")
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Matthew Wilcox <willy@infradead.org>, "James E . J . Bottomley" <jejb@linux.ibm.com>, "Martin K . Petersen" <martin.petersen@oracle.com>, linux-scsi@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org


Colin,

> An incorrect sizeof is being used, struct sym_ccb ** is not correct,
> it should be struct sym_ccb *. Note that since ** is the same size as
> * this is not causing any issues.  Improve this fix by using the idiom
> sizeof(*np->ccbh) as this allows one to not even reference the type of
> the pointer.

Applied to 5.10/scsi-staging, thanks!

-- 
Martin K. Petersen	Oracle Linux Engineering
