From: "Martin K. Petersen" <martin.petersen@oracle.com>
Date: Wed, 17 Jan 2018 06:18:25 +0000
Subject: Re: [PATCH] scsi: storvsc: missing error code in storvsc_probe()
Message-Id: <yq1a7xdt3da.fsf@oracle.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180116104022.GA3517@mwanda>
In-Reply-To: <20180116104022.GA3517@mwanda> (Dan Carpenter's message of "Tue,
        16 Jan 2018 13:40:22 +0300")
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: "K. Y. Srinivasan" <kys@microsoft.com>, Cathy Avery <cavery@redhat.com>, Haiyang Zhang <haiyangz@microsoft.com>, Stephen Hemminger <sthemmin@microsoft.com>, "James E.J. Bottomley" <jejb@linux.vnet.ibm.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, devel@linuxdriverproject.org, linux-scsi@vger.kernel.org, kernel-janitors@vger.kernel.org


Dan,

> We should set the error code if fc_remote_port_add() fails.

Applied to 4.16/scsi-queue, thanks!

-- 
Martin K. Petersen	Oracle Linux Engineering
