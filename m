From: "Martin K. Petersen" <martin.petersen@oracle.com>
Date: Tue, 01 Oct 2019 02:46:59 +0000
Subject: Re: [PATCH] scsi: ips: make array 'options' static const, makes object smaller
Message-Id: <yq15zl9yyfw.fsf@oracle.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190906164522.5644-1-colin.king@canonical.com>
In-Reply-To: <20190906164522.5644-1-colin.king@canonical.com> (Colin King's
        message of "Fri, 6 Sep 2019 17:45:22 +0100")
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Adaptec OEM Raid Solutions <aacraid@microsemi.com>, "James E . J . Bottomley" <jejb@linux.ibm.com>, "Martin K . Petersen" <martin.petersen@oracle.com>, linux-scsi@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org


Colin,

> Don't populate the array 'options' on the stack but instead make it
> static const. Makes the object code smaller by 143 bytes.

Applied to 5.5/scsi-queue, thanks!

-- 
Martin K. Petersen	Oracle Linux Engineering
