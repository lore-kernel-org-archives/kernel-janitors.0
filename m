From: "Martin K. Petersen" <martin.petersen@oracle.com>
Date: Wed, 07 Oct 2020 03:04:41 +0000
Subject: Re: [PATCH] scsi: pmcraid: Fix memory allocation in 'pmcraid_alloc_sglist()'
Message-Id: <yq1r1qa68lk.fsf@ca-mkp.ca.oracle.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200920075722.376644-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20200920075722.376644-1-christophe.jaillet@wanadoo.fr>
        (Christophe JAILLET's message of "Sun, 20 Sep 2020 09:57:22 +0200")
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: bvanassche@acm.org
Cc: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, jejb@linux.ibm.com, martin.petersen@oracle.com, jthumshirn@suse.de, hare@suse.com, linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org


> When the scatter list is allocated in 'pmcraid_alloc_sglist()', the
> corresponding pointer should be stored in 'scatterlist' within the
> 'pmcraid_sglist' structure. Otherwise, 'scatterlist' is NULL.
>
> This leads to a potential memory leak and NULL pointer dereference.

> Fixes: ed4414cef2ad ("scsi: pmcraid: Use sgl_alloc_order() and sgl_free_order()")

This does indeed look odd. Bart?

-- 
Martin K. Petersen	Oracle Linux Engineering
