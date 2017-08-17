From: "Martin K. Petersen" <martin.petersen@oracle.com>
Date: Thu, 17 Aug 2017 00:30:04 +0000
Subject: Re: [PATCH] scsi: mpt3sas: fix pr_info message continuation
Message-Id: <yq1tw17ox2r.fsf@oracle.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170815135145.25792-1-colin.king@canonical.com>
In-Reply-To: <20170815135145.25792-1-colin.king@canonical.com> (Colin King's
        message of "Tue, 15 Aug 2017 14:51:45 +0100")
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Sathya Prakash <sathya.prakash@broadcom.com>, Chaitra P B <chaitra.basappa@broadcom.com>, Suganath Prabu Subramani <suganath-prabu.subramani@broadcom.com>, "James E . J . Bottomley" <jejb@linux.vnet.ibm.com>, "Martin K . Petersen" <martin.petersen@oracle.com>, MPT-FusionLinux.pdl@broadcom.com, linux-scsi@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org


Colin,

> An optional discovery status should be printed with a pr_cont and
> needs a leading space to make it more readable. The final new line
> should also be a pr_cont and the indentation is out by one, so fix
> that too.

Applied to 4.14/scsi-queue.

-- 
Martin K. Petersen	Oracle Linux Engineering
