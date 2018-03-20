From: "Martin K. Petersen" <martin.petersen@oracle.com>
Date: Tue, 20 Mar 2018 03:08:37 +0000
Subject: Re: [PATCH 1/2] scsi: dpt_i2o: use after free in adpt_release()
Message-Id: <yq1vadr1m16.fsf@oracle.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180319103303.GA8543@mwanda>
In-Reply-To: <20180319103303.GA8543@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


Dan,

> The scsi_host_put() function frees "pHba" and then we dereference it on
> the next line when we do "scsi_host_put(pHba->host);".

Applied to 4.17/scsi-queue, thank you.

-- 
Martin K. Petersen	Oracle Linux Engineering
