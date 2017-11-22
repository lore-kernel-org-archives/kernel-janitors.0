From: "Martin K. Petersen" <martin.petersen@oracle.com>
Date: Wed, 22 Nov 2017 03:59:15 +0000
Subject: Re: [PATCH] scsi: hpsa: remove an unecessary NULL check
Message-Id: <yq1k1yjklpo.fsf@oracle.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20171107130131.3zohbeoobjxbqmdz@mwanda>
In-Reply-To: <20171107130131.3zohbeoobjxbqmdz@mwanda> (Dan Carpenter's message
        of "Tue, 7 Nov 2017 16:01:32 +0300")
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Don Brace <don.brace@microsemi.com>, "James E.J. Bottomley" <jejb@linux.vnet.ibm.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, esc.storagedev@microsemi.com, linux-scsi@vger.kernel.org, kernel-janitors@vger.kernel.org


Dan,

> device->scsi3addr[] is an array, not a pointer, so it can't be NULL.
> I've removed the check.

Applied to 4.16/scsi-queue. Thanks!

-- 
Martin K. Petersen	Oracle Linux Engineering
