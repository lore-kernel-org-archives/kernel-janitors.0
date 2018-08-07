From: David Miller <davem@davemloft.net>
Date: Tue, 07 Aug 2018 19:38:32 +0000
Subject: Re: [PATCH] net: thunderx: check for failed allocation lmac->dmacs
Message-Id: <20180807.123832.127388149108997730.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180806165045.15707-1-colin.king@canonical.com>
In-Reply-To: <20180806165045.15707-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-arm-kernel@lists.infradead.org

From: Colin King <colin.king@canonical.com>
Date: Mon,  6 Aug 2018 17:50:45 +0100

> From: Colin Ian King <colin.king@canonical.com>
> 
> The allocation of lmac->dmacs is not being checked for allocation
> failure. Add the check.
> 
> Fixes: 3a34ecfd9d3f ("net: thunderx: add MAC address filter tracking for LMAC")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied.
