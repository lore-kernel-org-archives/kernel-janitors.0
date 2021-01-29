From: "Martin K. Petersen" <martin.petersen@oracle.com>
Date: Fri, 29 Jan 2021 19:01:49 +0000
Subject: Re: [PATCH] scsi: qla2xxx: fix some memory corruption
Message-Id: <161194526370.12948.16367434867317799791.b4-ty@oracle.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <YA6E0geUlL9Hs04A@mwanda>
In-Reply-To: <YA6E0geUlL9Hs04A@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Nilesh Javali <njavali@marvell.com>, Dan Carpenter <dan.carpenter@oracle.com>
Cc: "Martin K . Petersen" <martin.petersen@oracle.com>, linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org, kernel-janitors@vger.kernel.org, Himanshu Madhani <himanshu.madhani@oracle.com>, Saurav Kashyap <skashyap@marvell.com>, GR-QLogic-Storage-Upstream@marvell.com, "James E.J. Bottomley" <jejb@linux.ibm.com>

On Mon, 25 Jan 2021 11:44:02 +0300, Dan Carpenter wrote:

> This was supposed to be "data" instead of "&data".  The current code
> will corrupt the stack.

Applied to 5.12/scsi-queue, thanks!

[1/1] scsi: qla2xxx: fix some memory corruption
      https://git.kernel.org/mkp/scsi/c/bc2b4e680231

-- 
Martin K. Petersen	Oracle Linux Engineering
