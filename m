From: James Smart <james.smart@broadcom.com>
Date: Fri, 30 Jun 2017 14:56:29 +0000
Subject: Re: [PATCH 1/2] scsi: lpfc: spin_lock_irq() is not nestable
Message-Id: <89beb27c-0844-1bba-dcf3-4f64c167782c@broadcom.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170630080250.mjbosf64qlytrsii@mwanda>
In-Reply-To: <20170630080250.mjbosf64qlytrsii@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Dick Kennedy <dick.kennedy@broadcom.com>, "James E.J. Bottomley" <jejb@linux.vnet.ibm.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On 6/30/2017 1:02 AM, Dan Carpenter wrote:
> We're calling spin_lock_irq() multiple times, the problem is that on the
> first spin_unlock_irq() then we will re-enable IRQs and we don't want
> that.
>
> Fixes: 966bb5b71196 ("scsi: lpfc: Break up IO ctx list into a separate get and put list")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>

looks good.

Signed-off-By: James Smart <james.smart@broadcom.com>
