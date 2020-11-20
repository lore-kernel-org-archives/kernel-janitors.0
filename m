From: "Martin K. Petersen" <martin.petersen@oracle.com>
Date: Fri, 20 Nov 2020 03:17:27 +0000
Subject: Re: [PATCH][next] scsi: lpfc: Fix memory leak on lcb_context
Message-Id: <yq1o8jswwci.fsf@ca-mkp.ca.oracle.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201118141314.462471-1-colin.king@canonical.com>
In-Reply-To: <20201118141314.462471-1-colin.king@canonical.com> (Colin King's
        message of "Wed, 18 Nov 2020 14:13:14 +0000")
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: James Smart <james.smart@broadcom.com>, Dick Kennedy <dick.kennedy@broadcom.com>, "James E . J . Bottomley" <jejb@linux.ibm.com>, "Martin K . Petersen" <martin.petersen@oracle.com>, linux-scsi@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org


Colin,

> Currently there is an error return path that neglects to free the
> allocation for lcb_context.  Fix this by adding a new error free exit
> path that kfree's lcb_context before returning.  Use this new kfree
> exit path in another exit error path that also kfree's the same
> object, allowing a line of code to be removed.

Applied to 5.11/scsi-staging, thanks!

-- 
Martin K. Petersen	Oracle Linux Engineering
