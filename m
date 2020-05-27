From: Stephen Boyd <sboyd@kernel.org>
Date: Wed, 27 May 2020 06:40:48 +0000
Subject: Re: [PATCH] clk: versatile: remove redundant assignment to pointer clk
Message-Id: <159056164860.88029.7554351167857846969@swboyd.mtv.corp.google.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200526224116.63549-1-colin.king@canonical.com>
In-Reply-To: <20200526224116.63549-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, Linus Walleij <linus.walleij@linaro.org>, Michael Turquette <mturquette@baylibre.com>, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Quoting Colin King (2020-05-26 15:41:16)
> From: Colin Ian King <colin.king@canonical.com>
> 
> The pointer clk is being initialized with a value that is never read
> and is being updated with a new value later on. The initialization
> is redundant and can be removed.
> 
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---

Applied to clk-next
