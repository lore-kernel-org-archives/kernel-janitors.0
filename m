From: Jinpu Wang <jinpu.wang@cloud.ionos.com>
Date: Thu, 01 Aug 2019 07:07:33 +0000
Subject: Re: [PATCH] scsi: pm80xx: remove redundant assignments to variable rc
Message-Id: <CAMGffEnQ7oRebm9QNKQUcx+MQan1tgQWw6R=O081qbm1kKSw9w@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190731222214.15720-1-colin.king@canonical.com>
In-Reply-To: <20190731222214.15720-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: "James E . J . Bottomley" <jejb@linux.ibm.com>, "Martin K . Petersen" <martin.petersen@oracle.com>, Linux SCSI Mailinglist <linux-scsi@vger.kernel.org>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, Aug 1, 2019 at 12:22 AM Colin King <colin.king@canonical.com> wrote:
>
> From: Colin Ian King <colin.king@canonical.com>
>
> There are several occasions where variable rc is being initialized
> with a value that is never read and error is being re-assigned a
> little later on.  Clean up the code by removing rc entirely and
> just returning the return value from the call to pm8001_issue_ssp_tmf
>
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
Acked-by: Jack Wang <jinpu.wang@cloud.ionos.com>

Thanks, Colin.
