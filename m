From: David Miller <davem@davemloft.net>
Date: Tue, 07 May 2019 19:15:02 +0000
Subject: Re: [PATCH][next] net: mvpp2: cls: fix less than zero check on a u32 variable
Message-Id: <20190507.121502.2281459100872862589.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190505213814.4220-1-colin.king@canonical.com>
In-Reply-To: <20190505213814.4220-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: colin.king@canonical.com
Cc: maxime.chevallier@bootlin.com, antoine.tenart@bootlin.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin King <colin.king@canonical.com>
Date: Sun,  5 May 2019 22:38:14 +0100

> From: Colin Ian King <colin.king@canonical.com>
> 
> The signed return from the call to mvpp2_cls_c2_port_flow_index is being
> assigned to the u32 variable c2.index and then checked for a negative
> error condition which is always going to be false. Fix this by assigning
> the return to the int variable index and checking this instead.
> 
> Addresses-Coverity: ("Unsigned compared against 0")
> Fixes: 90b509b39ac9 ("net: mvpp2: cls: Add Classification offload support")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied.
