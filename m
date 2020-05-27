From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 27 May 2020 05:49:08 +0000
Subject: Re: [PATCH] clk: versatile: remove redundant assignment to pointer clk
Message-Id: <CACRpkdb7s77aOnQxMQ=Gi9zcy_fz37PZ5E3+vk0=P5N8wjA6sw@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200526224116.63549-1-colin.king@canonical.com>
In-Reply-To: <20200526224116.63549-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>, kernel-janitors@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-clk <linux-clk@vger.kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>

On Wed, May 27, 2020 at 12:41 AM Colin King <colin.king@canonical.com> wrote:

> From: Colin Ian King <colin.king@canonical.com>
>
> The pointer clk is being initialized with a value that is never read
> and is being updated with a new value later on. The initialization
> is redundant and can be removed.
>
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
