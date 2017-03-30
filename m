From: "Martin K. Petersen" <martin.petersen@oracle.com>
Date: Thu, 30 Mar 2017 02:39:52 +0000
Subject: Re: [PATCH] scsi: hisi_sas: add missing break in switch statement
Message-Id: <yq1fuhv4hdz.fsf@oracle.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170328111222.17303-1-colin.king@canonical.com>
In-Reply-To: <20170328111222.17303-1-colin.king@canonical.com> (Colin King's
        message of "Tue, 28 Mar 2017 12:12:22 +0100")
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: John Garry <john.garry@huawei.com>, "James E . J . Bottomley" <jejb@linux.vnet.ibm.com>, "Martin K . Petersen" <martin.petersen@oracle.com>, linux-scsi@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Colin King <colin.king@canonical.com> writes:

Colin,

> It appears that a break in the TRANS_TX_OPEN_CNX_ERR_NO_DESTINATION
> case got accidentally removed in an earlier commit, as it stands, the
> ts->stat and ts->open_rej_reason are being updated twice for this case
> which looks incorrect.  Fix this by adding in the missing break
> statement.

Applied to 4.12/scsi-queue.

Thank you!

-- 
Martin K. Petersen	Oracle Linux Engineering
