From: "Martin K. Petersen" <martin.petersen@oracle.com>
Date: Wed, 12 Jul 2017 21:07:28 +0000
Subject: Re: [PATCH] cxlflash: return -EFAULT if copy_from_user() fails
Message-Id: <yq1vamxl5yn.fsf@oracle.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170630080106.yxyckztimezvpzrt@mwanda>
In-Reply-To: <20170630080106.yxyckztimezvpzrt@mwanda> (Dan Carpenter's message
        of "Fri, 30 Jun 2017 11:01:06 +0300")
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: "Manoj N. Kumar" <manoj@linux.vnet.ibm.com>, "Matthew R. Ochs" <mrochs@linux.vnet.ibm.com>, Uma Krishnan <ukrishn@linux.vnet.ibm.com>, "James E.J. Bottomley" <jejb@linux.vnet.ibm.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, linux-scsi@vger.kernel.org, kernel-janitors@vger.kernel.org


Dan,

> The copy_from/to_user() functions return the number of bytes remaining
> to be copied but we had intended to return -EFAULT here.
>
> Fixes: bc88ac47d5cb ("scsi: cxlflash: Support AFU debug")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied to 4.13/scsi-fixes, thanks!

-- 
Martin K. Petersen	Oracle Linux Engineering
