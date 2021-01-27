From: "Martin K. Petersen" <martin.petersen@oracle.com>
Date: Wed, 27 Jan 2021 03:06:45 +0000
Subject: Re: [PATCH] scsi: qla2xxx: fix some memory corruption
Message-Id: <yq1h7n3xem8.fsf@ca-mkp.ca.oracle.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <YA6E0geUlL9Hs04A@mwanda>
In-Reply-To: <YA6E0geUlL9Hs04A@mwanda> (Dan Carpenter's message of "Mon, 25
        Jan 2021 11:44:02 +0300")
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Nilesh Javali <njavali@marvell.com>, GR-QLogic-Storage-Upstream@marvell.com, "James E.J. Bottomley" <jejb@linux.ibm.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, Himanshu Madhani <himanshu.madhani@oracle.com>, Saurav Kashyap <skashyap@marvell.com>, linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org


Dan,

> This was supposed to be "data" instead of "&data".  The current code
> will corrupt the stack.

Applied to 5.12/scsi-staging, thanks!

-- 
Martin K. Petersen	Oracle Linux Engineering
