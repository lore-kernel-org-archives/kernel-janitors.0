From: Don Brace <Don.Brace@pmcs.com>
Date: Thu, 18 Jun 2015 18:42:14 +0000
Subject: hpsa static checker issues
Message-Id: <07F70BBF6832E34FA1C923241E8833AB486B33CF@BBYEXM01.pmc-sierra.internal>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: "James E.J. Bottomley" <JBottomley@odin.com>, "iss_storagedev@hp.com" <iss_storagedev@hp.com>, dl Team ESD Storage Dev Support <storagedev@pmcs.com>, "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

Dan,

You had noted three concerns covering: mutex_unlock, decode sense data, and a goto label issue, that were detected during
your static checker run. 

I have patches that address these issues. 

I am thinking that I need to post these three patches linux-scsi.

Is that correct?

Thanks,
Don Brace 

