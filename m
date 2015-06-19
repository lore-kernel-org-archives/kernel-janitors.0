From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 19 Jun 2015 07:46:08 +0000
Subject: Re: hpsa static checker issues
Message-Id: <20150619074608.GM28762@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <07F70BBF6832E34FA1C923241E8833AB486B33CF@BBYEXM01.pmc-sierra.internal>
In-Reply-To: <07F70BBF6832E34FA1C923241E8833AB486B33CF@BBYEXM01.pmc-sierra.internal>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Don Brace <Don.Brace@pmcs.com>
Cc: "James E.J. Bottomley" <JBottomley@odin.com>, "iss_storagedev@hp.com" <iss_storagedev@hp.com>, dl Team ESD Storage Dev Support <storagedev@pmcs.com>, "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

On Thu, Jun 18, 2015 at 06:42:14PM +0000, Don Brace wrote:
> Dan,
> 
> You had noted three concerns covering: mutex_unlock, decode sense data, and a goto label issue, that were detected during
> your static checker run. 
> 
> I have patches that address these issues. 
> 
> I am thinking that I need to post these three patches linux-scsi.
> 
> Is that correct?

Yes.  That's right.

regards,
dan carpenter

