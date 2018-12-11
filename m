From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 11 Dec 2018 09:48:12 +0000
Subject: Re: [PATCH][clk-next] clk: imx: remove redundant initialization of ret to zero
Message-Id: <20181211094812.GB3116@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20181209150832.9366-1-colin.king@canonical.com>
In-Reply-To: <20181209150832.9366-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, NXP Linux Team <linux-imx@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, linux-arm-kernel@lists.infradead.org

On Sun, Dec 09, 2018 at 03:08:32PM +0000, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The initialization of ret is redundant as it is being re-assigned to
> the return value from the call to imx8m_clk_composite_compute_dividers.
> Clean this up by removing the initialization.
> 

Just curious, is there a static checker which complains about this as
dead code?

regards,
dan carpenter
