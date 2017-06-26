From: "Martin K. Petersen" <martin.petersen@oracle.com>
Date: Mon, 26 Jun 2017 17:32:27 +0000
Subject: Re: [PATCH] scsi: hptiop: make function hptiop_iop_request_callback_itl static
Message-Id: <yq1efu664es.fsf@oracle.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170622155219.22871-1-colin.king@canonical.com>
In-Reply-To: <20170622155219.22871-1-colin.king@canonical.com> (Colin King's
        message of "Thu, 22 Jun 2017 16:52:19 +0100")
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: HighPoint Linux Team <linux@highpoint-tech.com>, "James E . J . Bottomley" <jejb@linux.vnet.ibm.com>, "Martin K . Petersen" <martin.petersen@oracle.com>, linux-scsi@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org


Colin,

> The function hptiop_iop_request_callback_itl does not need to be in
> global scope, so make it static.
>
> Cleans up sparse warning:
> "symbol 'hptiop_iop_request_callback_itl' was not declared. Should it
>  be static?"

Applied to 4.13/scsi-queue.

-- 
Martin K. Petersen	Oracle Linux Engineering
