From: "Martin K. Petersen" <martin.petersen@oracle.com>
Date: Wed, 09 Dec 2020 17:23:16 +0000
Subject: Re: [PATCH] scsi: qla4xxx: remove redundant assignment to variable rval
Message-Id: <160753457756.14816.15596316150027507404.b4-ty@oracle.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201204191810.1150995-1-colin.king@canonical.com>
In-Reply-To: <20201204191810.1150995-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Nilesh Javali <njavali@marvell.com>, "James E . J . Bottomley" <jejb@linux.ibm.com>, Manish Rangankar <mrangankar@marvell.com>, Colin King <colin.king@canonical.com>, linux-scsi@vger.kernel.org, GR-QLogic-Storage-Upstream@marvell.com
Cc: "Martin K . Petersen" <martin.petersen@oracle.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Fri, 4 Dec 2020 19:18:10 +0000, Colin King wrote:

> The variable rval is being initialized with a value that is never read
> and it is being updated later with a new value.  The initialization is
> redundant and can be removed.

Applied to 5.11/scsi-queue, thanks!

[1/1] scsi: qla4xxx: remove redundant assignment to variable rval
      https://git.kernel.org/mkp/scsi/c/3a5b9fa2cc5f

-- 
Martin K. Petersen	Oracle Linux Engineering
