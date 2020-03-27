From: "Martin K. Petersen" <martin.petersen@oracle.com>
Date: Fri, 27 Mar 2020 01:12:15 +0000
Subject: Re: [PATCH] scsi: aha1740: Fix an errro handling path in 'aha1740_probe()'
Message-Id: <yq1k136fvo0.fsf@oracle.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200228215948.7473-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20200228215948.7473-1-christophe.jaillet@wanadoo.fr> (Christophe
        JAILLET's message of "Fri, 28 Feb 2020 22:59:48 +0100")
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: jejb@linux.ibm.com, martin.petersen@oracle.com, linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org


Christophe,

> If 'dma_map_single()' fails, the ref counted 'shpnt' will be decremented
> twice because 'scsi_host_put()' is called in the if block, and in the
> error handling path.

Applied to 5.7/scsi-queue, thanks!

-- 
Martin K. Petersen	Oracle Linux Engineering
