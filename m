From: Anil Gurumurthy <Anil.Gurumurthy@qlogic.com>
Date: Fri, 06 May 2016 06:44:01 +0000
Subject: RE: [PATCH resend v2] [SCSI] bfa: fix bfa_fcb_itnim_alloc() error handling
Message-Id: <CY1PR11MB0218498E60CACA99E39CA608947D0@CY1PR11MB0218.namprd11.prod.outlook.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160413111441.GC4247@mwanda>
 <yq1inysvv12.fsf@sermon.lab.mkp.net>
In-Reply-To: <yq1inysvv12.fsf@sermon.lab.mkp.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Martin K. Petersen" <martin.petersen@oracle.com>, Dan Carpenter <dan.carpenter@oracle.com>
Cc: Sudarsana Kalluru <Sudarsana.Kalluru@qlogic.com>, "James E.J. Bottomley" <jejb@linux.vnet.ibm.com>, linux-scsi <linux-scsi@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

Apologies for the delay. Patch looks good.

Acked by: Anil Gurumurthy <anil.gurumurthy@qlogic.com>


-----Original Message-----
From: Martin K. Petersen [mailto:martin.petersen@oracle.com] 
Sent: 06 May 2016 06:54
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Anil Gurumurthy <Anil.Gurumurthy@qlogic.com>; Sudarsana Kalluru <Sudarsana.Kalluru@qlogic.com>; James E.J. Bottomley <jejb@linux.vnet.ibm.com>; Martin K. Petersen <martin.petersen@oracle.com>; linux-scsi <linux-scsi@vger.kernel.org>; kernel-janitors@vger.kernel.org
Subject: Re: [PATCH resend v2] [SCSI] bfa: fix bfa_fcb_itnim_alloc() error handling

>>>>> "Dan" = Dan Carpenter <dan.carpenter@oracle.com> writes:

Dan> The caller assumes that "itnim" is NULL on error and non-NULL on 
Dan> success but really "itnim" is uninitialized on error.  This 
Dan> function should just use normal error handling where it returns 
Dan> zero on success and negative on failure.

Anil, please review:

	https://patchwork.kernel.org/patch/8820751/

-- 
Martin K. Petersen	Oracle Linux Engineering
