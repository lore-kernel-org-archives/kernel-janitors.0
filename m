From: "Martin K. Petersen" <martin.petersen@oracle.com>
Date: Fri, 15 Apr 2016 20:26:51 +0000
Subject: Re: [patch v2] scsi_dh_alua: uninitialized variable in alua_rtpg()
Message-Id: <yq1r3e6pqic.fsf@sermon.lab.mkp.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160414182034.GA32469@mwanda>
In-Reply-To: <20160414182034.GA32469@mwanda> (Dan Carpenter's message of "Thu,
	14 Apr 2016 21:20:34 +0300")
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: "James E.J. Bottomley" <jejb@linux.vnet.ibm.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, Hannes Reinecke <hare@suse.de>, Bart Van Assche <bart.vanassche@sandisk.com>, Johannes Thumshirn <jthumshirn@suse.de>, Ewan Milne <emilne@redhat.com>, linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

>>>>> "Dan" = Dan Carpenter <dan.carpenter@oracle.com> writes:

Dan> It's possible to use "err" without initializing it.  If it happens
Dan> to be a 2 which is SCSI_DH_RETRY then that could cause a bug.  Bart
Dan> Van Assche pointed out that we should probably re-initialize it for
Dan> every iteration through the retry loop.

Applied to 4.6/scsi-fixes.

-- 
Martin K. Petersen	Oracle Linux Engineering
