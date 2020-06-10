From: "Martin K. Petersen" <martin.petersen@oracle.com>
Date: Wed, 10 Jun 2020 02:02:44 +0000
Subject: Re: [PATCH] cxlflash: remove an unnecessary NULL check
Message-Id: <159175452258.16072.8552277193377320754.b4-ty@oracle.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200605110258.GD978434@mwanda>
In-Reply-To: <20200605110258.GD978434@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Matthew R. Ochs" <mrochs@linux.vnet.ibm.com>, Dan Carpenter <dan.carpenter@oracle.com>, "Manoj N. Kumar" <manoj@linux.ibm.com>
Cc: "Martin K . Petersen" <martin.petersen@oracle.com>, kernel-janitors@vger.kernel.org, "James E.J. Bottomley" <jejb@linux.ibm.com>, linux-kernel@vger.kernel.org, Uma Krishnan <ukrishn@linux.ibm.com>, linux-scsi@vger.kernel.org

On Fri, 5 Jun 2020 14:02:58 +0300, Dan Carpenter wrote:

> The "cmd" pointer was already dereferenced a couple lines earlier so
> this NULL check is too late.  Fortunately, the pointer can never be NULL
> and the check can be removed.

Applied to 5.8/scsi-queue, thanks!

[1/1] scsi: cxlflash: Remove an unnecessary NULL check
      https://git.kernel.org/mkp/scsi/c/89dd9ce784fb

-- 
Martin K. Petersen	Oracle Linux Engineering
