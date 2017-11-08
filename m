From: "Martin K. Petersen" <martin.petersen@oracle.com>
Date: Wed, 08 Nov 2017 23:17:09 +0000
Subject: Re: [PATCH 1/2] scsi: mpt3sas: cleanup _scsih_pcie_enumeration_event()
Message-Id: <yq1d14sz7gq.fsf@oracle.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20171108082101.wwseluw5bwnsgwue@mwanda>
In-Reply-To: <20171108082101.wwseluw5bwnsgwue@mwanda> (Dan Carpenter's message
        of "Wed, 8 Nov 2017 11:38:01 +0300")
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Sathya Prakash <sathya.prakash@broadcom.com>, Suganath Prabu Subramani <suganath-prabu.subramani@broadcom.com>, Chaitra P B <chaitra.basappa@broadcom.com>, "James E.J. Bottomley" <jejb@linux.vnet.ibm.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, MPT-FusionLinux.pdl@broadcom.com, linux-scsi@vger.kernel.org, kernel-janitors@vger.kernel.org


Dan,

> The indenting wasn't right, because the last two prints weren't
> indented far enough.  Also it used pr_info() where it was supposed to
> use pr_cont().  I reversed the if statement and pulled the code in one
> tab and did a couple other minor cleanups.

Applied to 4.15/scsi-queue. Thank you!

-- 
Martin K. Petersen	Oracle Linux Engineering
