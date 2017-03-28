From: John Garry <john.garry@huawei.com>
Date: Tue, 28 Mar 2017 11:42:12 +0000
Subject: Re: [PATCH] scsi: hisi_sas: add missing break in switch statement
Message-Id: <739ab862-b583-efb5-2ab4-afe40c73c35f@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170328111222.17303-1-colin.king@canonical.com>
In-Reply-To: <20170328111222.17303-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, "James E . J . Bottomley" <jejb@linux.vnet.ibm.com>, "Martin K . Petersen" <martin.petersen@oracle.com>, linux-scsi@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, "chenxiang (M)" <chenxiang66@hisilicon.com>, tanxiaofei <tanxiaofei@huawei.com>

On 28/03/2017 12:12, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
>
> It appears that a break in the TRANS_TX_OPEN_CNX_ERR_NO_DESTINATION
> case got accidentally removed in an earlier commit, as it stands,
> the ts->stat and ts->open_rej_reason are being updated twice for this
> case which looks incorrect.  Fix this by adding in the missing break
> statement.
>
> Detected by CoverityScan, CID#1422110 ("Missing break in switch")
>
> Fixes: 634a9585f49c7 ("scsi: hisi_sas: process error codes according to their priority")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Thanks, checkpatch.pl would normally catch this but it was hidden in the 
formatted patch

Signed-off-by: John Garry <john.garry@huawei.com>

