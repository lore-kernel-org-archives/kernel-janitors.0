From: "Martin K. Petersen" <martin.petersen@oracle.com>
Date: Fri, 15 Sep 2017 19:39:48 +0000
Subject: Re: [PATCH] scsi: lpfc: remove redundant null check on eqe
Message-Id: <yq18thfpx8b.fsf@oracle.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170908080201.9592-1-colin.king@canonical.com>
In-Reply-To: <20170908080201.9592-1-colin.king@canonical.com> (Colin King's
        message of "Fri, 8 Sep 2017 09:02:01 +0100")
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: James Smart <james.smart@broadcom.com>, Dick Kennedy <dick.kennedy@broadcom.com>, "James E . J . Bottomley" <jejb@linux.vnet.ibm.com>, "Martin K . Petersen" <martin.petersen@oracle.com>, linux-scsi@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org


Colin,

> The pointer eqe is always non-null inside the while loop, so the check
> to see if eqe is NULL is redudant and hence can be removed.

Applied to 4.15/scsi-queue. Thanks!

-- 
Martin K. Petersen	Oracle Linux Engineering
