From: "Martin K. Petersen" <martin.petersen@oracle.com>
Date: Sat, 23 Jan 2021 03:04:49 +0000
Subject: Re: [PATCH] scsi: qla2xxx: remove unnecessary NULL check
Message-Id: <yq1zh109wwc.fsf@ca-mkp.ca.oracle.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <YAkaaSrhn1mFqyHy@mwanda>
In-Reply-To: <YAkaaSrhn1mFqyHy@mwanda> (Dan Carpenter's message of "Thu, 21
        Jan 2021 09:08:41 +0300")
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Nilesh Javali <njavali@marvell.com>, GR-QLogic-Storage-Upstream@marvell.com, "James E.J. Bottomley" <jejb@linux.ibm.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, linux-scsi@vger.kernel.org, kernel-janitors@vger.kernel.org


Dan,

> The list iterator can't be NULL so this check is not required.  Removing
> the check silences a Smatch warning about inconsistent NULL checking.
>
>     drivers/scsi/qla2xxx/qla_dfs.c:371 qla_dfs_tgt_counters_show()
>     error: we previously assumed 'fcport' could be null (see line 372)

Applied to 5.12/scsi-staging, thanks!

-- 
Martin K. Petersen	Oracle Linux Engineering
