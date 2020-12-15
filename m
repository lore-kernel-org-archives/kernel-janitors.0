From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Tue, 15 Dec 2020 09:27:11 +0000
Subject: Re: [PATCH] clk: s2mps11: Fix a resource leak in error handling paths in the probe function
Message-Id: <20201215092711.GA29712@kozik-lap>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201212122818.86195-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20201212122818.86195-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: b.zolnierkie@samsung.com, mturquette@baylibre.com, sboyd@kernel.org, yadi.brar@samsung.com, mturquette@linaro.org, linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Sat, Dec 12, 2020 at 01:28:18PM +0100, Christophe JAILLET wrote:
> Some resource should be released in the error handling path of the probe
> function, as already done in the remove function.
> 
> The remove function was fixed in commit bf416bd45738 ("clk: s2mps11: Add
> missing of_node_put and of_clk_del_provider")
> 
> Fixes: 7cc560dea415 ("clk: s2mps11: Add support for s2mps11")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
>  drivers/clk/clk-s2mps11.c | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof
