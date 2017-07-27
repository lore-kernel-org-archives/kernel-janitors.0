From: "Martin K. Petersen" <martin.petersen@oracle.com>
Date: Thu, 27 Jul 2017 02:10:06 +0000
Subject: Re: [PATCH 1/2] scsi: aacraid: reading out of bounds
Message-Id: <yq11sp2y6ip.fsf@oracle.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170725194955.dd4g6msevoesty4t@mwanda>
In-Reply-To: <20170725194955.dd4g6msevoesty4t@mwanda> (Dan Carpenter's message
        of "Tue, 25 Jul 2017 22:49:55 +0300")
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Adaptec OEM Raid Solutions <aacraid@microsemi.com>, "James E.J. Bottomley" <jejb@linux.vnet.ibm.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, linux-scsi@vger.kernel.org, kernel-janitors@vger.kernel.org


Dan,

> "qd.id" comes directly from the copy_from_user() on the line before so
> we should verify that it's within bounds.

Applied to 4.13/scsi-fixes. Thanks!

-- 
Martin K. Petersen	Oracle Linux Engineering
