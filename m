From: "Martin K. Petersen" <martin.petersen@oracle.com>
Date: Wed, 19 Apr 2017 01:54:07 +0000
Subject: Re: [PATCH] scsi: fc: remove redundant check of an unsigned long being less than zero
Message-Id: <yq1d1c9tb5s.fsf@oracle.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170414135802.6991-1-colin.king@canonical.com>
In-Reply-To: <20170414135802.6991-1-colin.king@canonical.com> (Colin King's
        message of "Fri, 14 Apr 2017 14:58:02 +0100")
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: "James E . J . Bottomley" <jejb@linux.vnet.ibm.com>, "Martin K . Petersen" <martin.petersen@oracle.com>, linux-scsi@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Colin King <colin.king@canonical.com> writes:

> The check for an unsigned long being less than zero is always false so
> it is a redundant check and can be removed.

Applied to 4.12/scsi-queue.

-- 
Martin K. Petersen	Oracle Linux Engineering
