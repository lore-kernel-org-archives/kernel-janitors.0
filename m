From: Stephen Boyd <sboyd@kernel.org>
Date: Wed, 19 Aug 2020 03:08:34 +0000
Subject: Re: [PATCH] clk: davinci: Use the correct size when allocating memory
Message-Id: <159780651426.334488.4846081923924152334@swboyd.mtv.corp.google.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200809144959.747986-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20200809144959.747986-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, david@lechnology.com, mturquette@baylibre.com, nsekhar@ti.com
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Quoting Christophe JAILLET (2020-08-09 07:49:59)
> 'sizeof(*pllen)' should be used in place of 'sizeof(*pllout)' to avoid a
> small over-allocation.
> 
> Fixes: 2d1726915159 ("clk: davinci: New driver for davinci PLL clocks")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---

Applied to clk-fixes
