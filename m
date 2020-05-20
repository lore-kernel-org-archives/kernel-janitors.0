From: "Martin K. Petersen" <martin.petersen@oracle.com>
Date: Wed, 20 May 2020 17:39:55 +0000
Subject: Re: [PATCH resend] scsi: lpfc: Fix a use after free in lpfc_nvme_unsol_ls_handler()
Message-Id: <yq1sgfutsjd.fsf@ca-mkp.ca.oracle.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <yq1y2purqt1.fsf@oracle.com> <20200515101903.GJ3041@kadam>
 <20200520165557.GA9700@infradead.org> <20200520172433.GD30374@kadam>
 <20200520172844.GA21006@infradead.org>
 <yq1y2pmtsv7.fsf@ca-mkp.ca.oracle.com>
 <20200520173752.GA13546@infradead.org>
In-Reply-To: <20200520173752.GA13546@infradead.org> (Christoph Hellwig's
 message of "Wed, 20 May 2020 10:37:52 -0700")
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christoph Hellwig <hch@infradead.org>
Cc: Jens Axboe <axboe@kernel.dk>, Dick Kennedy <dick.kennedy@broadcom.com>, linux-scsi@vger.kernel.org, "Martin K. Petersen" <martin.petersen@oracle.com>, "James
 E.J. Bottomley" <jejb@linux.ibm.com>, kernel-janitors@vger.kernel.org, James Smart <james.smart@broadcom.com>, linux-nvme@lists.infradead.org, Paul Ely <paul.ely@broadcom.com>, Hannes Reinecke <hare@suse.de>, Dan Carpenter <dan.carpenter@oracle.com>


Christoph,

> I'll pick it up.  Can you give me an ACK for it to show Jens you are
> ok with that?

Acked-by: Martin K. Petersen <martin.petersen@oracle.com>

-- 
Martin K. Petersen	Oracle Linux Engineering
