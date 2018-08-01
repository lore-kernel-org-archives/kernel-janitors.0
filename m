From: David Miller <davem@davemloft.net>
Date: Wed, 01 Aug 2018 16:48:16 +0000
Subject: Re: [PATCH] net/tipc: remove redundant variables 'tn' and 'oport'
Message-Id: <20180801.094816.1024347972181172876.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180731160137.5850-1-colin.king@canonical.com>
In-Reply-To: <20180731160137.5850-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: colin.king@canonical.com
Cc: jon.maloy@ericsson.com, ying.xue@windriver.com, netdev@vger.kernel.org, tipc-discussion@lists.sourceforge.net, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin King <colin.king@canonical.com>
Date: Tue, 31 Jul 2018 17:01:37 +0100

> From: Colin Ian King <colin.king@canonical.com>
> 
> Variables 'tn' and 'oport'  are being assigned but are never used hence
> they are redundant and can be removed.
> 
> Cleans up clang warnings:
> warning: variable 'oport' set but not used [-Wunused-but-set-variable]
> warning: variable 'tn' set but not used [-Wunused-but-set-variable]
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied.
