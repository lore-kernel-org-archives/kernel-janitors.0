From: David Miller <davem@davemloft.net>
Date: Sat, 11 Aug 2018 18:25:43 +0000
Subject: Re: [PATCH] rxrpc: remove redundant static int 'zero'
Message-Id: <20180811.112543.234592231299206833.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180809110049.32497-1-colin.king@canonical.com>
In-Reply-To: <20180809110049.32497-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: colin.king@canonical.com
Cc: dhowells@redhat.com, linux-afs@lists.infradead.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin King <colin.king@canonical.com>
Date: Thu,  9 Aug 2018 12:00:49 +0100

> From: Colin Ian King <colin.king@canonical.com>
> 
> The static int 'zero' is defined but is never used hence it is
> redundant and can be removed. The use of this variable was removed
> with commit a158bdd3247b ("rxrpc: Fix call timeouts").
> 
> Cleans up clang warning:
> warning: 'zero' defined but not used [-Wunused-const-variable=]
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied, thank you.
