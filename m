From: Stephen Boyd <sboyd@kernel.org>
Date: Tue, 06 Nov 2018 17:43:44 +0000
Subject: Re: [PATCH 6/8] clk: s2mps11: constify clk_ops structure
Message-Id: <154152622426.88331.17363838226504925494@swboyd.mtv.corp.google.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1540619262-22681-1-git-send-email-Julia.Lawall@lip6.fr>
 <1540619262-22681-7-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1540619262-22681-7-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@lip6.fr>, Sangbeom Kim <sbkim73@samsung.com>
Cc: kernel-janitors@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Michael Turquette <mturquette@baylibre.com>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org

Quoting Julia Lawall (2018-10-26 22:47:40)
> The clk_ops structure is only stored in the ops fields of
> clk_init_data structures.  This field is const, so the clk_ops
> structure can be const as well.
> 
> Identified and transformed using Coccinelle.
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>
> 
> ---

Applied to clk-next
