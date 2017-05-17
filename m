From: Dan Williams <dan.j.williams@intel.com>
Date: Wed, 17 May 2017 19:12:00 +0000
Subject: Re: [PATCH] dmaengine: remove redundant null check on req
Message-Id: <CAPcyv4iD5xD8E3E9+gbgmrbD+nNpXfjMqi4WzTA46H9mSv5gvQ@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170517133549.7157-1-colin.king@canonical.com>
In-Reply-To: <20170517133549.7157-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Anup Patel <anup.patel@broadcom.com>, Vinod Koul <vinod.koul@intel.com>, "dmaengine@vger.kernel.org" <dmaengine@vger.kernel.org>, kernel-janitors@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Wed, May 17, 2017 at 6:35 AM, Colin King <colin.king@canonical.com> wrote:
> From: Colin Ian King <colin.king@canonical.com>
>
> Req is never null on at the point of the null check, so
> remove this redundant check and just return &req->tx.
>
> Detected by CoverityScan, CID#1436147 ("Logically dead code")
>
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Hi Colin,

Looks good, can you also include the driver name in your patch subjects?

For example "dmaengine, bcm-scm-raid: remove redundant null check on
req", would make it clear that this is a driver fix and not a core
dmaengine issue.
