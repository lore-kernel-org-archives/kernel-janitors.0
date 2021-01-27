From: "Martin K. Petersen" <martin.petersen@oracle.com>
Date: Wed, 27 Jan 2021 03:09:10 +0000
Subject: Re: [PATCH] scsi: lpfc: Fix ancient double free
Message-Id: <yq1bldbxei9.fsf@ca-mkp.ca.oracle.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <YA6E8rO51hE56SVw@mwanda>
In-Reply-To: <YA6E8rO51hE56SVw@mwanda> (Dan Carpenter's message of "Mon, 25
        Jan 2021 11:44:34 +0300")
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: James Smart <james.smart@broadcom.com>, Dick Kennedy <dick.kennedy@broadcom.com>, "James E.J. Bottomley" <jejb@linux.ibm.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, James Bottomley <James.Bottomley@steeleye.com>, linux-scsi@vger.kernel.org, kernel-janitors@vger.kernel.org


Dan,

> The "pmb" pointer is freed at the start of the function and then freed
> again in the error handling code.

Applied to 5.12/scsi-staging, thanks!

-- 
Martin K. Petersen	Oracle Linux Engineering
