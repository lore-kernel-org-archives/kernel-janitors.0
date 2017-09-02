From: David Miller <davem@davemloft.net>
Date: Sat, 02 Sep 2017 01:34:52 +0000
Subject: Re: [PATCH][net-next] net: qualcomm: rmnet: remove unused variable priv
Message-Id: <20170901.183452.1095616327099284759.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170831140727.28170-1-colin.king@canonical.com>
In-Reply-To: <20170831140727.28170-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: colin.king@canonical.com
Cc: subashab@codeaurora.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin King <colin.king@canonical.com>
Date: Thu, 31 Aug 2017 15:07:27 +0100

> From: Colin Ian King <colin.king@canonical.com>
> 
> priv is being assigned but is never used, so remove it.
> 
> Cleans up clang build warning:
> "warning: Value stored to 'priv' is never read"
> 
> Fixes: ceed73a2cf4a ("drivers: net: ethernet: qualcomm: rmnet: Initial implementation")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied.
