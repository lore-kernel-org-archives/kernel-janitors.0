From: David Miller <davem@davemloft.net>
Date: Thu, 05 Jul 2018 10:33:15 +0000
Subject: Re: [PATCH] net: ethernet: sun: remove redundant variables adv and lpa
Message-Id: <20180705.193315.2106014813802269928.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180705093732.21650-1-colin.king@canonical.com>
In-Reply-To: <20180705093732.21650-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: colin.king@canonical.com
Cc: netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin King <colin.king@canonical.com>
Date: Thu,  5 Jul 2018 10:37:32 +0100

> From: Colin Ian King <colin.king@canonical.com>
> 
> Variables adv and lpa are being assigned but are never used hence they
> are redundant and can be removed.
> 
> Cleans up clang warnings:
> warning: variable 'lpa' set but not used [-Wunused-but-set-variable]
> warning: variable 'adv' set but not used [-Wunused-but-set-variable]
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

I think you can safely remove the register reads too, so please
do so.

Thanks.
