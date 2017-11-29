From: "Martin K. Petersen" <martin.petersen@oracle.com>
Date: Wed, 29 Nov 2017 04:47:29 +0000
Subject: Re: [PATCH] scsi: lpfc: Use after free in lpfc_rq_buf_free()
Message-Id: <yq1shcxhese.fsf@oracle.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20171122085803.lwajodogeyovzjoa@mwanda>
In-Reply-To: <20171122085803.lwajodogeyovzjoa@mwanda> (Dan Carpenter's message
        of "Wed, 22 Nov 2017 11:58:03 +0300")
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: James Smart <james.smart@broadcom.com>, Dick Kennedy <dick.kennedy@broadcom.com>, "James E.J. Bottomley" <jejb@linux.vnet.ibm.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, linux-scsi@vger.kernel.org, kernel-janitors@vger.kernel.org


Dan,

> The error message dereferences "rqb_entry" so we need to print it first
> and then free the buffer.

Applied to 4.15/scsi-fixes. Thanks!

-- 
Martin K. Petersen	Oracle Linux Engineering
