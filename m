From: Stephen Boyd <sboyd@kernel.org>
Date: Mon, 03 Aug 2020 20:53:36 +0000
Subject: Re: [PATCH] clk: drop unused function __clk_get_flags
Message-Id: <159648801691.1360974.3807233534486926682@swboyd.mtv.corp.google.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1596272022-14173-1-git-send-email-Julia.Lawall@inria.fr>
In-Reply-To: <1596272022-14173-1-git-send-email-Julia.Lawall@inria.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@inria.fr>, Michael Turquette <mturquette@baylibre.com>
Cc: kernel-janitors@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org

Quoting Julia Lawall (2020-08-01 01:53:42)
> The function __clk_get_flags has not been used since the April 2019
> commit a348f05361c9 ("ARM: omap2+: hwmod: drop CLK_IS_BASIC
> flag usage").  Other uses were removed in June 2015, eg by
> commit 98d8a60eccee ("clk: Convert __clk_get_flags() to
> clk_hw_get_flags()"), which shows how clk_hw_get_flags can easily
> be used instead.
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>
> 
> ---

Applied to clk-next
