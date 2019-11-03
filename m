From: Markus Elfring <Markus.Elfring@web.de>
Date: Sun, 03 Nov 2019 16:05:44 +0000
Subject: Re: scsi: pmcraid: Use *_pool_zalloc rather than *_pool_alloc
Message-Id: <07841ae4-03d2-1fdd-1c32-85c55688bb2a@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1559161113902-328168114-2-diffsplit-thomas@m3y3r.de>
In-Reply-To: <1559161113902-328168114-2-diffsplit-thomas@m3y3r.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Thomas Meyer <thomas@m3y3r.de>, "James E. J. Bottomley" <jejb@linux.ibm.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, linux-scsi@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Vasyl Gomonovych <gomonovych@gmail.com>

> Use *_pool_zalloc rather than *_pool_alloc followed by memset with 0.

Do you find a commit message nicer from a similar change suggestion?
scsi: pmcraid: Use dma_pool_zalloc rather than dma_pool_alloc
https://lore.kernel.org/linux-scsi/20190718181051.22882-1-gomonovych@gmail.com/
https://lore.kernel.org/patchwork/patch/1102040/

Regards,
Markus
