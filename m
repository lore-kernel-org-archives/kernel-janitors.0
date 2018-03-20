From: "Martin K. Petersen" <martin.petersen@oracle.com>
Date: Tue, 20 Mar 2018 03:09:11 +0000
Subject: Re: [PATCH 2/2] scsi: dpt_i2o: use after free in __adpt_reset()
Message-Id: <yq1r2of1m08.fsf@oracle.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180319103401.GB8543@mwanda>
In-Reply-To: <20180319103401.GB8543@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


Dan,

> In __adpt_reset() the problem is that adpt_hba_reset() frees "pHba" on
> error but we dereference it to print the name in the error message.

Applied to 4.17/scsi-queue.

-- 
Martin K. Petersen	Oracle Linux Engineering
