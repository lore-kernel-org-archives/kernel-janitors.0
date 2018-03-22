From: David Miller <davem@davemloft.net>
Date: Thu, 22 Mar 2018 18:48:49 +0000
Subject: Re: [PATCH][next] net: mvpp2: use correct index on array mvpp2_pools
Message-Id: <20180322.144849.993359976144963406.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180321173115.1820-1-colin.king@canonical.com>
In-Reply-To: <20180321173115.1820-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: colin.king@canonical.com
Cc: antoine.tenart@bootlin.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin King <colin.king@canonical.com>
Date: Wed, 21 Mar 2018 17:31:15 +0000

> From: Colin Ian King <colin.king@canonical.com>
> 
> Array mvpp2_pools is being indexed by long_log_pool, however this
> looks like a cut-n-paste bug and in fact should be short_log_pool.
> 
> Detected by CoverityScan, CID#1466113 ("Copy-paste error")
> 
> Fixes: 576193f2d579 ("net: mvpp2: jumbo frames support")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied, thank you.
