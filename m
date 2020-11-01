From: Shawn Guo <shawnguo@kernel.org>
Date: Sun, 01 Nov 2020 09:27:06 +0000
Subject: Re: [PATCH] clk: imx: remove redundant assignment to pointer np
Message-Id: <20201101092705.GO31601@dragon>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201029224007.390762-1-colin.king@canonical.com>
In-Reply-To: <20201029224007.390762-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, NXP Linux Team <linux-imx@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>, linux-arm-kernel@lists.infradead.org

On Thu, Oct 29, 2020 at 10:40:07PM +0000, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Pointer np is being initialized with a value that is never read
> and it is being updated with a value later on. The initialization
> is redundant and can be removed.
> 
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied, thanks.
