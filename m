From: "Martin K. Petersen" <martin.petersen@oracle.com>
Date: Thu, 04 Apr 2019 03:16:32 +0000
Subject: Re: [PATCH -next] scsi: qedf: Remove set but not used variable 'fr_len'
Message-Id: <yq1v9zutq7j.fsf@oracle.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1539951177-184754-1-git-send-email-yuehaibing@huawei.com>
In-Reply-To: <1539951177-184754-1-git-send-email-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


YueHaibing,

> drivers/scsi/qedf/qedf_fip.c: In function 'qedf_fcoe_send_vlan_req':
> drivers/scsi/qedf/qedf_fip.c:22:6: warning:
>  variable 'fr_len' set but not used [-Wunused-but-set-variable]

Applied to 5.2/scsi-queue, thanks.

-- 
Martin K. Petersen	Oracle Linux Engineering
