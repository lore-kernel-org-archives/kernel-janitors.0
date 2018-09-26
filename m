From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 26 Sep 2018 07:42:00 +0000
Subject: Re: [PATCH] pinctrl: mediatek: fix check on EINT_NA comparison
Message-Id: <CACRpkdZC9L78P-vXvXsKndLAwOmeLDgSjf0+VzVfua-j+3GcDQ@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180925095556.19779-1-colin.king@canonical.com>
In-Reply-To: <20180925095556.19779-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-arm-kernel@lists.infradead.org

On Tue, Sep 25, 2018 at 11:55 AM Colin King <colin.king@canonical.com> wrote:

> From: Colin Ian King <colin.king@canonical.com>
>
> Currently, the check on desc->eint.eint_n = EINT_NA is always false
> because this is comparing a u16 to -1 which can never be true.  Fix
> this by casting EINT_NA to u16.
>
> Detected by CoverityScan, CID#1473610 ("Operands don't affect result")
>
> Fixes: fb5fa8dc151b ("pinctrl: mediatek: extend struct mtk_pin_desc to pinctrl-mtk-common-v2.c")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Patch applied.

Yours,
Linus Walleij
