From: David Miller <davem@davemloft.net>
Date: Sat, 07 Jul 2018 13:07:48 +0000
Subject: Re: [PATCH] drivers: net: lmc: remove redundant variable next_rx
Message-Id: <20180707.220748.550510971551554487.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180707124706.23344-1-colin.king@canonical.com>
In-Reply-To: <20180707124706.23344-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: colin.king@canonical.com
Cc: netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin King <colin.king@canonical.com>
Date: Sat,  7 Jul 2018 13:47:06 +0100

> From: Colin Ian King <colin.king@canonical.com>
> 
> Variable next_rx is being assigned but is never used hence it is
> redundant and can be removed.
> 
> Cleans up clang warning:
> warning: variable 'next_rx' set but not used [-Wunused-but-set-variable]
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied to net-next, thanks Colin.
