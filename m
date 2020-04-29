From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 29 Apr 2020 19:54:02 +0000
Subject: Re: [PATCH] scsi: pm80xx: remove redundant assignments to status
Message-Id: <20200429195402.GS2014@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200429154055.286617-1-colin.king@canonical.com>
In-Reply-To: <20200429154055.286617-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Jack Wang <jinpu.wang@cloud.ionos.com>, "James E . J . Bottomley" <jejb@linux.ibm.com>, "Martin K . Petersen" <martin.petersen@oracle.com>, linux-scsi@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, Apr 29, 2020 at 04:40:55PM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The variable status is being assigned with a value that is never read
> hence the assignment is redundant and can be removed.
> 
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Better to remove the "status" variable entirely.

regards,
dan carpenter
