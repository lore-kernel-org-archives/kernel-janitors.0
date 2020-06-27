From: "Martin K. Petersen" <martin.petersen@oracle.com>
Date: Sat, 27 Jun 2020 03:09:09 +0000
Subject: Re: [PATCH] scsi: qla2xxx: Fix a condition in qla2x00_find_all_fabric_devs()
Message-Id: <159322725421.11274.1151779103436589073.b4-ty@oracle.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200619143041.GD267142@mwanda>
In-Reply-To: <20200619143041.GD267142@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Nilesh Javali <njavali@marvell.com>, Darren Trapp <darren.trapp@cavium.com>
Cc: "Martin K . Petersen" <martin.petersen@oracle.com>, linux-scsi@vger.kernel.org, kernel-janitors@vger.kernel.org, Hannes Reinecke <hare@suse.com>, Johannes Thumshirn <jthumshirn@suse.de>, "James E.J. Bottomley" <jejb@linux.ibm.com>, Himanshu Madhani <himanshu.madhani@cavium.com>, GR-QLogic-Storage-Upstream@marvell.com

On Fri, 19 Jun 2020 17:30:41 +0300, Dan Carpenter wrote:

> This code doesn't make sense unless the correct "fcport" was found.

Applied to 5.8/scsi-fixes, thanks!

[1/1] scsi: qla2xxx: Fix a condition in qla2x00_find_all_fabric_devs()
      https://git.kernel.org/mkp/scsi/c/1fc98aaf7f85

-- 
Martin K. Petersen	Oracle Linux Engineering
