From: Stephen Boyd <sboyd@kernel.org>
Date: Tue, 06 Nov 2018 17:42:38 +0000
Subject: Re: [PATCH 4/8] clk: pistachio: constify clk_ops structures
Message-Id: <154152615887.88331.16540393147400413726@swboyd.mtv.corp.google.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1540619262-22681-1-git-send-email-Julia.Lawall@lip6.fr>
 <1540619262-22681-5-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1540619262-22681-5-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@lip6.fr>, Michael Turquette <mturquette@baylibre.com>
Cc: kernel-janitors@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org

Quoting Julia Lawall (2018-10-26 22:47:38)
> These clk_ops structures are only stored in the ops field of a
> clk_init_data structure.  This field is const, so the clk_ops
> structures can be const as well.
> 
> Identified and transformed using Coccinelle.
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>
> 
> ---

Applied to clk-next
