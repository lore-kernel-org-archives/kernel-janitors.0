From: "Martin K. Petersen" <martin.petersen@oracle.com>
Date: Tue, 13 Jun 2017 01:05:29 +0000
Subject: Re: [PATCH] scsi: lpfc: make a couple of functions static
Message-Id: <yq1poe8zoh2.fsf@oracle.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170518093524.13549-1-colin.king@canonical.com>
In-Reply-To: <20170518093524.13549-1-colin.king@canonical.com> (Colin King's
        message of "Thu, 18 May 2017 10:35:24 +0100")
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: James Smart <james.smart@broadcom.com>, Dick Kennedy <dick.kennedy@broadcom.com>, "James E . J . Bottomley" <jejb@linux.vnet.ibm.com>, "Martin K . Petersen" <martin.petersen@oracle.com>, linux-scsi@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org


Colin,

> functions lpfc_nvmet_cleanup_io_context and
> lpfc_nvmet_setup_io_context can be made static as they do not need to
> be in global scope.
>
> Cleans up sparse warnings:
>   "warning: symbol 'lpfc_nvmet_cleanup_io_context' was not declared.
>    Should it be static?"
>   "warning: symbol 'lpfc_nvmet_setup_io_context' was not declared.
>    Should it be static?"

Applied to 4.13/scsi-queue, thanks!

-- 
Martin K. Petersen	Oracle Linux Engineering
