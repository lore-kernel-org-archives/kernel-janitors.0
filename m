From: David Miller <davem@davemloft.net>
Date: Sat, 03 Nov 2012 01:36:59 +0000
Subject: Re: [PATCH 2/2] drivers/net/phy/mdio-bitbang.c: Call mdiobus_unregister before mdiobus_free
Message-Id: <20121102.213659.999845508936675142.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1351440721-9121-1-git-send-email-peter.senna@gmail.com>
	<1351440721-9121-2-git-send-email-peter.senna@gmail.com>
In-Reply-To: <1351440721-9121-2-git-send-email-peter.senna@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: peter.senna@gmail.com
Cc: srinivas.kandagatla@st.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Peter Senna Tschudin <peter.senna@gmail.com>
Date: Sun, 28 Oct 2012 17:12:01 +0100

> Based on commit b27393aecf66199f5ddad37c302d3e0cfadbe6c0
> 
> Calling mdiobus_free without calling mdiobus_unregister causes
> BUG_ON(). This patch fixes the issue.
> 
> The semantic patch that found this issue(http://coccinelle.lip6.fr/):
> // <smpl>
> @@
> expression E;
> @@
>   ... when != mdiobus_unregister(E);
> 
> + mdiobus_unregister(E);
>   mdiobus_free(E);
> // </smpl>
> 
> Signed-off-by: Peter Senna Tschudin <peter.senna@gmail.com>

Applied.
