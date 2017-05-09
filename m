From: "Martin K. Petersen" <martin.petersen@oracle.com>
Date: Tue, 09 May 2017 01:51:01 +0000
Subject: Re: [PATCH] scsi: lpfc: double lock typo in lpfc_ns_rsp()
Message-Id: <yq1vapassqi.fsf@oracle.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170503212215.m2t2rfrkoktugkg4@mwanda>
In-Reply-To: <20170503212215.m2t2rfrkoktugkg4@mwanda> (Dan Carpenter's message
        of "Thu, 4 May 2017 00:22:16 +0300")
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: James Smart <james.smart@broadcom.com>, Dick Kennedy <dick.kennedy@broadcom.com>, "James E.J. Bottomley" <jejb@linux.vnet.ibm.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, linux-scsi@vger.kernel.org, kernel-janitors@vger.kernel.org


Dan,

> There is a double lock bug here so this will deadlock instead of
> unlocking.

Applied to 4.12/scsi-fixes.

-- 
Martin K. Petersen	Oracle Linux Engineering
