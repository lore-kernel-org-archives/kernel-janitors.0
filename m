From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 02 Jul 2018 14:06:02 +0000
Subject: Re: [PATCH][V2] pinctrl: actions: fix unsigned less than zero comparison
Message-Id: <CACRpkda2CkPFRPcpHSukBNjH+m6szCxq6Cfs+uK5fLHthQmZkg@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180702124708.7295-1-colin.king@canonical.com>
In-Reply-To: <20180702124708.7295-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-arm-kernel@lists.infradead.org

On Mon, Jul 2, 2018 at 2:47 PM Colin King <colin.king@canonical.com> wrote:

> From: Colin Ian King <colin.king@canonical.com>
>
> The check to see if platform_get_irq failed is performed on the
> unsigned value of pctrl->irq[i] and the check is never true because
> an unsigned cannot be less than zero.  Fix this by assinging the
> signed int ret to the return of platform_get_irq and checking ret
> instead.
>
> Detected by CoverityScan, CID#1470247 ("Unsigned comparison against 0")
>
> Fixes: 6c5d0736e9c0 ("pinctrl: actions: Add interrupt support for OWL S900 SoC")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>
> V2: move pctrl->irq[i] = ret assignment below the check on ret, thanks
> to Manivannan Sadhasivam for suggesting this change.

Patch applied with Manivannan's ACK!

(Hope it's the right version now.)

Yours,
Linus Walleij
