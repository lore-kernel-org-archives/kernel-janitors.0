From: "Martin K. Petersen" <martin.petersen@oracle.com>
Date: Wed, 27 Jan 2021 04:54:22 +0000
Subject: Re: [PATCH] scsi: qla2xxx: remove unnecessary NULL check
Message-Id: <161172309263.28139.7036192153186894654.b4-ty@oracle.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <YAkaaSrhn1mFqyHy@mwanda>
In-Reply-To: <YAkaaSrhn1mFqyHy@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Nilesh Javali <njavali@marvell.com>
Cc: "Martin K . Petersen" <martin.petersen@oracle.com>, "James E.J. Bottomley" <jejb@linux.ibm.com>, GR-QLogic-Storage-Upstream@marvell.com, linux-scsi@vger.kernel.org, kernel-janitors@vger.kernel.org

On Thu, 21 Jan 2021 09:08:41 +0300, Dan Carpenter wrote:

> The list iterator can't be NULL so this check is not required.  Removing
> the check silences a Smatch warning about inconsistent NULL checking.
> 
>     drivers/scsi/qla2xxx/qla_dfs.c:371 qla_dfs_tgt_counters_show()
>     error: we previously assumed 'fcport' could be null (see line 372)

Applied to 5.12/scsi-queue, thanks!

[1/1] scsi: qla2xxx: remove unnecessary NULL check
      https://git.kernel.org/mkp/scsi/c/c750a9c9c59a

-- 
Martin K. Petersen	Oracle Linux Engineering
