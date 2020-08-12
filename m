From: David Lechner <david@lechnology.com>
Date: Wed, 12 Aug 2020 16:06:42 +0000
Subject: Re: [PATCH] clk: davinci: Use the correct size when allocating memory
Message-Id: <4327a171-a937-c62e-ebad-9f92c0dea65d@lechnology.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200809144959.747986-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20200809144959.747986-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, nsekhar@ti.com, mturquette@baylibre.com, sboyd@kernel.org
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On 8/9/20 9:49 AM, Christophe JAILLET wrote:
> 'sizeof(*pllen)' should be used in place of 'sizeof(*pllout)' to avoid a
> small over-allocation.
> 
> Fixes: 2d1726915159 ("clk: davinci: New driver for davinci PLL clocks")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---

Reviewed-by: David Lechner <david@lechnology.com>
