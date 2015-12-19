From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sat, 19 Dec 2015 20:17:07 +0000
Subject: Re: [PATCH] SCSI-lpfc: Use a signed return type for two functions
Message-Id: <20151219201707.GR5284@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <5675A576.8020008@users.sourceforge.net>
In-Reply-To: <5675A576.8020008@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: linux-scsi@vger.kernel.org, Dick Kennedy <dick.kennedy@avagotech.com>, "James E. J. Bottomley" <JBottomley@odin.com>, James Smart <james.smart@avagotech.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

It returns zero or negative error codes.  The callers expect int.  The
current code is harmless.  It should return an int.

regards,
dan carpenter

