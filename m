From: "Martin K. Petersen" <martin.petersen@oracle.com>
Date: Fri, 25 Oct 2019 01:14:11 +0000
Subject: Re: [PATCH] scsi: csiostor: Don't enable IRQs too early
Message-Id: <yq1pnilbp98.fsf@oracle.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191019085913.GA14245@mwanda>
In-Reply-To: <20191019085913.GA14245@mwanda> (Dan Carpenter's message of "Sat,
        19 Oct 2019 11:59:13 +0300")
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: "James E.J. Bottomley" <jejb@linux.ibm.com>, Naresh Kumar Inna <naresh@chelsio.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, linux-scsi@vger.kernel.org, kernel-janitors@vger.kernel.org


Dan,

> These are called with IRQs disabled from csio_mgmt_tmo_handler() so we
> can't call spin_unlock_irq() or it will enable IRQs prematurely.

Applied to 5.5/scsi-queue, thanks!

-- 
Martin K. Petersen	Oracle Linux Engineering
