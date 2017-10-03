From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 03 Oct 2017 20:26:18 +0000
Subject: Re: [PATCH 2/2] clk/versatile: Improve a size determination in icst_clk_setup()
Message-Id: <CACRpkdaWQpjHhx+Jp5Ne-mZ110S-4iZ19TUYqwV2km0jbqTn6g@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <66ff55fd-caae-9c98-197d-f6c3fe7a9c49@users.sourceforge.net> <dfc5dcb1-2744-8fdb-b85d-8ff1bf06f56a@users.sourceforge.net>
In-Reply-To: <dfc5dcb1-2744-8fdb-b85d-8ff1bf06f56a@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: linux-clk <linux-clk@vger.kernel.org>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Wed, Sep 27, 2017 at 9:40 PM, SF Markus Elfring
<elfring@users.sourceforge.net> wrote:

> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Wed, 27 Sep 2017 21:24:43 +0200
>
> Replace the specification of a data structure by a pointer dereference
> as the parameter for the operator "sizeof" to make the corresponding size
> determination a bit safer according to the Linux coding style convention.
>
> This issue was detected by using the Coccinelle software.
>
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
