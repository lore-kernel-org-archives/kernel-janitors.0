From: "Martin K. Petersen" <martin.petersen@oracle.com>
Date: Wed, 09 Dec 2020 16:57:50 +0000
Subject: Re: [PATCH] scsi: mpt3sas: Signedness bug in _base_get_diag_triggers()
Message-Id: <yq1mtymrk6v.fsf@ca-mkp.ca.oracle.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <X9DZH37bYPHwSQRP@mwanda>
In-Reply-To: <X9DZH37bYPHwSQRP@mwanda> (Dan Carpenter's message of "Wed, 9 Dec
        2020 17:03:11 +0300")
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Sathya Prakash <sathya.prakash@broadcom.com>, Sreekanth Reddy <sreekanth.reddy@broadcom.com>, Suganath Prabu Subramani <suganath-prabu.subramani@broadcom.com>, "James E.J. Bottomley" <jejb@linux.ibm.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, MPT-FusionLinux.pdl@broadcom.com, linux-scsi@vger.kernel.org, kernel-janitors@vger.kernel.org


Dan,

> The "trigger_flags" variable needs to be signed for the error checking
> to work.

Applied to 5.11/scsi-staging, thanks!

-- 
Martin K. Petersen	Oracle Linux Engineering
