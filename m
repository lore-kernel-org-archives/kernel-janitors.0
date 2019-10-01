From: "Martin K. Petersen" <martin.petersen@oracle.com>
Date: Tue, 01 Oct 2019 02:46:07 +0000
Subject: Re: [PATCH] scsi: fnic: make array dev_cmd_err static const, makes object smaller
Message-Id: <yq1a7alyyhc.fsf@oracle.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190906163945.3889-1-colin.king@canonical.com>
In-Reply-To: <20190906163945.3889-1-colin.king@canonical.com> (Colin King's
        message of "Fri, 6 Sep 2019 17:39:45 +0100")
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Satish Kharat <satishkh@cisco.com>, Sesidhar Baddela <sebaddel@cisco.com>, Karan Tilak Kumar <kartilak@cisco.com>, "James E . J . Bottomley" <jejb@linux.ibm.com>, "Martin K . Petersen" <martin.petersen@oracle.com>, linux-scsi@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org


Colin,

> Don't populate the array dev_cmd_err on the stack but instead make it
> static const. Makes the object code smaller by 80 bytes.

Applied to 5.5/scsi-queue, thanks!

-- 
Martin K. Petersen	Oracle Linux Engineering
