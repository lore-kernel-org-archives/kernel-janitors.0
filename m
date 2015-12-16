From: "Martin K. Petersen" <martin.petersen@oracle.com>
Date: Wed, 16 Dec 2015 22:50:17 +0000
Subject: Re: [patch] qla2xxx: fix a timeout loop
Message-Id: <yq1lh8ut3di.fsf@sermon.lab.mkp.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20151216110746.GB21018@mwanda>
In-Reply-To: <20151216110746.GB21018@mwanda> (Dan Carpenter's message of "Wed,
	16 Dec 2015 14:07:46 +0300")
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: qla2xxx-upstream@qlogic.com, Atul Deshmukh <atul.deshmukh@qlogic.com>, "James E.J. Bottomley" <JBottomley@odin.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, linux-scsi@vger.kernel.org, kernel-janitors@vger.kernel.org, Johannes Thumshirn <jthumshirn@suse.de>

>>>>> "Dan" = Dan Carpenter <dan.carpenter@oracle.com> writes:

Dan> After the loop we test for "if (!retries) " as a failure, but
Dan> actually the post-op here will end with retries set to -1.  I have
Dan> fixed this by using a pre-op instead.

Applied to 4.4/scsi-fixes.

-- 
Martin K. Petersen	Oracle Linux Engineering
