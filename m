From: Chad Dupuis <chad.dupuis@cavium.com>
Date: Wed, 17 Jan 2018 14:40:14 +0000
Subject: Re: [PATCH -next] scsi: qedf: Fix error return code in __qedf_probe()
Message-Id: <alpine.OSX.2.00.1801170939230.964@n5113av3dljn32.qlogic.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1516192961-52789-1-git-send-email-weiyongjun1@huawei.com>
In-Reply-To: <1516192961-52789-1-git-send-email-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wei Yongjun <weiyongjun1@huawei.com>
Cc: "James E.J. Bottomley" <jejb@linux.vnet.ibm.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, QLogic-Storage-Upstream@cavium.com, linux-scsi@vger.kernel.org, kernel-janitors@vger.kernel.org


On Wed, 17 Jan 2018, 7:42am, Wei Yongjun wrote:

> Fix to return error code -ENOMEM from the error handling
> case instead of 0, as done elsewhere in this function.
> 
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> ---
>  drivers/scsi/qedf/qedf_main.c | 3 +++
>  1 file changed, 3 insertions(+)
> 

Yeah, we should be returning -ENOMEM in those cases.

Acked-by: Chad Dupuis <chad.dupuis@cavium.com>
