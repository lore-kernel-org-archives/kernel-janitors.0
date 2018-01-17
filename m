From: "Martin K. Petersen" <martin.petersen@oracle.com>
Date: Wed, 17 Jan 2018 06:20:08 +0000
Subject: Re: [PATCH] scsi: mptsas: remove duplicated assignment to pointer head
Message-Id: <yq16081t3af.fsf@oracle.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180116190815.20930-1-colin.king@canonical.com>
In-Reply-To: <20180116190815.20930-1-colin.king@canonical.com> (Colin King's
        message of "Tue, 16 Jan 2018 19:08:15 +0000")
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Sathya Prakash <sathya.prakash@broadcom.com>, Chaitra P B <chaitra.basappa@broadcom.com>, Suganath Prabu Subramani <suganath-prabu.subramani@broadcom.com>, MPT-FusionLinux.pdl@broadcom.com, linux-scsi@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org


Colin,

> The pointer head is re-assigned the same value twice, so remove the
> second redundant assignment.

Applied to 4.16/scsi-queue.

-- 
Martin K. Petersen	Oracle Linux Engineering
