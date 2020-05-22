From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 22 May 2020 07:29:11 +0000
Subject: Re: [PATCH 0/3] lpfc: Fix errors in LS receive refactoring
Message-Id: <20200522072911.GA22511@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200520185929.48779-1-jsmart2021@gmail.com>
In-Reply-To: <20200520185929.48779-1-jsmart2021@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: James Smart <jsmart2021@gmail.com>
Cc: axboe@kernel.dk, martin.petersen@oracle.com, linux-scsi@vger.kernel.org, jejb@linux.ibm.com, kernel-janitors@vger.kernel.org, linux-nvme@lists.infradead.org, hch@infradead.org, paul.ely@broadcom.com, hare@suse.de

On Wed, May 20, 2020 at 11:59:26AM -0700, James Smart wrote:
> A prior patch set refactored lpfc to create common routines for NVME LS
> handling for use by both the initiator and target paths.  The refactoring
> introduced several errors spotted by additional testing and static checker
> reporting.
> 
> This patch set corrects those errors.
> 
> The patches should enter via the nvme tree, as the lpfc modifications were
> in support of nvme-fc transport api deltas merged via the nvme tree.
> 
> -- james

Thanks!

Reviewed-by: Dan Carpenter <dan.carpenter@oracle.com>

regards,
dan carpenter
