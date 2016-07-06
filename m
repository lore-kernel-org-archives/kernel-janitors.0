From: Chen-Yu Tsai <wens@csie.org>
Date: Wed, 06 Jul 2016 06:06:04 +0000
Subject: Re: [PATCH] phy: sun9i-usb: fix error handling
Message-Id: <CAGb2v64D-AcrG8Xot79_7PnUKFnHonU65Crfw7QONj_TFLwv5A@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1467784806-17091-1-git-send-email-christophe.jaillet@wanadoo.fr>
In-Reply-To: <1467784806-17091-1-git-send-email-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-arm-kernel@lists.infradead.org

On Wed, Jul 6, 2016 at 2:00 PM, Christophe JAILLET
<christophe.jaillet@wanadoo.fr> wrote:
> This is likely that checking 'phy->hsic_clk' instead of 'phy->clk' is
> expected here.
>
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Acked-by: Chen-Yu Tsai <wens@csie.org>
