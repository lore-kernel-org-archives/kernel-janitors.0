From: "Martin K. Petersen" <martin.petersen@oracle.com>
Date: Wed, 11 May 2016 02:01:26 +0000
Subject: Re: [patch] [SCSI] eata_pio: missing break statement
Message-Id: <yq1twi5nyix.fsf@sermon.lab.mkp.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160504061341.GA22064@mwanda>
In-Reply-To: <20160504061341.GA22064@mwanda> (Dan Carpenter's message of "Wed,
	4 May 2016 09:13:41 +0300")
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: "James E.J. Bottomley" <jejb@linux.vnet.ibm.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

>>>>> "Dan" = Dan Carpenter <dan.carpenter@oracle.com> writes:

Dan> This missing break statement bug predates git.  It's a very minor
Dan> thing, it means that we print a '?' instead of a 'z' in dmesg.

Applied to 4.7/scsi-queue.

-- 
Martin K. Petersen	Oracle Linux Engineering
