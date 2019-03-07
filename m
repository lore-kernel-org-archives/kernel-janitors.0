From: "Martin K. Petersen" <martin.petersen@oracle.com>
Date: Thu, 07 Mar 2019 00:19:30 +0000
Subject: Re: [PATCH] scsi: qla2xxx: check for kstrtol() failure
Message-Id: <yq18sxrwn71.fsf@oracle.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


Dan,

> The error handling was unintentionally left out so it introduces a
> Smatch static checker warning:
>
>     drivers/scsi/qla2xxx/qla_attr.c:1655 qla2x00_port_speed_store()
>     error: uninitialized symbol 'type'.

Applied to 5.1/scsi-queue, thanks!

-- 
Martin K. Petersen	Oracle Linux Engineering
