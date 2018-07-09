From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 09 Jul 2018 13:29:12 +0000
Subject: Re: [PATCH] pinctrl: nsp: off by ones in nsp_pinmux_enable()
Message-Id: <CACRpkdbxG9N+JQQGGfGAdzJQD70HgjrxyFQ1QQR714+c6jTcEA@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180703120425.jloiga5fcbdzcqpc@kili.mountain>
In-Reply-To: <20180703120425.jloiga5fcbdzcqpc@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Tue, Jul 3, 2018 at 2:04 PM Dan Carpenter <dan.carpenter@oracle.com> wrote:

> The > comparisons should be >= or else we read beyond the end of the
> pinctrl->functions[] array.
>
> Fixes: cc4fa83f66e9 ("pinctrl: nsp: add pinmux driver support for Broadcom NSP SoC")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Patch applied with Ray's ACK for fixes.

Yours,
Linus Walleij
