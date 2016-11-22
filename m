From: "Martin K. Petersen" <martin.petersen@oracle.com>
Date: Tue, 22 Nov 2016 03:33:42 +0000
Subject: Re: [patch] scsi: be2iscsi: allocate enough memory in beiscsi_boot_get_sinfo()
Message-Id: <yq137ik1949.fsf@sermon.lab.mkp.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20161118115339.GD3281@mwanda>
In-Reply-To: <20161118115339.GD3281@mwanda> (Dan Carpenter's message of "Fri,
        18 Nov 2016 14:53:39 +0300")
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Subbu Seetharaman <subbu.seetharaman@broadcom.com>, Jitendra Bhivare <jitendra.bhivare@broadcom.com>, Ketan Mukadam <ketan.mukadam@broadcom.com>, "James E.J. Bottomley" <jejb@linux.vnet.ibm.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, linux-scsi@vger.kernel.org, kernel-janitors@vger.kernel.org

>>>>> "Dan" = Dan Carpenter <dan.carpenter@oracle.com> writes:

Dan> We accidentally allocate sizeof(u32) instead of sizeof(struct
Dan> be_cmd_get_session_resp).

Applied to 4.9/scsi-fixes.

-- 
Martin K. Petersen	Oracle Linux Engineering
