From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 20 May 2020 17:24:33 +0000
Subject: Re: [PATCH resend] scsi: lpfc: Fix a use after free in lpfc_nvme_unsol_ls_handler()
Message-Id: <20200520172433.GD30374@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <yq1y2purqt1.fsf@oracle.com> <20200515101903.GJ3041@kadam>
 <20200520165557.GA9700@infradead.org>
In-Reply-To: <20200520165557.GA9700@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christoph Hellwig <hch@infradead.org>
Cc: Jens Axboe <axboe@kernel.dk>, Dick Kennedy <dick.kennedy@broadcom.com>, linux-scsi@vger.kernel.org, "Martin K. Petersen" <martin.petersen@oracle.com>, "James E.J. Bottomley" <jejb@linux.ibm.com>, kernel-janitors@vger.kernel.org, James Smart <james.smart@broadcom.com>, linux-nvme@lists.infradead.org, Paul Ely <paul.ely@broadcom.com>, Hannes Reinecke <hare@suse.de>

On Wed, May 20, 2020 at 09:55:57AM -0700, Christoph Hellwig wrote:
> James, can you review this patch?

He already reviewed it in a different thread.  I copied his R-b tag.

regards,
dan carpenter
