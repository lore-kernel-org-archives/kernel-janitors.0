From: David Miller <davem@davemloft.net>
Date: Mon, 02 Jul 2018 11:36:11 +0000
Subject: Re: [PATCH][next] netdevsim: fix sa_idx out of bounds check
Message-Id: <20180702.203611.801501021039255132.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180630203924.5121-1-colin.king@canonical.com>
In-Reply-To: <20180630203924.5121-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: colin.king@canonical.com
Cc: jakub.kicinski@netronome.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin King <colin.king@canonical.com>
Date: Sat, 30 Jun 2018 21:39:24 +0100

> From: Colin Ian King <colin.king@canonical.com>
> 
> Currently if sa_idx is equal to NSIM_IPSEC_MAX_SA_COUNT then
> an out-of-bounds read on ipsec->sa will occur. Fix the
> incorrect bounds check by using >= rather than >.
> 
> Detected by CoverityScan, CID#1470226 ("Out-of-bounds-read")
> 
> Fixes: 7699353da875 ("netdevsim: add ipsec offload testing")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied, thank you.
