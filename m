From: "Martin K. Petersen" <martin.petersen@oracle.com>
Date: Sat, 25 Jul 2020 02:50:33 +0000
Subject: Re: [PATCH] scsi: isci: remove redundant initialization of variable status
Message-Id: <159564519423.31464.662630080230658791.b4-ty@oracle.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200723142614.991416-1-colin.king@canonical.com>
In-Reply-To: <20200723142614.991416-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Artur Paszkiewicz <artur.paszkiewicz@intel.com>, linux-scsi@vger.kernel.org, "James E . J . Bottomley" <jejb@linux.ibm.com>, Intel SCU Linux support <intel-linux-scu@intel.com>, Colin King <colin.king@canonical.com>
Cc: "Martin K . Petersen" <martin.petersen@oracle.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Thu, 23 Jul 2020 15:26:14 +0100, Colin King wrote:

> The variable status is being initialized with a value that is never read
> and it is being updated later with a new value.  The initialization is
> redundant and can be removed.

Applied to 5.9/scsi-queue, thanks!

[1/1] scsi: isci: Remove redundant initialization of variable 'status'
      https://git.kernel.org/mkp/scsi/c/584d902eb10e

-- 
Martin K. Petersen	Oracle Linux Engineering
