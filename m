From: "Martin K. Petersen" <martin.petersen@oracle.com>
Date: Mon, 26 Jun 2017 17:34:31 +0000
Subject: Re: [PATCH] bnx2i: missing error code in bnx2i_ep_connect()
Message-Id: <yq1a84u64bc.fsf@oracle.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170623070200.GA7922@elgon.mountain>
In-Reply-To: <20170623070200.GA7922@elgon.mountain> (Dan Carpenter's message
        of "Fri, 23 Jun 2017 10:02:00 +0300")
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: QLogic-Storage-Upstream@qlogic.com, Michael Chan <mchan@broadcom.com>, "James E.J. Bottomley" <jejb@linux.vnet.ibm.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, linux-scsi@vger.kernel.org, kernel-janitors@vger.kernel.org


Dan,

> If bnx2i_map_ep_dbell_regs() then we accidentally return NULL instead
> of an error pointer.  It results in a NULL dereference in
> iscsi_if_ep_connect().

Applied to 4.13/scsi-queue, thanks!

-- 
Martin K. Petersen	Oracle Linux Engineering
