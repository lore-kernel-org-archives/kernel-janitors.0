From: Christoph Hellwig <hch@infradead.org>
Date: Wed, 20 May 2020 17:48:00 +0000
Subject: Re: [PATCH resend] scsi: lpfc: Fix a use after free in lpfc_nvme_unsol_ls_handler()
Message-Id: <20200520174800.GA13253@infradead.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <yq1y2purqt1.fsf@oracle.com> <20200515101903.GJ3041@kadam>
 <20200520165557.GA9700@infradead.org>
 <20200520172433.GD30374@kadam>
 <20200520172844.GA21006@infradead.org>
 <yq1y2pmtsv7.fsf@ca-mkp.ca.oracle.com>
 <20200520173752.GA13546@infradead.org>
 <yq1sgfutsjd.fsf@ca-mkp.ca.oracle.com>
In-Reply-To: <yq1sgfutsjd.fsf@ca-mkp.ca.oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Martin K. Petersen" <martin.petersen@oracle.com>
Cc: Jens Axboe <axboe@kernel.dk>, Dick Kennedy <dick.kennedy@broadcom.com>, linux-scsi@vger.kernel.org, "James E.J. Bottomley" <jejb@linux.ibm.com>, kernel-janitors@vger.kernel.org, James Smart <james.smart@broadcom.com>, linux-nvme@lists.infradead.org, Christoph Hellwig <hch@infradead.org>, Paul Ely <paul.ely@broadcom.com>, Hannes Reinecke <hare@suse.de>, Dan Carpenter <dan.carpenter@oracle.com>

On Wed, May 20, 2020 at 01:39:55PM -0400, Martin K. Petersen wrote:
> 
> Christoph,
> 
> > I'll pick it up.  Can you give me an ACK for it to show Jens you are
> > ok with that?
> 
> Acked-by: Martin K. Petersen <martin.petersen@oracle.com>

Thanks,

applied to nvme-5.8.
