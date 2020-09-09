From: "Martin K. Petersen" <martin.petersen@oracle.com>
Date: Wed, 09 Sep 2020 02:17:23 +0000
Subject: Re: [PATCH] scsi: aacraid: remove erroneous fallthrough annotation
Message-Id: <159961781205.6233.7483987254461010117.b4-ty@oracle.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200825112003.GD285523@mwanda>
In-Reply-To: <20200825112003.GD285523@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Adaptec OEM Raid Solutions <aacraid@microsemi.com>
Cc: "Martin K . Petersen" <martin.petersen@oracle.com>, Raghava Aditya Renukunta <RaghavaAditya.Renukunta@microsemi.com>, linux-scsi@vger.kernel.org, Johannes Thumshirn <jthumshirn@suse.de>, "James E.J. Bottomley" <jejb@linux.ibm.com>, kernel-janitors@vger.kernel.org, Dave Carroll <David.Carroll@microsemi.com>

On Tue, 25 Aug 2020 14:20:03 +0300, Dan Carpenter wrote:

> This fallthrough annotation is unreachable so we can delete it.

Applied to 5.10/scsi-queue, thanks!

[1/1] scsi: aacraid: Remove erroneous fallthrough annotation
      https://git.kernel.org/mkp/scsi/c/cfd3d2225aa5

-- 
Martin K. Petersen	Oracle Linux Engineering
