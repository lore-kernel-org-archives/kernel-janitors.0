From: "Martin K. Petersen" <martin.petersen@oracle.com>
Date: Wed, 07 Feb 2018 01:26:23 +0000
Subject: Re: [PATCH] scsi: libfc: remove redundant initialization of 'disc'
Message-Id: <yq1y3k5zj28.fsf@oracle.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180206142157.32001-1-colin.king@canonical.com>
In-Reply-To: <20180206142157.32001-1-colin.king@canonical.com> (Colin King's
        message of "Tue, 6 Feb 2018 14:21:57 +0000")
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Johannes Thumshirn <jth@kernel.org>, "James E . J . Bottomley" <jejb@linux.vnet.ibm.com>, "Martin K . Petersen" <martin.petersen@oracle.com>, linux-scsi@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org


Colin,

> Pointer disc is being intializated a value that is never read and then
> re-assigned the same value later on, hence the initialization is redundant
> and can be removed.

Applied to 4.17/scsi-queue.

-- 
Martin K. Petersen	Oracle Linux Engineering
