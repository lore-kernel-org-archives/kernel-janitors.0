From: "Martin K. Petersen" <martin.petersen@oracle.com>
Date: Wed, 12 Jul 2017 21:23:43 +0000
Subject: Re: [PATCH] scsi: hisi_sas: make several const arrays static
Message-Id: <yq11spll57k.fsf@oracle.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170711121144.15840-1-colin.king@canonical.com>
In-Reply-To: <20170711121144.15840-1-colin.king@canonical.com> (Colin King's
        message of "Tue, 11 Jul 2017 13:11:44 +0100")
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: John Garry <john.garry@huawei.com>, "James E . J . Bottomley" <jejb@linux.vnet.ibm.com>, "Martin K . Petersen" <martin.petersen@oracle.com>, linux-scsi@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org


Colin,

> Don't populate various tables on the stack but make them static const.
> Makes the object code smaller by over 280 bytes:

Applied to 4.13/scsi-fixes.

-- 
Martin K. Petersen	Oracle Linux Engineering
