From: Stephen Boyd <sboyd@kernel.org>
Date: Sat, 19 Dec 2020 23:53:37 +0000
Subject: Re: [PATCH] clk: s2mps11: Fix a resource leak in error handling paths in the probe function
Message-Id: <160842201799.1580929.7725454573395361171@swboyd.mtv.corp.google.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201212122818.86195-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20201212122818.86195-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, b.zolnierkie@samsung.com, krzk@kernel.org, mturquette@baylibre.com, mturquette@linaro.org, yadi.brar@samsung.com
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Quoting Christophe JAILLET (2020-12-12 04:28:18)
> Some resource should be released in the error handling path of the probe
> function, as already done in the remove function.
> 
> The remove function was fixed in commit bf416bd45738 ("clk: s2mps11: Add
> missing of_node_put and of_clk_del_provider")
> 
> Fixes: 7cc560dea415 ("clk: s2mps11: Add support for s2mps11")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---

Applied to clk-next
