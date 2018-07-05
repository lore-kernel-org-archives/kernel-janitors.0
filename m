From: David Miller <davem@davemloft.net>
Date: Thu, 05 Jul 2018 10:33:58 +0000
Subject: Re: [PATCH] net: tehuti: remove redundant pointer skb
Message-Id: <20180705.193358.448039267316905929.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180705095549.22042-1-colin.king@canonical.com>
In-Reply-To: <20180705095549.22042-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: colin.king@canonical.com
Cc: andy@greyhouse.net, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin King <colin.king@canonical.com>
Date: Thu,  5 Jul 2018 10:55:49 +0100

> From: Colin Ian King <colin.king@canonical.com>
> 
> Pointer skb is being assigned but is never used hence it is
> redundant and can be removed.
> 
> Cleans up clang warning:
> warning: variable 'skb' set but not used [-Wunused-but-set-variable]
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied.
