From: "Martin K. Petersen" <martin.petersen@oracle.com>
Date: Tue, 21 Nov 2017 02:31:32 +0000
Subject: Re: [PATCH] scsi: hpsa: remove an unecessary NULL check
Message-Id: <yq1ine4nz0b.fsf@oracle.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20171107130131.3zohbeoobjxbqmdz@mwanda>
In-Reply-To: <20171107130131.3zohbeoobjxbqmdz@mwanda> (Dan Carpenter's message
        of "Tue, 7 Nov 2017 16:01:32 +0300")
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Don Brace <don.brace@microsemi.com>
Cc: Dan Carpenter <dan.carpenter@oracle.com>, "James E.J. Bottomley" <jejb@linux.vnet.ibm.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, esc.storagedev@microsemi.com, linux-scsi@vger.kernel.org, kernel-janitors@vger.kernel.org


> device->scsi3addr[] is an array, not a pointer, so it can't be NULL.
> I've removed the check.

Microsemi folks, please review. Thanks!

-- 
Martin K. Petersen	Oracle Linux Engineering
