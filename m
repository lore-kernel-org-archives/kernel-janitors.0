From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 28 Aug 2012 00:25:51 +0000
Subject: Re: [PATCH 13/13] drivers/rtc/rtc-coh901331.c: use clk_prepare_enable and clk_disable_unprepare
Message-Id: <CACRpkdYm9kOSD_czm8Co1cXybzkPXRLHkPH5auN-fPhcBBs0gw@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1345996865-32082-1-git-send-email-Julia.Lawall@lip6.fr>
 <1345996865-32082-14-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1345996865-32082-14-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-arm-kernel@lists.infradead.org

On Sun, Aug 26, 2012 at 9:01 AM, Julia Lawall <Julia.Lawall@lip6.fr> wrote:

> I'm not sure about this.  Maybe it would be better to leave the disable and
> unprepare separated, since there is no matching nearby clk_prepare.

This is OK.
Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
