From: "Martin K. Petersen" <martin.petersen@oracle.com>
Date: Thu, 04 Feb 2016 02:54:05 +0000
Subject: Re: [patch] bfa: use strncpy() instead of memcpy()
Message-Id: <yq1twlpi3si.fsf@sermon.lab.mkp.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160130143603.GB3462@mwanda>
In-Reply-To: <20160130143603.GB3462@mwanda> (Dan Carpenter's message of "Sat,
	30 Jan 2016 17:36:03 +0300")
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Anil Gurumurthy <anil.gurumurthy@qlogic.com>, Sudarsana Kalluru <sudarsana.kalluru@qlogic.com>, "James E.J. Bottomley" <JBottomley@odin.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

>>>>> "Dan" = Dan Carpenter <dan.carpenter@oracle.com> writes:

Dan> BFA_MFG_NAME is "QLogic" which is only 7 bytes, but we are copying
Dan> 8 bytes.  It's harmless because the badding byte is likely zero but
Dan> it makes static checkers complain.

Applied to 4.6/scsi-queue.

-- 
Martin K. Petersen	Oracle Linux Engineering
