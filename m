From: "Martin K. Petersen" <martin.petersen@oracle.com>
Date: Fri, 09 Feb 2018 23:50:32 +0000
Subject: Re: [PATCH] scsi: isci: remove redundant initialization to 'bit'
Message-Id: <yq1po5du3hz.fsf@oracle.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180206141236.31651-1-colin.king@canonical.com>
In-Reply-To: <20180206141236.31651-1-colin.king@canonical.com> (Colin King's
        message of "Tue, 6 Feb 2018 14:12:36 +0000")
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Intel SCU Linux support <intel-linux-scu@intel.com>, Artur Paszkiewicz <artur.paszkiewicz@intel.com>, "James E . J . Bottomley" <jejb@linux.vnet.ibm.com>, "Martin K . Petersen" <martin.petersen@oracle.com>, linux-scsi@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org


Colin,

> Variable bit is initialized with a value that is never read and is
> being updated immediately after the initialization, hence the
> initialization is redundant and can be removed.

Applied to 4.17/scsi-queue. Thanks!

-- 
Martin K. Petersen	Oracle Linux Engineering
