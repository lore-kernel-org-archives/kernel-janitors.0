From: "Martin K. Petersen" <martin.petersen@oracle.com>
Date: Wed, 13 Feb 2019 03:16:12 +0000
Subject: Re: [PATCH] scsi: lpfc: Fix error code if kcalloc() fails
Message-Id: <yq1tvh8s7ib.fsf@oracle.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190211184300.GA22106@kadam>
In-Reply-To: <20190211184300.GA22106@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


Dan,

> This should return -ENOMEM if kcalloc() fails, but it accidentally
> returns success instead.

Applied to 5.1/scsi-queue, thanks!

-- 
Martin K. Petersen	Oracle Linux Engineering
