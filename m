From: Khalid Aziz <khalid@gonehiking.org>
Date: Fri, 21 Apr 2017 14:24:27 +0000
Subject: Re: [PATCH] scsi: BusLogic: fix incorrect spelling of adatper_reset_req
Message-Id: <5f14add6-e78f-9cc7-7f3a-e53fb9e2dd2d@gonehiking.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170221162711.24694-1-colin.king@canonical.com>
In-Reply-To: <20170221162711.24694-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, "James E . J . Bottomley" <jejb@linux.vnet.ibm.com>, "Martin K . Petersen" <martin.petersen@oracle.com>, linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org

On 02/21/2017 09:27 AM, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> trivial fix to spelling mistake, adatper_reset_req should
> be adapter_reset_req.  Also break up very long seq_printf statement
> into multiple lines.
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/scsi/BusLogic.c | 14 +++++++++++---
>  drivers/scsi/BusLogic.h |  2 +-
>  2 files changed, 12 insertions(+), 4 deletions(-)
> 


Acked-by: Khalid Aziz <khalid@gonehiking.org>
