From: Stephen Boyd <sboyd@kernel.org>
Date: Tue, 06 Nov 2018 17:41:39 +0000
Subject: Re: [PATCH 1/8] clk: max77686: constify clk_ops structure
Message-Id: <154152609937.88331.11993895406323284065@swboyd.mtv.corp.google.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1540619262-22681-1-git-send-email-Julia.Lawall@lip6.fr>
 <1540619262-22681-2-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1540619262-22681-2-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Chanwoo Choi <cw00.choi@samsung.com>, Julia Lawall <Julia.Lawall@lip6.fr>
Cc: kernel-janitors@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Michael Turquette <mturquette@baylibre.com>, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org

Quoting Julia Lawall (2018-10-26 22:47:35)
> The clk_ops structure is only stored in the ops field of a
> clk_init_data structure.  This field is const, so the clk_ops
> structure can be const as well.
> 
> Identified and transformed using Coccinelle.
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>
> 
> ---

Applied to clk-next
