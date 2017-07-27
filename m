From: Dave Carroll <david.carroll@microsemi.com>
Date: Thu, 27 Jul 2017 16:12:36 +0000
Subject: RE: [PATCH 1/2] scsi: aacraid: reading out of bounds
Message-Id: <423FD6710FB8FB4F8728F93591889F9A5307D0A4@avsrvexchmbx2.microsemi.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170725194955.dd4g6msevoesty4t@mwanda>
 <yq11sp2y6ip.fsf@oracle.com>
In-Reply-To: <yq11sp2y6ip.fsf@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Martin K. Petersen" <martin.petersen@oracle.com>, Dan Carpenter <dan.carpenter@oracle.com>
Cc: dl-esc-Aacraid Linux Driver <aacraid@microsemi.com>, "James E.J. Bottomley" <jejb@linux.vnet.ibm.com>, "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

> 
> Dan,
> 
> > "qd.id" comes directly from the copy_from_user() on the line before so
> > we should verify that it's within bounds.
> 
> Applied to 4.13/scsi-fixes. Thanks!
> 
> --
> Martin K. Petersen      Oracle Linux Engineering

Acked-by: Dave Carroll <david.carroll@microsemi.com>
