From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 17 Jun 2019 19:17:08 +0000
Subject: Re: [PATCH][V2] net: lio_core: fix potential sign-extension overflow on large shift
Message-Id: <20190617191708.GI28859@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190617161249.28846-1-colin.king@canonical.com>
In-Reply-To: <20190617161249.28846-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Derek Chickles <dchickles@marvell.com>, Satanand Burla <sburla@marvell.com>, Felix Manlunas <fmanlunas@marvell.com>, "David S . Miller" <davem@davemloft.net>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, Jun 17, 2019 at 05:12:49PM +0100, Colin King wrote:
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

Looks good.  Thanks!

Reviewed-by: Dan Carpenter <dan.carpenter@oracle.com>

regards,
dan carpenter
