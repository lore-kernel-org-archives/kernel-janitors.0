From: "Martin K. Petersen" <martin.petersen@oracle.com>
Date: Tue, 17 Dec 2019 02:49:35 +0000
Subject: Re: [PATCH] scsi: mpt3sas: Fix double free in attach error handling
Message-Id: <yq1pngnhdj4.fsf@oracle.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191203093652.gyntgvnkw2udatyc@kili.mountain>
In-Reply-To: <20191203093652.gyntgvnkw2udatyc@kili.mountain> (Dan Carpenter's
        message of "Tue, 3 Dec 2019 12:36:52 +0300")
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Sathya Prakash <sathya.prakash@broadcom.com>, Chaitra P B <chaitra.basappa@broadcom.com>, Suganath Prabu Subramani <suganath-prabu.subramani@broadcom.com>, "James E.J. Bottomley" <jejb@linux.ibm.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, MPT-FusionLinux.pdl@broadcom.com, linux-scsi@vger.kernel.org, kernel-janitors@vger.kernel.org


Dan,

> The caller also calls _base_release_memory_pools() on error so it
> leads to a number of double frees:

Applied to 5.5/scsi-fixes, thanks!

-- 
Martin K. Petersen	Oracle Linux Engineering
