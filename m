From: "Martin K. Petersen" <martin.petersen@oracle.com>
Date: Tue, 21 Nov 2017 03:22:16 +0000
Subject: Re: [PATCH] scsi: aacraid: remove unused variable managed_request_id
Message-Id: <yq14lpomi3b.fsf@oracle.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20171115165341.20042-1-colin.king@canonical.com>
In-Reply-To: <20171115165341.20042-1-colin.king@canonical.com> (Colin King's
        message of "Wed, 15 Nov 2017 16:53:41 +0000")
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Adaptec OEM Raid Solutions <aacraid@microsemi.com>, "James E . J . Bottomley" <jejb@linux.vnet.ibm.com>, "Martin K . Petersen" <martin.petersen@oracle.com>, linux-scsi@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org


Colin,

> Variable managed_request_id is being assigned but it is never read,
> hence it is redundant and can be removed. Cleans up clang warning:

Applied to 4.16/scsi-queue.

-- 
Martin K. Petersen	Oracle Linux Engineering
