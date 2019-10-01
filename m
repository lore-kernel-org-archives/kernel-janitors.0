From: "Martin K. Petersen" <martin.petersen@oracle.com>
Date: Tue, 01 Oct 2019 02:47:38 +0000
Subject: Re: [PATCH] scsi: ufs: make array setup_attrs static const, makes object smaller
Message-Id: <yq11rvxyyet.fsf@oracle.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190906170104.10450-1-colin.king@canonical.com>
In-Reply-To: <20190906170104.10450-1-colin.king@canonical.com> (Colin King's
        message of "Fri, 6 Sep 2019 18:01:04 +0100")
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Pedro Sousa <pedrom.sousa@synopsys.com>, Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman <avri.altman@wdc.com>, "James E . J . Bottomley" <jejb@linux.ibm.com>, "Martin K . Petersen" <martin.petersen@oracle.com>, linux-scsi@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org


Colin,

> Don't populate the array setup_attrs on the stack but instead make it
> static const. Makes the object code smaller by 180 bytes.

Applied to 5.5/scsi-queue. Thanks!

-- 
Martin K. Petersen	Oracle Linux Engineering
