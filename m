From: David Miller <davem@davemloft.net>
Date: Wed, 19 Jun 2019 01:01:25 +0000
Subject: Re: [PATCH][V2] net: lio_core: fix potential sign-extension overflow on large shift
Message-Id: <20190618.210125.383827657449306914.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190617161249.28846-1-colin.king@canonical.com>
In-Reply-To: <20190617161249.28846-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: colin.king@canonical.com
Cc: dchickles@marvell.com, sburla@marvell.com, fmanlunas@marvell.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin King <colin.king@canonical.com>
Date: Mon, 17 Jun 2019 17:12:49 +0100

> From: Colin Ian King <colin.king@canonical.com>
> 
> Left shifting the signed int value 1 by 31 bits has undefined behaviour
> and the shift amount oq_no can be as much as 63.  Fix this by using
> BIT_ULL(oq_no) instead.
> 
> Addresses-Coverity: ("Bad shift operation")
> Fixes: f21fb3ed364b ("Add support of Cavium Liquidio ethernet adapters")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
> 
> V2: Use BIT_ULL(oq_no) instead of 1ULL << oq_no. Thanks to Dan Carpenter for
>     noting this is more appropriate.

Applied.
