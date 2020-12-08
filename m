From: "Martin K. Petersen" <martin.petersen@oracle.com>
Date: Tue, 08 Dec 2020 01:58:39 +0000
Subject: Re: [PATCH] scsi: qla4xxx: remove redundant assignment to variable rval
Message-Id: <yq1im9dys6v.fsf@ca-mkp.ca.oracle.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201204191810.1150995-1-colin.king@canonical.com>
In-Reply-To: <20201204191810.1150995-1-colin.king@canonical.com> (Colin King's
        message of "Fri, 4 Dec 2020 19:18:10 +0000")
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Nilesh Javali <njavali@marvell.com>, Manish Rangankar <mrangankar@marvell.com>, GR-QLogic-Storage-Upstream@marvell.com, "James E . J . Bottomley" <jejb@linux.ibm.com>, "Martin K . Petersen" <martin.petersen@oracle.com>, linux-scsi@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org


Colin,

> The variable rval is being initialized with a value that is never read
> and it is being updated later with a new value.  The initialization is
> redundant and can be removed.

Applied to 5.11/scsi-staging, thanks!

-- 
Martin K. Petersen	Oracle Linux Engineering
