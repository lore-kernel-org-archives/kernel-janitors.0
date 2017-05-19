From: Vinod Koul <vinod.koul@intel.com>
Date: Fri, 19 May 2017 03:34:51 +0000
Subject: Re: [PATCH] dmaengine: remove redundant null check on req
Message-Id: <20170519032251.GK15061@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170517133549.7157-1-colin.king@canonical.com>
 <CAPcyv4iD5xD8E3E9+gbgmrbD+nNpXfjMqi4WzTA46H9mSv5gvQ@mail.gmail.com>
In-Reply-To: <CAPcyv4iD5xD8E3E9+gbgmrbD+nNpXfjMqi4WzTA46H9mSv5gvQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Williams <dan.j.williams@intel.com>
Cc: Colin King <colin.king@canonical.com>, Anup Patel <anup.patel@broadcom.com>, "dmaengine@vger.kernel.org" <dmaengine@vger.kernel.org>, kernel-janitors@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Wed, May 17, 2017 at 12:12:00PM -0700, Dan Williams wrote:
> On Wed, May 17, 2017 at 6:35 AM, Colin King <colin.king@canonical.com> wrote:
> > From: Colin Ian King <colin.king@canonical.com>
> >
> > Req is never null on at the point of the null check, so
> > remove this redundant check and just return &req->tx.
> >
> > Detected by CoverityScan, CID#1436147 ("Logically dead code")
> >
> > Signed-off-by: Colin Ian King <colin.king@canonical.com>
> 
> Hi Colin,
> 
> Looks good, can you also include the driver name in your patch subjects?
> 
> For example "dmaengine, bcm-scm-raid: remove redundant null check on
> req", would make it clear that this is a driver fix and not a core
> dmaengine issue.

Yeah that would help, also do the same for static patch you sent on the
driver.
-- 
~Vinod
