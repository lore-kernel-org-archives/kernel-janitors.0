From: "Martin K. Petersen" <martin.petersen@oracle.com>
Date: Wed, 17 Jul 2019 02:32:57 +0000
Subject: Re: [PATCH] scsi: libfc: fix null pointer dereference on a null lport
Message-Id: <yq1o91tz8yu.fsf@oracle.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190702091835.13629-1-colin.king@canonical.com>
In-Reply-To: <20190702091835.13629-1-colin.king@canonical.com> (Colin King's
        message of "Tue, 2 Jul 2019 10:18:35 +0100")
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Hannes Reinecke <hare@suse.de>, "James E . J . Bottomley" <jejb@linux.ibm.com>, "Martin K . Petersen" <martin.petersen@oracle.com>, linux-scsi@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org


Colin,

> Currently if lport is null then the null lport pointer is dereference
> when printing out debug via the FC_LPORT_DB macro. Fix this by using
> the more generic FC_LIBFC_DBG debug macro instead that does not use
> lport.

Applied to 5.3/scsi-fixes, thanks!

-- 
Martin K. Petersen	Oracle Linux Engineering
