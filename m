From: "Martin K. Petersen" <martin.petersen@oracle.com>
Date: Tue, 29 Nov 2016 16:28:38 +0000
Subject: Re: [patch] scsi: hisi_sas: shift vs compare typos
Message-Id: <yq1fumap7wp.fsf@sermon.lab.mkp.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20161129104725.GA7623@mwanda>
In-Reply-To: <20161129104725.GA7623@mwanda> (Dan Carpenter's message of "Tue,
        29 Nov 2016 13:47:25 +0300")
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: John Garry <john.garry@huawei.com>, Xiang Chen <chenxiang66@hisilicon.com>, "James E.J. Bottomley" <jejb@linux.vnet.ibm.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, linux-scsi@vger.kernel.org, kernel-janitors@vger.kernel.org

>>>>> "Dan" = Dan Carpenter <dan.carpenter@oracle.com> writes:

Dan> There are some typos where we intended "<<" but have "<".  Seems
Dan> likely to cause a bunch of problems.

Applied to 4.10/scsi-queue.

-- 
Martin K. Petersen	Oracle Linux Engineering
