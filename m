From: "Martin K. Petersen" <martin.petersen@oracle.com>
Date: Fri, 29 Jan 2021 19:01:48 +0000
Subject: Re: [PATCH] scsi: lpfc: Fix ancient double free
Message-Id: <161194526371.12948.12096807116592012381.b4-ty@oracle.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <YA6E8rO51hE56SVw@mwanda>
In-Reply-To: <YA6E8rO51hE56SVw@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, James Smart <james.smart@broadcom.com>
Cc: "Martin K . Petersen" <martin.petersen@oracle.com>, Dick Kennedy <dick.kennedy@broadcom.com>, linux-scsi@vger.kernel.org, kernel-janitors@vger.kernel.org, James Bottomley <James.Bottomley@steeleye.com>, "James E.J. Bottomley" <jejb@linux.ibm.com>

On Mon, 25 Jan 2021 11:44:34 +0300, Dan Carpenter wrote:

> The "pmb" pointer is freed at the start of the function and then freed
> again in the error handling code.

Applied to 5.12/scsi-queue, thanks!

[1/1] scsi: lpfc: Fix ancient double free
      https://git.kernel.org/mkp/scsi/c/0be310979e5e

-- 
Martin K. Petersen	Oracle Linux Engineering
