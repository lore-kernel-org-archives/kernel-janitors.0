From: Stephen Boyd <sboyd@kernel.org>
Date: Tue, 15 May 2018 21:05:44 +0000
Subject: Re: [PATCH 05/61] clk: samsung: simplify getting .drvdata
Message-Id: <152641834430.237094.6970165334408131900@swboyd.mtv.corp.google.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180419140641.27926-1-wsa+renesas@sang-engineering.com>
 <20180419140641.27926-6-wsa+renesas@sang-engineering.com>
In-Reply-To: <20180419140641.27926-6-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-arm-kernel@lists.infradead.org

Quoting Wolfram Sang (2018-04-19 07:05:35)
> We should get drvdata from struct device directly. Going via
> platform_device is an unneeded step back and forth.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---

Applied to clk-next

