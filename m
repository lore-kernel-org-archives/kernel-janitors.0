From: Quentin Lambert <lambert.quentin@gmail.com>
Date: Wed, 30 Nov 2016 20:18:03 +0000
Subject: Re: [patch] scsi: dpt_i2o: double free on error path
Message-Id: <7d0c3dba-bb98-4df0-8559-fc6d09000735@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20161130193648.GA24818@mwanda>
In-Reply-To: <20161130193648.GA24818@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Adaptec OEM Raid Solutions <aacraid@adaptec.com>
Cc: "James E.J. Bottomley" <jejb@linux.vnet.ibm.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, linux-scsi@vger.kernel.org, kernel-janitors@vger.kernel.org



On 11/30/2016 08:36 PM, Dan Carpenter wrote:
> We recently introduced a kfree() in the caller for this function.
> That's where, logically, you would think the kfree() should be.
> Unfortunately the code was just ugly and not buggy so the static
> checker warning was a false postive and introduced a double free.
>
oh, yes! Sorry I missed that.

Quentin
