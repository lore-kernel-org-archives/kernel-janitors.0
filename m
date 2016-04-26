From: "Martin K. Petersen" <martin.petersen@oracle.com>
Date: Tue, 26 Apr 2016 02:03:25 +0000
Subject: Re: [patch] bnx2i: silence uninitialized variable warnings
Message-Id: <yq1a8khi0sy.fsf@sermon.lab.mkp.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160414094006.GB16891@mwanda>
In-Reply-To: <20160414094006.GB16891@mwanda> (Dan Carpenter's message of "Thu,
	14 Apr 2016 12:40:06 +0300")
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: QLogic-Storage-Upstream@qlogic.com, "James E.J. Bottomley" <jejb@linux.vnet.ibm.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

>>>>> "Dan" = Dan Carpenter <dan.carpenter@oracle.com> writes:

Dan> Presumably it isn't possible to have empty lists here, but my
Dan> static checker doesn't know that and complains that "ep" can be
Dan> used uninitialized.

Applied to 4.7/scsi-queue.

-- 
Martin K. Petersen	Oracle Linux Engineering
