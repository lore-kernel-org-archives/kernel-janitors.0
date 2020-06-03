From: "Martin K. Petersen" <martin.petersen@oracle.com>
Date: Wed, 03 Jun 2020 02:31:35 +0000
Subject: Re: [PATCH] scsi: qedf: remove redundant initialization of variable rc
Message-Id: <159114947917.26776.1378073901882312431.b4-ty@oracle.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200527115242.172344-1-colin.king@canonical.com>
In-Reply-To: <20200527115242.172344-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: QLogic-Storage-Upstream@cavium.com, linux-scsi@vger.kernel.org, "James E . J . Bottomley" <jejb@linux.ibm.com>, Colin King <colin.king@canonical.com>
Cc: "Martin K . Petersen" <martin.petersen@oracle.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, 27 May 2020 12:52:42 +0100, Colin King wrote:

> The variable rc is being initialized with a value that is never read
> and it is being updated later with a new value.  The initialization is
> redundant and can be removed.

Applied to 5.8/scsi-queue, thanks!

[1/1] scsi: qedf: Remove redundant initialization of variable rc
      https://git.kernel.org/mkp/scsi/c/89523cb8a67c

-- 
Martin K. Petersen	Oracle Linux Engineering
