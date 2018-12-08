From: "Martin K. Petersen" <martin.petersen@oracle.com>
Date: Sat, 08 Dec 2018 03:25:41 +0000
Subject: Re: [PATCH] scsi: bnx2fc: Fix NULL dereference in error handling
Message-Id: <yq1h8folmx6.fsf@oracle.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


Dan,

> If "interface" is NULL then we can't release it and trying to will
> only lead to an Oops.

Applied to 4.20/scsi-fixes, thanks!

-- 
Martin K. Petersen	Oracle Linux Engineering
