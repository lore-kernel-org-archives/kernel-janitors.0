From: "Martin K. Petersen" <martin.petersen@oracle.com>
Date: Thu, 03 Dec 2020 20:45:01 +0000
Subject: Re: [PATCH] scsi: be2iscsi: revert "Fix a theoretical leak in beiscsi_create_eqs()"
Message-Id: <160702820882.27665.13232983618301808305.b4-ty@oracle.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <X8jXkt6eThjyVP1v@mwanda>
In-Reply-To: <X8jXkt6eThjyVP1v@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Subbu Seetharaman <subbu.seetharaman@broadcom.com>, Dan Carpenter <dan.carpenter@oracle.com>, Thomas Lamprecht <t.lamprecht@proxmox.com>
Cc: "Martin K . Petersen" <martin.petersen@oracle.com>, jejb@linux.ibm.com, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, stable@vger.kernel.org, jitendra.bhivare@broadcom.com, linux-scsi@vger.kernel.org, jayamohank@hdredirect-lb5-1afb6e2973825a56.elb.us-east-1.amazonaws.com, James.Bottomley@suse.de, ketan.mukadam@broadcom.com, Greg KH <greg@kroah.com>

On Thu, 3 Dec 2020 15:18:26 +0300, Dan Carpenter wrote:

> My patch caused kernel Oopses and delays in boot.  Revert it.
> 
> The problem was that I moved the "mem->dma = paddr;" before the call to
> be_fill_queue().  But the first thing that the be_fill_queue() function
> does is memset the whole struct to zero which overwrites the assignment.

Added Cc: stable and applied to 5.10/scsi-fixes, thanks!

[1/1] scsi: be2iscsi: revert "Fix a theoretical leak in beiscsi_create_eqs()"
      https://git.kernel.org/mkp/scsi/c/eeaf06af6f87

-- 
Martin K. Petersen	Oracle Linux Engineering
