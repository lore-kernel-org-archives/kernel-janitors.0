From: "Martin K. Petersen" <martin.petersen@oracle.com>
Date: Tue, 17 Oct 2017 02:44:15 +0000
Subject: Re: [PATCH] scsi: lpfc: Fix a precedence bug in lpfc_nvme_io_cmd_wqe_cmpl()
Message-Id: <yq1o9p61ojk.fsf@oracle.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20171012203057.ixo2ds5i5ecbyv4y@mwanda>
In-Reply-To: <20171012203057.ixo2ds5i5ecbyv4y@mwanda> (Dan Carpenter's message
        of "Thu, 12 Oct 2017 23:30:57 +0300")
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: James Smart <james.smart@broadcom.com>, Dick Kennedy <dick.kennedy@broadcom.com>, "James E.J. Bottomley" <jejb@linux.vnet.ibm.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, linux-scsi@vger.kernel.org, kernel-janitors@vger.kernel.org


Dan,

> The ! has higher precedence than the & operation.  I've added
> parenthesis so this works as intended.

Applied to 4.15/scsi-queue. Thanks!

-- 
Martin K. Petersen	Oracle Linux Engineering
