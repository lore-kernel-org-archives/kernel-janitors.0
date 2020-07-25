From: "Martin K. Petersen" <martin.petersen@oracle.com>
Date: Sat, 25 Jul 2020 02:50:34 +0000
Subject: Re: [PATCH] scsi: libsas: remove redundant assignment to variable res
Message-Id: <159564519422.31464.3717823298731100505.b4-ty@oracle.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200722154404.959267-1-colin.king@canonical.com>
In-Reply-To: <20200722154404.959267-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "James E . J . Bottomley" <jejb@linux.ibm.com>, John Garry <john.garry@huawei.com>, linux-scsi@vger.kernel.org, Colin King <colin.king@canonical.com>
Cc: "Martin K . Petersen" <martin.petersen@oracle.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, 22 Jul 2020 16:44:04 +0100, Colin King wrote:

> The variable res is being initialized with a value that is
> never read and it is being updated later with a new value. The
> initialization is redundant and can be removed.

Applied to 5.9/scsi-queue, thanks!

[1/1] scsi: libsas: Remove redundant assignment to variable res
      https://git.kernel.org/mkp/scsi/c/55eb809f5e1c

-- 
Martin K. Petersen	Oracle Linux Engineering
