From: Stephen Boyd <sboyd@kernel.org>
Date: Mon, 10 Dec 2018 17:53:21 +0000
Subject: Re: [PATCH][clk-next] clk: imx: remove redundant initialization of ret to zero
Message-Id: <154446440114.17204.3027564849049013270@swboyd.mtv.corp.google.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20181209150832.9366-1-colin.king@canonical.com>
In-Reply-To: <20181209150832.9366-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, Fabio Estevam <fabio.estevam@nxp.com>, Michael Turquette <mturquette@baylibre.com>, NXP Linux Team <linux-imx@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Quoting Colin King (2018-12-09 07:08:32)
> From: Colin Ian King <colin.king@canonical.com>
> 
> The initialization of ret is redundant as it is being re-assigned to
> the return value from the call to imx8m_clk_composite_compute_dividers.
> Clean this up by removing the initialization.
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---

Applied to clk-next
