From: "Martin K. Petersen" <martin.petersen@oracle.com>
Date: Thu, 08 Aug 2019 02:16:41 +0000
Subject: Re: [PATCH] scsi: pm80xx: remove redundant assignments to variable rc
Message-Id: <yq17e7ocsfq.fsf@oracle.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190731222214.15720-1-colin.king@canonical.com>
In-Reply-To: <20190731222214.15720-1-colin.king@canonical.com> (Colin King's
        message of "Wed, 31 Jul 2019 23:22:14 +0100")
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Jack Wang <jinpu.wang@cloud.ionos.com>, "James E . J . Bottomley" <jejb@linux.ibm.com>, "Martin K . Petersen" <martin.petersen@oracle.com>, linux-scsi@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org


Colin,

> There are several occasions where variable rc is being initialized
> with a value that is never read and error is being re-assigned a
> little later on.  Clean up the code by removing rc entirely and
> just returning the return value from the call to pm8001_issue_ssp_tmf

Applied to 5.4/scsi-queue. Thanks!

-- 
Martin K. Petersen	Oracle Linux Engineering
