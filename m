From: James Smart <james.smart@broadcom.com>
Date: Wed, 18 Dec 2019 20:15:09 +0000
Subject: Re: [PATCH] scsi: lpfc: fix spelling mistakes of asynchronous
Message-Id: <79579d2d-ea32-e529-6cf4-7a02ff955cfb@broadcom.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191218084301.627555-1-colin.king@canonical.com>
In-Reply-To: <20191218084301.627555-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, Dick Kennedy <dick.kennedy@broadcom.com>, "James E . J . Bottomley" <jejb@linux.ibm.com>, "Martin K . Petersen" <martin.petersen@oracle.com>, linux-scsi@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org



On 12/18/2019 12:43 AM, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
>
> There are spelling mistakes of asynchronous in a lpfc_printf_log
> message and comments. Fix these.
>
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>   drivers/scsi/lpfc/lpfc_init.c |  2 +-
>   drivers/scsi/lpfc/lpfc_sli.c  | 10 +++++-----
>   2 files changed, 6 insertions(+), 6 deletions(-)
>

Looks good. Thanks Colin.

Reviewed-by: James Smart <james.smart@broadcom.com>

-- james
