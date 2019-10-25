From: "Martin K. Petersen" <martin.petersen@oracle.com>
Date: Fri, 25 Oct 2019 01:17:40 +0000
Subject: Re: [PATCH] [SCSI] esas2r: unlock on error in esas2r_nvram_read_direct()
Message-Id: <yq1h83xbp3f.fsf@oracle.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191022102324.GA27540@mwanda>
In-Reply-To: <20191022102324.GA27540@mwanda> (Dan Carpenter's message of "Tue,
        22 Oct 2019 13:23:24 +0300")
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Bradley Grove <linuxdrivers@attotech.com>, "James E.J. Bottomley" <jejb@linux.ibm.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, linux-scsi@vger.kernel.org, kernel-janitors@vger.kernel.org


Dan,

> This error path is missing an unlock.

Applied to 5.5/scsi-queue, thanks!

-- 
Martin K. Petersen	Oracle Linux Engineering
