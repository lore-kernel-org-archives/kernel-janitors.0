From: David Miller <davem@davemloft.net>
Date: Fri, 27 Sep 2019 08:22:06 +0000
Subject: Re: [PATCH net] net: ethernet: stmmac: Fix signedness bug in ipq806x_gmac_of_parse()
Message-Id: <20190927.102206.1720435175604577653.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190925110554.GQ3264@mwanda>
In-Reply-To: <20190925110554.GQ3264@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: peppe.cavallaro@st.com, mathieu@codeaurora.org, alexandre.torgue@st.com, joabreu@synopsys.com, mcoquelin.stm32@gmail.com, netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 25 Sep 2019 14:05:54 +0300

> The "gmac->phy_mode" variable is an enum and in this context GCC will
> treat it as an unsigned int so the error handling will never be
> triggered.
> 
> Fixes: b1c17215d718 ("stmmac: add ipq806x glue layer")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied.
