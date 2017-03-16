From: "Martin K. Petersen" <martin.petersen@oracle.com>
Date: Thu, 16 Mar 2017 23:50:25 +0000
Subject: Re: [PATCH] [SCSI] esas2r: remove redundant NULL check on buffer
Message-Id: <yq1inn8n5mm.fsf@oracle.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170315164624.17264-1-colin.king@canonical.com>
In-Reply-To: <20170315164624.17264-1-colin.king@canonical.com> (Colin King's
        message of "Wed, 15 Mar 2017 16:46:24 +0000")
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Bradley Grove <linuxdrivers@attotech.com>, "James E . J . Bottomley" <jejb@linux.vnet.ibm.com>, "Martin K . Petersen" <martin.petersen@oracle.com>, linux-scsi@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Colin King <colin.king@canonical.com> writes:

> buffer is a pointer to the static char array event_buffer and
> therefore can never be null, so the check is redundant. Remove it.

Applied to 4.12/scsi-queue. Thank you!

-- 
Martin K. Petersen	Oracle Linux Engineering
