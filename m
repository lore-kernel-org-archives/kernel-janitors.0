From: "Martin K. Petersen" <martin.petersen@oracle.com>
Date: Thu, 17 Aug 2017 16:51:24 +0000
Subject: Re: [PATCH] scsi: hpsa: fix the device_id in hpsa_update_device_info()
Message-Id: <yq1wp62kuib.fsf@oracle.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170817144444.tocisnlw6grmaf75@mwanda>
In-Reply-To: <20170817144444.tocisnlw6grmaf75@mwanda> (Dan Carpenter's message
        of "Thu, 17 Aug 2017 17:44:44 +0300")
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Don Brace <don.brace@microsemi.com>, ". Hannes Reinecke" <hare@suse.de>, "James E.J. Bottomley" <jejb@linux.vnet.ibm.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, esc.storagedev@microsemi.com, linux-scsi@vger.kernel.org, kernel-janitors@vger.kernel.org


Dan,

> The parentheses are in the wrong place so we specify the length as
> "sizeof(this_device->device_id) < 0" which is zero.

Applied to 4.14/scsi-queue. Thank you!

-- 
Martin K. Petersen	Oracle Linux Engineering
