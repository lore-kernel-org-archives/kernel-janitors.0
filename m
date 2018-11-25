From: David Miller <davem@davemloft.net>
Date: Sun, 25 Nov 2018 01:40:53 +0000
Subject: Re: [PATCH] net: qualcomm: rmnet: move null check on dev before dereferecing it
Message-Id: <20181124.174053.2148461318593755323.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20181124150302.20339-1-colin.king@canonical.com>
In-Reply-To: <20181124150302.20339-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: colin.king@canonical.com
Cc: subashab@codeaurora.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin King <colin.king@canonical.com>
Date: Sat, 24 Nov 2018 15:03:02 +0000

> From: Colin Ian King <colin.king@canonical.com>
> 
> Currently dev is dereferenced by the call dev_net(dev) before dev is null
> checked.  Fix this by null checking dev before the potential null
> pointer dereference.
> 
> Detected by CoverityScan, CID#1462955 ("Dereference before null check")
> 
> Fixes: 23790ef12082 ("net: qualcomm: rmnet: Allow to configure flags for existing devices")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied to net-next.
