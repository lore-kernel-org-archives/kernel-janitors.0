From: "Martin K. Petersen" <martin.petersen@oracle.com>
Date: Fri, 25 Nov 2016 15:07:23 +0000
Subject: Re: [patch] scsi: libfc: Remove an unneeded condition
Message-Id: <yq1h96vtx78.fsf@sermon.lab.mkp.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20161124105238.GB17225@mwanda>
In-Reply-To: <20161124105238.GB17225@mwanda> (Dan Carpenter's message of "Thu,
        24 Nov 2016 13:52:38 +0300")
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Johannes Thumshirn <jth@kernel.org>, Hannes Reinecke <hare@suse.de>, "James E.J. Bottomley" <jejb@linux.vnet.ibm.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, fcoe-devel@open-fcoe.org, linux-scsi@vger.kernel.org, kernel-janitors@vger.kernel.org

>>>>> "Dan" = Dan Carpenter <dan.carpenter@oracle.com> writes:

Dan> We verified that resp_code is FC_SPP_RESP_ACK earlier so we don't
Dan> need to check again here.

Applied to 4.10/scsi-queue.

-- 
Martin K. Petersen	Oracle Linux Engineering
