From: Greg KH <greg@kroah.com>
Date: Thu, 03 Dec 2020 18:25:05 +0000
Subject: Re: [PATCH] scsi: be2iscsi: revert "Fix a theoretical leak in beiscsi_create_eqs()"
Message-Id: <X8ktgeCVhGPw4wnW@kroah.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <54f36c62-10bf-8736-39ce-27ece097d9de@proxmox.com>
 <X8jXkt6eThjyVP1v@mwanda>
In-Reply-To: <X8jXkt6eThjyVP1v@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Subbu Seetharaman <subbu.seetharaman@broadcom.com>, Thomas Lamprecht <t.lamprecht@proxmox.com>, James.Bottomley@suse.de, jayamohank@hdredirect-lb5-1afb6e2973825a56.elb.us-east-1.amazonaws.com, jejb@linux.ibm.com, jitendra.bhivare@broadcom.com, kernel-janitors@vger.kernel.org, ketan.mukadam@broadcom.com, linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org, martin.petersen@oracle.com, stable@vger.kernel.org

On Thu, Dec 03, 2020 at 03:18:26PM +0300, Dan Carpenter wrote:
> My patch caused kernel Oopses and delays in boot.  Revert it.
> 
> The problem was that I moved the "mem->dma = paddr;" before the call to
> be_fill_queue().  But the first thing that the be_fill_queue() function
> does is memset the whole struct to zero which overwrites the assignment.
> 
> Fixes: 38b2db564d9a ("scsi: be2iscsi: Fix a theoretical leak in beiscsi_create_eqs()")
> Reported-by: Thomas Lamprecht <t.lamprecht@proxmox.com>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Can someone please add:
	Cc: stable <stable@vger.kernel.org>
to this so we know to pick it up quickly there?

thanks,

greg k-h
