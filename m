From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 20 May 2020 18:01:51 +0000
Subject: Re: [PATCH resend] scsi: lpfc: Fix a use after free in lpfc_nvme_unsol_ls_handler()
Message-Id: <20200520180151.GE30374@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <yq1y2purqt1.fsf@oracle.com> <20200515101903.GJ3041@kadam>
 <20200520165557.GA9700@infradead.org>
 <20200520172433.GD30374@kadam>
 <20200520172844.GA21006@infradead.org>
 <yq1y2pmtsv7.fsf@ca-mkp.ca.oracle.com>
 <20200520173752.GA13546@infradead.org>
 <yq1sgfutsjd.fsf@ca-mkp.ca.oracle.com>
 <20200520174800.GA13253@infradead.org>
 <4693662b-60de-388e-d67f-722eabbba475@broadcom.com>
In-Reply-To: <4693662b-60de-388e-d67f-722eabbba475@broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: James Smart <james.smart@broadcom.com>
Cc: Jens Axboe <axboe@kernel.dk>, Dick Kennedy <dick.kennedy@broadcom.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, linux-scsi@vger.kernel.org, "James E.J. Bottomley" <jejb@linux.ibm.com>, kernel-janitors@vger.kernel.org, linux-nvme@lists.infradead.org, Christoph Hellwig <hch@infradead.org>, Paul Ely <paul.ely@broadcom.com>, Hannes Reinecke <hare@suse.de>

On Wed, May 20, 2020 at 10:51:48AM -0700, James Smart wrote:
> On 5/20/2020 10:48 AM, Christoph Hellwig wrote:
> > On Wed, May 20, 2020 at 01:39:55PM -0400, Martin K. Petersen wrote:
> > > Christoph,
> > > 
> > > > I'll pick it up.  Can you give me an ACK for it to show Jens you are
> > > > ok with that?
> > > Acked-by: Martin K. Petersen <martin.petersen@oracle.com>
> > Thanks,
> > 
> > applied to nvme-5.8.
> 
> Guess you didn't see Dan's response - we had replied, and Dick rejected it.
> Dick has created a new patch that I'll be posting shortly.

Gar....  I'm sorry I have two mail boxes, one for kernel-janitors and
one for my own email address.  I guess his email never made it to the
lists.  I did get it on my other email box though.

regards,
dan carpenter
