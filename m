From: "Martin K. Petersen" <martin.petersen@oracle.com>
Date: Wed, 23 Aug 2017 02:24:14 +0000
Subject: Re: [PATCH] scsi: sg: off by one in sg_ioctl()
Message-Id: <yq18tibaunl.fsf@oracle.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170817070954.d4gg7hqgg2qjf6d3@mwanda>
In-Reply-To: <20170817070954.d4gg7hqgg2qjf6d3@mwanda> (Dan Carpenter's message
        of "Thu, 17 Aug 2017 10:09:54 +0300")
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Doug Gilbert <dgilbert@interlog.com>, Hannes Reinecke <hare@suse.de>, "James E.J. Bottomley" <jejb@linux.vnet.ibm.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, linux-scsi@vger.kernel.org, kernel-janitors@vger.kernel.org


Dan,

> If "val" is SG_MAX_QUEUE then we are one element beyond the end of the
> "rinfo" array so the > should be >=.

Applied to 4.13/scsi-fixes. Thanks!

-- 
Martin K. Petersen	Oracle Linux Engineering
