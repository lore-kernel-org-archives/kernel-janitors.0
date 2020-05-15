From: "Martin K. Petersen" <martin.petersen@oracle.com>
Date: Fri, 15 May 2020 00:21:30 +0000
Subject: Re: [PATCH] scsi: lpfc: Fix a use after free in lpfc_nvme_unsol_ls_handler()
Message-Id: <yq1y2purqt1.fsf@oracle.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200512181909.GA299091@mwanda>
In-Reply-To: <20200512181909.GA299091@mwanda> (Dan Carpenter's message of
        "Tue, 12 May 2020 21:19:09 +0300")
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: James Smart <james.smart@broadcom.com>, Dick Kennedy <dick.kennedy@broadcom.com>, "James E.J. Bottomley" <jejb@linux.ibm.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, Jens Axboe <axboe@kernel.dk>, Hannes Reinecke <hare@suse.de>, Paul Ely <paul.ely@broadcom.com>, linux-scsi@vger.kernel.org, kernel-janitors@vger.kernel.org, Christoph Hellwig <hch@lst.de>


Dan,

> The "axchg" pointer is dereferenced when we call the
> lpfc_nvme_unsol_ls_issue_abort() function.  It can't be either freed or
> NULL.
>
> Fixes: 3a8070c567aa ("lpfc: Refactor NVME LS receive handling")

This fix needs to go through the NVMe tree.

-- 
Martin K. Petersen	Oracle Linux Engineering
