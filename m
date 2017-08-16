From: "Matthew R. Ochs" <mrochs@linux.vnet.ibm.com>
Date: Wed, 16 Aug 2017 00:21:31 +0000
Subject: Re: [PATCH] scsi: cxlflash: Fix an error handling path in 'cxlflash_disk_attach()'
Message-Id: <D62EAC69-693C-4231-95F9-B48F47AB241C@linux.vnet.ibm.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170815201814.12929-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20170815201814.12929-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: "Manoj N. Kumar" <manoj@linux.vnet.ibm.com>, Uma Krishnan <ukrishn@linux.vnet.ibm.com>, "James E.J. Bottomley" <jejb@linux.vnet.ibm.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, linux-scsi <linux-scsi@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

> On Aug 15, 2017, at 3:18 PM, Christophe JAILLET <christophe.jaillet@wanadoo.fr> wrote:
> 
> 'rc' is known to be 0 at this point.
> If 'create_context()' fails, returns -ENOMEM instead of 0 which means
> success.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Yep, that's a bug.

Acked-by: Matthew R. Ochs <mrochs@linux.vnet.ibm.com>

