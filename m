From: "Martin K. Petersen" <martin.petersen@oracle.com>
Date: Fri, 15 Jul 2016 19:14:24 +0000
Subject: Re: [patch] ibmvfc: prevent a potential deadlock
Message-Id: <yq1d1meiui7.fsf@sermon.lab.mkp.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160715111857.GC13153@mwanda>
In-Reply-To: <20160715111857.GC13153@mwanda> (Dan Carpenter's message of "Fri,
	15 Jul 2016 14:18:57 +0300")
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Tyrel Datwyler <tyreld@linux.vnet.ibm.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, "James E.J. Bottomley" <jejb@linux.vnet.ibm.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, linux-scsi@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, kernel-janitors@vger.kernel.org

>>>>> "Dan" = Dan Carpenter <dan.carpenter@oracle.com> writes:

Dan> My static checker complains that we need to unlock on this path.
Dan> Seems true.

Applied to 4.8/scsi-queue.

-- 
Martin K. Petersen	Oracle Linux Engineering
