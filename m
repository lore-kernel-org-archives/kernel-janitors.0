From: "Martin K. Petersen" <martin.petersen@oracle.com>
Date: Tue, 13 Oct 2020 22:42:46 +0000
Subject: Re: [PATCH] scsi: sym53c8xx_2: fix sizeof mismatch
Message-Id: <160262862435.3018.4642298428321942870.b4-ty@oracle.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201006110252.536641-1-colin.king@canonical.com>
In-Reply-To: <20201006110252.536641-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "James E . J . Bottomley" <jejb@linux.ibm.com>, Matthew Wilcox <willy@infradead.org>, Colin King <colin.king@canonical.com>, linux-scsi@vger.kernel.org
Cc: "Martin K . Petersen" <martin.petersen@oracle.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Tue, 6 Oct 2020 12:02:52 +0100, Colin King wrote:

> An incorrect sizeof is being used, struct sym_ccb ** is not correct,
> it should be struct sym_ccb *. Note that since ** is the same size as
> * this is not causing any issues.  Improve this fix by using the
> idiom sizeof(*np->ccbh) as this allows one to not even reference the
> type of the pointer.
> 
> [ Note: this is an ancient 2005 buglet, the sha is from the
>   tglx/history repo ]

Applied to 5.10/scsi-queue, thanks!

[1/1] scsi: sym53c8xx_2: Fix sizeof() mismatch
      https://git.kernel.org/mkp/scsi/c/1725ba8d6ff1

-- 
Martin K. Petersen	Oracle Linux Engineering
