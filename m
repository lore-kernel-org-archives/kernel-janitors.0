From: "Martin K. Petersen" <martin.petersen@oracle.com>
Date: Thu, 12 Nov 2015 01:59:08 +0000
Subject: Re: [patch] mptfusion: don't allow negative bytes in kbuf_alloc_2_sgl()
Message-Id: <yq1io58t1ub.fsf@sermon.lab.mkp.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20151110221524.GB30281@mwanda>
In-Reply-To: <20151110221524.GB30281@mwanda> (Dan Carpenter's message of "Wed,
	11 Nov 2015 01:15:24 +0300")
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Nagalakshmi Nandigama <nagalakshmi.nandigama@avagotech.com>, Praveen Krishnamoorthy <praveen.krishnamoorthy@avagotech.com>, Sreekanth Reddy <sreekanth.reddy@avagotech.com>, Abhijit Mahajan <abhijit.mahajan@avagotech.com>, MPT-FusionLinux.pdl@avagotech.com, linux-scsi@vger.kernel.org, kernel-janitors@vger.kernel.org

>>>>> "Dan" = Dan Carpenter <dan.carpenter@oracle.com> writes:

Dan> There is a static checker warning here because "bytes" is
Dan> controlled by the user and we cap the upper bound with min() but
Dan> allow negatives.  Negative bytes will result in some nasty warning
Dan> messages but are not super harmful.  Anyway, no one needs negative
Dan> bytes so let's just check for it and return NULL.

Applied.

-- 
Martin K. Petersen	Oracle Linux Engineering
