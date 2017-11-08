From: "Martin K. Petersen" <martin.petersen@oracle.com>
Date: Wed, 08 Nov 2017 23:18:17 +0000
Subject: Re: [patch 2/2] scsi: mpt3sas: remove a stray KERN_INFO
Message-Id: <yq18tfgz7eu.fsf@oracle.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20171108083819.u2yufaeamh2vffac@mwanda>
In-Reply-To: <20171108083819.u2yufaeamh2vffac@mwanda> (Dan Carpenter's message
        of "Wed, 8 Nov 2017 11:38:20 +0300")
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Sathya Prakash <sathya.prakash@broadcom.com>, Suganath Prabu Subramani <suganath-prabu.subramani@broadcom.com>, Chaitra P B <chaitra.basappa@broadcom.com>, "James E.J. Bottomley" <jejb@linux.vnet.ibm.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, MPT-FusionLinux.pdl@broadcom.com, linux-scsi@vger.kernel.org, kernel-janitors@vger.kernel.org


Dan,

> pr_info() has a KERN_INFO already so the second KERN_INFO isn't needed.
>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied to 4.15/scsi-queue.

-- 
Martin K. Petersen	Oracle Linux Engineering
