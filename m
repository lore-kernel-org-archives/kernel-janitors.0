From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 03 Oct 2017 20:25:37 +0000
Subject: Re: [PATCH 1/2] clk/versatile: Delete two error messages for a failed memory allocation in icst_clk_
Message-Id: <CACRpkdbQQKXYRMe+qvOfnN3ESex7NJ7RzfSfJsAQQpDeeEu9wg@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <66ff55fd-caae-9c98-197d-f6c3fe7a9c49@users.sourceforge.net> <fe677e31-35b3-fc18-e63a-0f3d24c9f926@users.sourceforge.net>
In-Reply-To: <fe677e31-35b3-fc18-e63a-0f3d24c9f926@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: linux-clk <linux-clk@vger.kernel.org>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Wed, Sep 27, 2017 at 9:39 PM, SF Markus Elfring
<elfring@users.sourceforge.net> wrote:

> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Wed, 27 Sep 2017 21:21:23 +0200
>
> Omit extra messages for a memory allocation failure in this function.
>
> This issue was detected by using the Coccinelle software.
>
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
