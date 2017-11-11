From: David Miller <davem@davemloft.net>
Date: Sat, 11 Nov 2017 10:14:28 +0000
Subject: Re: [PATCH] net: sfc: remove redundant variable start
Message-Id: <20171111.191428.1596681817990095254.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20171109080122.3254-1-colin.king@canonical.com>
In-Reply-To: <20171109080122.3254-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: colin.king@canonical.com
Cc: linux-net-drivers@solarflare.com, ecree@solarflare.com, bkenward@solarflare.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin King <colin.king@canonical.com>
Date: Thu,  9 Nov 2017 08:01:22 +0000

> From: Colin Ian King <colin.king@canonical.com>
> 
> Variable start is assigned but never read hence it is redundant
> and can be removed. Cleans up clang warning:
> 
> drivers/net/ethernet/sfc/ptp.c:655:2: warning: Value stored to 'start'
> is never read
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied.
