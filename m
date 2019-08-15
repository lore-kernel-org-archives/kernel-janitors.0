From: "Martin K. Petersen" <martin.petersen@oracle.com>
Date: Thu, 15 Aug 2019 02:12:50 +0000
Subject: Re: [PATCH] scsi: fnic: remove redundant assignment of variable rc
Message-Id: <yq14l2j2n31.fsf@oracle.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190813132349.8720-1-colin.king@canonical.com>
In-Reply-To: <20190813132349.8720-1-colin.king@canonical.com> (Colin King's
        message of "Tue, 13 Aug 2019 14:23:49 +0100")
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Satish Kharat <satishkh@cisco.com>, Sesidhar Baddela <sebaddel@cisco.com>, Karan Tilak Kumar <kartilak@cisco.com>, "James E . J . Bottomley" <jejb@linux.ibm.com>, "Martin K . Petersen" <martin.petersen@oracle.com>, linux-scsi@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org


Colin,

> Variable ret is initialized to a value that is never read and it is
> re-assigned later and immediatetly returns. Clean up the code by
> removing rc and just returning 0.

Applied to 5.4/scsi-queue. Thanks!

-- 
Martin K. Petersen	Oracle Linux Engineering
