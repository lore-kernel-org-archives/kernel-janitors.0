From: "Martin K. Petersen" <martin.petersen@oracle.com>
Date: Thu, 09 Aug 2018 01:18:32 +0000
Subject: Re: [PATCH v2] scsi: aic94xx: fix an error code in aic94xx_init()
Message-Id: <yq1y3dgqqvr.fsf@oracle.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180808142909.lzdbwxxqt5gwzrzl@kili.mountain>
In-Reply-To: <20180808142909.lzdbwxxqt5gwzrzl@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


Dan,

> We accidentally return success instead of -ENOMEM on this error path.

Applied to 4.19/scsi-queue, thanks!

-- 
Martin K. Petersen	Oracle Linux Engineering
