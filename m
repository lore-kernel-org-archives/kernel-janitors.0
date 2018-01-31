From: "Martin K. Petersen" <martin.petersen@oracle.com>
Date: Wed, 31 Jan 2018 02:29:55 +0000
Subject: Re: [PATCH] [SCSI] sym53c8xx_2: iterator underflow in sym_getsync()
Message-Id: <yq1k1vyg3q4.fsf@oracle.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180125141340.GA7299@mwanda>
In-Reply-To: <20180125141340.GA7299@mwanda> (Dan Carpenter's message of "Thu,
        25 Jan 2018 17:13:40 +0300")
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Matthew Wilcox <matthew@wil.cx>, "James E.J. Bottomley" <jejb@linux.vnet.ibm.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, linux-scsi@vger.kernel.org, kernel-janitors@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>


Dan,

> We wanted to exit the loop with "div" set to zero, but instead, if we
> don't hit the break then "div" is -1 when we finish the loop.  It
> leads to an array underflow a few lines later.

Applied to 4.16/scsi-fixes, thanks!

-- 
Martin K. Petersen	Oracle Linux Engineering
