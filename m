From: "Martin K. Petersen" <martin.petersen@oracle.com>
Date: Wed, 12 Jul 2017 21:20:48 +0000
Subject: Re: [PATCH] scsi: qla2xxx: Off by one in qlt_ctio_to_cmd()
Message-Id: <yq160exl5cf.fsf@oracle.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170710084739.tjj7juaex7cb7xs5@mwanda>
In-Reply-To: <20170710084739.tjj7juaex7cb7xs5@mwanda> (Dan Carpenter's message
        of "Mon, 10 Jul 2017 11:47:40 +0300")
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: qla2xxx-upstream@qlogic.com, Nicholas Bellinger <nab@linux-iscsi.org>, "James E.J. Bottomley" <jejb@linux.vnet.ibm.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, linux-scsi@vger.kernel.org, kernel-janitors@vger.kernel.org


Dan,

> There are "req->num_outstanding_cmds" elements in the
> req->outstanding_cmds[] array so the > here should be >=.

Applied to 4.13/scsi-fixes. Thanks!

-- 
Martin K. Petersen	Oracle Linux Engineering
