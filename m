From: David Miller <davem@davemloft.net>
Date: Wed, 29 Nov 2017 14:58:44 +0000
Subject: Re: [PATCH] net: via: via-rhine: use %p to format void * address instead of %x
Message-Id: <20171129.095844.388821862193219822.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20171129141149.21705-1-colin.king@canonical.com>
In-Reply-To: <20171129141149.21705-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: colin.king@canonical.com
Cc: netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin King <colin.king@canonical.com>
Date: Wed, 29 Nov 2017 14:11:49 +0000

> From: Colin Ian King <colin.king@canonical.com>
> 
> Don't use %x and casting to print out an address, instead use %p
> and remove the casting.  Cleans up smatch warnings:
> 
> drivers/net/ethernet/via/via-rhine.c:998 rhine_init_one_common()
> warn: argument 4 to %lx specifier is cast from pointer
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied.
