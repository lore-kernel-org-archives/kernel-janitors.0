From: Vinod Koul <vinod.koul@intel.com>
Date: Fri, 19 May 2017 03:37:50 +0000
Subject: Re: [PATCH][V2] dmaengine: bcm-scm-raid: remove redundant null check on req
Message-Id: <20170519032550.GL15061@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170517215850.5077-1-colin.king@canonical.com>
In-Reply-To: <20170517215850.5077-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Anup Patel <anup.patel@broadcom.com>, Dan Williams <dan.j.williams@intel.com>, dmaengine@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, May 17, 2017 at 10:58:50PM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Req is never null on at the point of the null check, so
> remove this redundant check and just return &req->tx.
> 
> Detected by CoverityScan, CID#1436147 ("Logically dead code")


Applied, thanks

-- 
~Vinod
