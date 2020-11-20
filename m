From: "Martin K. Petersen" <martin.petersen@oracle.com>
Date: Fri, 20 Nov 2020 03:14:01 +0000
Subject: Re: [PATCH][next] scsi: lpfc: fix pointer defereference before it is null checked issue
Message-Id: <yq1zh3cwwi5.fsf@ca-mkp.ca.oracle.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201118131345.460631-1-colin.king@canonical.com>
In-Reply-To: <20201118131345.460631-1-colin.king@canonical.com> (Colin King's
        message of "Wed, 18 Nov 2020 13:13:45 +0000")
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: James Smart <james.smart@broadcom.com>, Dick Kennedy <dick.kennedy@broadcom.com>, "James E . J . Bottomley" <jejb@linux.ibm.com>, "Martin K . Petersen" <martin.petersen@oracle.com>, linux-scsi@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org


Colin,

> There is a null check on pointer lpfc_cmd after the pointer has been
> dereferenced when pointers rdata and ndlp are initialized at the start
> of the function. Fix this by only assigning rdata and ndlp after the
> pointer lpfc_cmd has been null checked.

Applied to 5.11/scsi-staging, thanks!

-- 
Martin K. Petersen	Oracle Linux Engineering
