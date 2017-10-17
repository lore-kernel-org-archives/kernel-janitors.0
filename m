From: "Martin K. Petersen" <martin.petersen@oracle.com>
Date: Tue, 17 Oct 2017 02:41:20 +0000
Subject: Re: [PATCH] scsi: aic7xxx: make a couple of functions static
Message-Id: <yq1shei1oof.fsf@oracle.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20171005120153.32383-1-colin.king@canonical.com>
In-Reply-To: <20171005120153.32383-1-colin.king@canonical.com> (Colin King's
        message of "Thu, 5 Oct 2017 13:01:53 +0100")
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Hannes Reinecke <hare@suse.com>, "James E . J . Bottomley" <jejb@linux.vnet.ibm.com>, "Martin K . Petersen" <martin.petersen@oracle.com>, linux-scsi@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org


Colin,

> Functions ahc_devlimited_syncrate and ahc_linux_initialize_scsi_bus
> are declared static in their prototypes but are missing in their
> definitions, so add the missing static.

Applied to 4.15/scsi-queue. Thanks!

-- 
Martin K. Petersen	Oracle Linux Engineering
