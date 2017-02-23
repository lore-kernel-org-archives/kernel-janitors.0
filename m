From: "Martin K. Petersen" <martin.petersen@oracle.com>
Date: Thu, 23 Feb 2017 00:28:51 +0000
Subject: Re: [patch] scsi_dh_emc: return success in clariion_std_inquiry()
Message-Id: <yq1wpch7nss.fsf@oracle.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170221183050.GB28595@mwanda>
In-Reply-To: <20170221183050.GB28595@mwanda> (Dan Carpenter's message of "Tue,
        21 Feb 2017 21:46:37 +0300")
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: "James E.J. Bottomley" <jejb@linux.vnet.ibm.com>, Hannes Reinecke <hare@suse.de>, "Martin K. Petersen" <martin.petersen@oracle.com>, Jens Axboe <axboe@fb.com>, Johannes Thumshirn <jthumshirn@suse.de>, Shaun Tancheff <shaun.tancheff@seagate.com>, linux-scsi@vger.kernel.org, kernel-janitors@vger.kernel.org

>>>>> "Dan" = Dan Carpenter <dan.carpenter@oracle.com> writes:

Dan,

Dan> We accidentally return an uninitialized variable on success.

Applied to 4.11/scsi-fixes.

Thanks!

-- 
Martin K. Petersen	Oracle Linux Engineering
