From: "Martin K. Petersen" <martin.petersen@oracle.com>
Date: Tue, 09 May 2017 01:52:02 +0000
Subject: Re: [PATCH] scsi: qedf: Cleanup the type of io_log->op
Message-Id: <yq1r2zyssot.fsf@oracle.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170503212357.cdl4e43ihpyzl2w6@mwanda>
In-Reply-To: <20170503212357.cdl4e43ihpyzl2w6@mwanda> (Dan Carpenter's message
        of "Thu, 4 May 2017 00:23:57 +0300")
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: QLogic-Storage-Upstream@cavium.com, "James E.J. Bottomley" <jejb@linux.vnet.ibm.com>, linux-scsi@vger.kernel.org, kernel-janitors@vger.kernel.org


Dan,

> We store sc_cmd->cmnd[0] which is an unsigned char in io_log->op so
> this should also be unsigned char.  The other thing is that this is
> displayed in the debugfs:

Applied to 4.12/scsi-fixes, thanks!

-- 
Martin K. Petersen	Oracle Linux Engineering
