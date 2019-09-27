From: David Miller <davem@davemloft.net>
Date: Fri, 27 Sep 2019 08:15:48 +0000
Subject: Re: [PATCH net] net: stmmac: dwmac-meson8b: Fix signedness bug in probe
Message-Id: <20190927.101548.1428184970448877652.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190925105822.GH3264@mwanda>
In-Reply-To: <20190925105822.GH3264@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: peppe.cavallaro@st.com, martin.blumenstingl@googlemail.com, alexandre.torgue@st.com, joabreu@synopsys.com, khilman@baylibre.com, mcoquelin.stm32@gmail.com, netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 25 Sep 2019 13:58:22 +0300

> The "dwmac->phy_mode" is an enum and in this context GCC treats it as
> an unsigned int so the error handling is never triggered.
> 
> Fixes: 566e82516253 ("net: stmmac: add a glue driver for the Amlogic Meson 8b / GXBB DWMAC")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied.
