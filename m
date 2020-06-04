From: David Miller <davem@davemloft.net>
Date: Thu, 04 Jun 2020 22:52:35 +0000
Subject: Re: [PATCH net-next] net: ethernet: dwmac: Fix an error code in imx_dwmac_probe()
Message-Id: <20200604.155235.1008812507143457607.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200603175025.GA19353@mwanda>
In-Reply-To: <20200603175025.GA19353@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: peppe.cavallaro@st.com, fugang.duan@nxp.com, alexandre.torgue@st.com, joabreu@synopsys.com, kuba@kernel.org, mcoquelin.stm32@gmail.com, shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com, netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 3 Jun 2020 20:50:25 +0300

> The code is return PTR_ERR(NULL) which is zero or success.  We should
> return -ENOMEM instead.
> 
> Fixes: 94abdad6974a5 ("net: ethernet: dwmac: add ethernet glue logic for NXP imx8 chip")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied.
