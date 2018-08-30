From: "Martin K. Petersen" <martin.petersen@oracle.com>
Date: Thu, 30 Aug 2018 11:34:18 +0000
Subject: Re: [PATCH] scsi: lpfc: remove an unnecessary NULL check
Message-Id: <yq1mut43x6t.fsf@oracle.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180823135633.5qcevijtcalx76u6@kili.mountain>
In-Reply-To: <20180823135633.5qcevijtcalx76u6@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


Dan,

> Smatch complains about this code:
>
>     drivers/scsi/lpfc/lpfc_scsi.c:1053 lpfc_get_scsi_buf_s4()
>     warn: variable dereferenced before check 'lpfc_cmd' (see line 1039)
>
> Fortunately the NULL check isn't required so I have removed it.

Applied to 4.20/scsi-queue, thank you!

-- 
Martin K. Petersen	Oracle Linux Engineering
