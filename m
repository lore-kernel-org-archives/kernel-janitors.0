From: David Miller <davem@davemloft.net>
Date: Mon, 22 Jan 2018 15:52:13 +0000
Subject: Re: [PATCH] net: caif: remove redundant re-assignment of pointer pfrm
Message-Id: <20180122.105213.111724497958584270.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180122152543.14719-1-colin.king@canonical.com>
In-Reply-To: <20180122152543.14719-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: colin.king@canonical.com
Cc: dmitry.tarnyagin@lockless.no, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin King <colin.king@canonical.com>
Date: Mon, 22 Jan 2018 15:25:43 +0000

> From: Colin Ian King <colin.king@canonical.com>
> 
> The pointer pfrm is initialized and then later re-assigned the same
> value and hence the second assignment is redundant and can be removed.
> 
> Cleans up clang warning:
> drivers/net/caif/caif_hsi.c:222:6: warning: Value stored to 'pfrm'
> during its initialization is never read
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Ok, applied to net-next, thanks Colin.
