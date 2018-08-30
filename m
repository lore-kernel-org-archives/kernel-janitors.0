From: "Martin K. Petersen" <martin.petersen@oracle.com>
Date: Thu, 30 Aug 2018 11:26:21 +0000
Subject: Re: [PATCH] scsi: be2iscsi: remove unused variable dmsg
Message-Id: <yq1va7s3xk2.fsf@oracle.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180816140254.20955-1-colin.king@canonical.com>
In-Reply-To: <20180816140254.20955-1-colin.king@canonical.com> (Colin King's
        message of "Thu, 16 Aug 2018 15:02:54 +0100")
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Subbu Seetharaman <subbu.seetharaman@broadcom.com>, Ketan Mukadam <ketan.mukadam@broadcom.com>, Jitendra Bhivare <jitendra.bhivare@broadcom.com>, "James E . J . Bottomley" <jejb@linux.vnet.ibm.com>, "Martin K . Petersen" <martin.petersen@oracle.com>, linux-scsi@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org


Colin,

> Variable dmsg is not being used and is redundant and hence can
> be removed.
>
> Cleans up clang warning:
> warning: variable 'dmsg' set but not used [-Wunused-but-set-variable]

Applied to 4.20/scsi-queue. Thanks!

-- 
Martin K. Petersen	Oracle Linux Engineering
