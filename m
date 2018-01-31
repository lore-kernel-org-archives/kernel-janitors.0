From: "Martin K. Petersen" <martin.petersen@oracle.com>
Date: Wed, 31 Jan 2018 02:24:41 +0000
Subject: Re: [PATCH] scsi: csiostor: remove redundant assignment to pointer 'ln'
Message-Id: <yq1shamg3yu.fsf@oracle.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180124145801.18920-1-colin.king@canonical.com>
In-Reply-To: <20180124145801.18920-1-colin.king@canonical.com> (Colin King's
        message of "Wed, 24 Jan 2018 14:58:01 +0000")
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: "James E . J . Bottomley" <jejb@linux.vnet.ibm.com>, "Martin K . Petersen" <martin.petersen@oracle.com>, Varun Prakash <varun@chelsio.com>, linux-scsi@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org


Colin,

> The pointer ln is assigned a value that is never read, it is re-assigned
> a new value in the list_for_each loop hence the initialization is
> redundant and can be removed.

Applied to 4.16/scsi-fixes. Thank you.

-- 
Martin K. Petersen	Oracle Linux Engineering
