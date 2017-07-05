From: "Matthew R. Ochs" <mrochs@linux.vnet.ibm.com>
Date: Wed, 05 Jul 2017 17:56:44 +0000
Subject: Re: [PATCH] cxlflash: return -EFAULT if copy_from_user() fails
Message-Id: <CA3F0E37-1B3F-4B7A-A544-C0EF3B826EDC@linux.vnet.ibm.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170630080106.yxyckztimezvpzrt@mwanda>
In-Reply-To: <20170630080106.yxyckztimezvpzrt@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: "Manoj N. Kumar" <manoj@linux.vnet.ibm.com>, Uma Krishnan <ukrishn@linux.vnet.ibm.com>, "James E.J. Bottomley" <jejb@linux.vnet.ibm.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, linux-scsi@vger.kernel.org, kernel-janitors@vger.kernel.org


> On Jun 30, 2017, at 3:01 AM, Dan Carpenter <dan.carpenter@oracle.com> wrote:
> 
> The copy_from/to_user() functions return the number of bytes remaining
> to be copied but we had intended to return -EFAULT here.
> 
> Fixes: bc88ac47d5cb ("scsi: cxlflash: Support AFU debug")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Good catch Dan!

Acked-by: Matthew R. Ochs <mrochs@linux.vnet.ibm.com>

