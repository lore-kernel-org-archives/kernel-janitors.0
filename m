From: David Miller <davem@davemloft.net>
Date: Thu, 05 Jul 2018 10:31:03 +0000
Subject: Re: [PATCH] net: socionext: remove redundant pointer ndev
Message-Id: <20180705.193103.57391129020975224.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180705092613.20560-1-colin.king@canonical.com>
In-Reply-To: <20180705092613.20560-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: colin.king@canonical.com
Cc: jaswinder.singh@linaro.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin King <colin.king@canonical.com>
Date: Thu,  5 Jul 2018 10:26:13 +0100

> From: Colin Ian King <colin.king@canonical.com>
> 
> Pointer ndev is being assigned but is never used hence it is
> redundant and can be removed.
> 
> Cleans up clang warning:
> warning: variable 'ndev' set but not used [-Wunused-but-set-variable]
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied.
