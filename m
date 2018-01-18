From: "Martin K. Petersen" <martin.petersen@oracle.com>
Date: Thu, 18 Jan 2018 02:44:26 +0000
Subject: Re: [PATCH -next] scsi: qedf: Fix error return code in __qedf_probe()
Message-Id: <yq1o9lrrilx.fsf@oracle.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1516192961-52789-1-git-send-email-weiyongjun1@huawei.com>
In-Reply-To: <1516192961-52789-1-git-send-email-weiyongjun1@huawei.com> (Wei
        Yongjun's message of "Wed, 17 Jan 2018 12:42:41 +0000")
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wei Yongjun <weiyongjun1@huawei.com>
Cc: "James E.J. Bottomley" <jejb@linux.vnet.ibm.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, QLogic-Storage-Upstream@cavium.com, linux-scsi@vger.kernel.org, kernel-janitors@vger.kernel.org


Wei,

> Fix to return error code -ENOMEM from the error handling
> case instead of 0, as done elsewhere in this function.

Applied to 4.16/scsi-queue, thanks!

-- 
Martin K. Petersen	Oracle Linux Engineering
